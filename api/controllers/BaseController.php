<?php

use Phalcon\Mvc\Controller;

class BaseController extends Controller
{
    public function initialize()
    {
        // CORS beállítások (engedélyezett források, metódusok, fejlécek)
        $this->response->setHeader('Access-Control-Allow-Origin', 'http://localhost:8630');
        $this->response->setHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, OPTIONS');
        $this->response->setHeader('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept, Authorization');
        $this->response->setHeader('Access-Control-Allow-Credentials', 'true');

        // Preflight OPTIONS kérés esetén válasz küldése és kilépés
        if ($this->request->isOptions()) {
            $this->response->setStatusCode(200, "OK");
            $this->response->send();
            exit;
        }
    }

    //Útvonalvédelem adott jogosultság ellenőrzésével
     
    protected function routeGuard($requiredPermission)
    {
        $token = $this->request->getHeader('Authorization');

        if (!$token) {
            $this->dispatcher->forward([
                'controller' => 'error',
                'action' => 'unauthorized'
            ]);
            return false; 
        }

        $db = $this->getDI()->get('db');

        // Token ellenőrzése és session keresése
        $result = $db->query(
            "SELECT * FROM user_sessions WHERE token = :token AND expires_at > :now",
            [
                'token' => $token,
                'now'   => date('Y-m-d H:i:s'),
            ]
        );
        $session = $result->fetch();

        if (!$session) {
            $this->dispatcher->forward([
                'controller' => 'error',
                'action' => 'unauthorized'
            ]);
            return false; 
        }

        // Felhasználó adatainak lekérése
        $result = $db->query(
            "SELECT * FROM users WHERE id = :user_id",
            ['user_id' => $session->user_id]
        );
        $user = $result->fetch();

        if (!$user || !$this->hasPermission($user, $requiredPermission)) {
            $this->dispatcher->forward([
                'controller' => 'error',
                'action' => 'forbidden'
            ]);
            return false; 
        }
        return true;
    }

     //Ellenőrzi, hogy a felhasználó rendelkezik-e a szükséges jogosultsággal
    protected function hasPermission($user, $requiredPermission)
    {
        $db = $this->getDI()->get('db');

        // Jogosultságok lekérdezése az adott felhasználóra
        $result = $db->query(
            "SELECT p.code FROM permissions p
             JOIN user_permissions up ON p.id = up.permission_id
             WHERE up.user_id = :user_id",
            ['user_id' => $user->id]
        );
        $permissions = $result->fetchAll();

        // Jogosultságok végigellenőrzése
        foreach ($permissions as $permission) {
            if ($permission->code === $requiredPermission) {
                return true;
            }
        }

        return false;
    }
}