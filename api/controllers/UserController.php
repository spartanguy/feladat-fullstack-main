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

            $db = $this->getDI()->get('db');
            $db->execute(
                "INSERT INTO users (name, password, email) VALUES (:name, :password, :email)",
                [
                    'name' => $name,
                    'password' => $password,
                    'email'    => $email,
                ]
            );
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
                var_dump($user);
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
        if($this->routeGuard('user.write')){

            $data = $this->request->getJsonRawBody();
            $name = $data->name;
            $password = $this->security->hash($data->password);
            $email = $data->email;

            $db = $this->getDI()->get('db');
            $db->execute(
                "UPDATE users SET name = :name, email = :email, password = :password WHERE id = :id",
                [
                    'name' => $name,
                    'email'    => $email,
                    'password' => $password,
                    'id'       => $id,
                ]
            );
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