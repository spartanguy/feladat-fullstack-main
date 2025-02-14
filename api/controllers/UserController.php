<?php

use Phalcon\Mvc\Controller;
use Phalcon\Http\Response;

class UserController extends BaseController
{
    public function listAction()
    {
        if($this->routeGuard('user.read')){
            $db = $this->getDI()->get('db');
            $result = $db->query("SELECT * FROM users");
            $users = $result->fetchAll();
    
            return $this->response->setJsonContent($users);
        }
    }

    public function createAction()
    {
        if($this->routeGuard('user.write')){
            /*$name = $this->request->getPost('name');
            $password = $this->security->hash($this->request->getPost('password'));
            $email = $this->request->getPost('email');*/
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
        if($this->routeGuard('read_user')){
            $db = $this->getDI()->get('db');
            $result = $db->query("SELECT * FROM users WHERE id = :id", ['id' => $id]);
            $user = $result->fetch();

            if ($user) {
                return $this->response->setJsonContent($user);
            } else {
                return $this->response->setStatusCode(404, 'User not found');
            }
        }
    }

    public function updateAction($id)
    {
        if($this->routeGuard('update_user')){
            $name = $this->request->getPut('name');
            $email = $this->request->getPut('email');
            $password = $this->request->getPut('password');

            $db = $this->getDI()->get('db');
            $db->execute(
                "UPDATE users SET name = :name, email = :email, password = :password WHERE id = :id",
                [
                    'name' => $name,
                    'email'    => $email,
                    'password' => $this->security->hash($password),
                    'id'       => $id,
                ]
            );
            return $this->response->setJsonContent(['message' => 'User updated']);
        }
    }

    public function deleteAction($id)
    {
        if($this->routeGuard('delete_user')) { 
            $db = $this->getDI()->get('db');
            $db->execute("DELETE FROM users WHERE id = :id", ['id' => $id]);
            return $this->response->setJsonContent(['message' => 'User deleted']);
        }
    }
}