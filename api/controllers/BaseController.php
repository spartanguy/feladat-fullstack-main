<?php

use Phalcon\Mvc\Controller;
use Phalcon\Http\Response;

class BaseController extends Controller
{
    public function initialize()
    {
        $this->response->setHeader('Access-Control-Allow-Origin', 'http://localhost:8630');
        $this->response->setHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, OPTIONS');
        $this->response->setHeader('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept, Authorization');
        $this->response->setHeader('Access-Control-Allow-Credentials', 'true');
    
        if ($this->request->isOptions()) {
            $this->response->setStatusCode(200, "OK");
            $this->response->send();
            exit;
        }
    }

    protected function routeGuard($requiredPermission)
    {
        $token = $this->request->getHeader('Authorization');

        if (!$token) {
            error_log("1");
            $this->response->setStatusCode(401, 'Unauthorized')
                ->setJsonContent(['error' => 'Token is missing']);
            return false; 
        }

        $db = $this->getDI()->get('db');
        $result = $db->query(
            "SELECT * FROM user_sessions WHERE token = :token AND expires_at > :now",
            [
                'token' => $token,
                'now'   => date('Y-m-d H:i:s'),
            ]
        );
        $session = $result->fetch();

        if (!$session) {
            error_log("2");
            $this->response->setStatusCode(401, 'Unauthorized')
                ->setJsonContent(['error' => 'Token is missing']);
            return false; 
        }

        $result = $db->query(
            "SELECT * FROM users WHERE id = :user_id",
            ['user_id' => $session->user_id]
        );
        $user = $result->fetch();

        if (!$user || !$this->hasPermission($user, $requiredPermission)) {
            error_log("3");
            $this->response->setStatusCode(403, 'Forbidden')
                ->setJsonContent(['error' => 'Insufficient permissions']);
            return false;
        }
        return true;
    }

    protected function hasPermission($user, $requiredPermission)
    {
        $db = $this->getDI()->get('db');
        $result = $db->query(
            "SELECT p.code FROM permissions p
             JOIN user_permissions up ON p.id = up.permission_id
             WHERE up.user_id = :user_id",
            ['user_id' => $user->id]
        );
        $permissions = $result->fetchAll();

        foreach ($permissions as $permission) {
            if ($permission->code === $requiredPermission) {
                return true;
            }
        }
        return false;
    }
}