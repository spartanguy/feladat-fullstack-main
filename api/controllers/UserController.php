<?php

use Phalcon\Mvc\Controller;
use Phalcon\Http\Response;

class UserController extends BaseController
{
    public function listAction()
    {
        if($this->routeGuard('user.read')){
            $db = $this->getDI()->get('db');
            $result = $db->query(
                "SELECT 
                users.id, 
                users.name, 
                users.email, 
                COALESCE(STRING_AGG(permissions.name, ', '), 'Nincs jogosultság') AS permissions
                FROM users
                LEFT JOIN user_permissions ON users.id = user_permissions.user_id
                LEFT JOIN permissions ON user_permissions.permission_id = permissions.id
                GROUP BY users.id, users.name, users.email
                ORDER BY users.id;");
            $users = $result->fetchAll();
    
            return $this->response->setJsonContent($users);
        }
    }

    public function createAction()
    {
        if($this->routeGuard('user.write')){
            $data = $this->request->getJsonRawBody();
            $name = $data->name;
            $password = $this->security->hash($data->password);
            $email = $data->email;
            $permissions = $data->permissions;
            $db = $this->getDI()->get('db');
            $userId = $db->fetchColumn(
                "INSERT INTO users (name, email, password) VALUES (:name, :email, :password) RETURNING id",
                [
                    'name' => $name,
                    'email' => $email,
                    'password' => $password
                ]
            );
            foreach ($permissions as $key => $value) {
                $permId = $db->query("SELECT id FROM permissions WHERE code = :val", ["val" => $value]);
                $perm = $permId->fetch();
                
                if ($perm) { 
                    $db->execute(
                        "INSERT INTO user_permissions (user_id, permission_id) VALUES (:user_id, :permission_id)", 
                        [
                            'user_id' => $userId,
                            'permission_id' => $perm->id
                        ]
                    );
                }
            }
            return $this->response->setJsonContent(['message' => 'User created']);
        } 
    }

    public function readAction($id)
    {
        if($this->routeGuard('user.read')){
            $db = $this->getDI()->get('db');
            $result = $db->query("SELECT u.id AS user_id, 
                u.name, 
                u.email, 
                u.deleted, 
                array_agg(p.code) AS permissions
            FROM users u
            LEFT JOIN user_permissions up ON up.user_id = u.id
            LEFT JOIN permissions p ON p.id = up.permission_id
            WHERE u.id = :user_id
            GROUP BY u.id;", ['user_id' => $id]);
            $user = $result->fetch();
            if ($user) {
                $permissions = explode(',', trim($user->permissions, '{}'));
                $user->permissions = array_map('trim', $permissions);
                return $this->response->setJsonContent($user);
            } else {
                return $this->response->setStatusCode(404, 'User not found');
            }
        }
    }

    public function updateAction($id)
    {
        if ($this->routeGuard('user.write')) {
            $data = $this->request->getJsonRawBody();
            $name = $data->name;
            $password = $this->security->hash($data->password);
            $email = $data->email;
            $permissions = (array) $data->permissions;
            $db = $this->getDI()->get('db');

            var_dump($permissions);
            // 1️⃣ Felhasználó adatainak frissítése
            $db->execute(
                "UPDATE users SET name = :name, email = :email, password = :password WHERE id = :id",
                [
                    'name' => $name,
                    'email' => $email,
                    'password' => $password,
                    'id' => $id,
                ]
            );

            // 2️⃣ Meglévő jogosultságok lekérdezése
            $existingPermissions = $db->query(
                "SELECT p.code FROM user_permissions up 
                JOIN permissions p ON up.permission_id = p.id 
                WHERE up.user_id = :id",
                ['id' => $id]
            );
            $ePermissions = $existingPermissions->fetchAll();

            // Átalakítjuk egy egyszerű tömbbé a meglévő jogosultságokat
            $ePermissions = array_column($ePermissions, 'code');
            
            // Jogosultságok összehasonlítása
            $permissionsToAdd = array_diff($permissions, $ePermissions); 
            $permissionsToRemove = array_diff($ePermissions, $permissions); 

            
            // 3️⃣ Új jogosultságok beszúrása
            if (!empty($permissionsToAdd)) {
                foreach ($permissionsToAdd as $code) {
                    $permId = $db->query("SELECT id FROM permissions WHERE code = :code", ["code" => $code]);
                    $perm = $permId->fetch();

                    if ($perm) {
                        $db->execute(
                            "INSERT INTO user_permissions (user_id, permission_id) VALUES (:user_id, :permission_id)",
                            [
                                'user_id' => $id,
                                'permission_id' => $perm->id
                            ]
                        );
                    }
                }
            }

            // 4️⃣ Felesleges jogosultságok törlése (JAVÍTOTT RÉSZ)
            if (!empty($permissionsToRemove)) {
                // Jogosultság ID-k lekérdezése
                $placeholders = implode(',', array_fill(0, count($permissionsToRemove), '?'));
                $permIdsQuery = $db->query(
                    "SELECT id FROM permissions WHERE code IN ($placeholders)",
                    array_values($permissionsToRemove)
                );
                $permIds = $permIdsQuery->fetchAll(\Phalcon\Db\Enum::FETCH_COLUMN);
                if (!empty($permIds)) {
                    $placeholders = implode(',', array_fill(0, count($permIds), '?'));
                    $db->execute(
                        "DELETE FROM user_permissions WHERE user_id = ? AND permission_id IN ($placeholders)",
                        array_merge([$id], $permIds)
                    );
                }
            }
            return $this->response->setJsonContent(['message' => 'User updated']);
        }
    }


    public function deleteAction($id)
    {
        if($this->routeGuard('user.write')) { 
            $db = $this->getDI()->get('db');
            $db->execute("UPDATE users SET deleted = :deleted WHERE id = :id", ['id' => $id, 'deleted' => true]);
            return $this->response->setJsonContent(['message' => 'User deleted']);
        }
    }
}