<?php

class UserController extends BaseController
{
    function listAction()
    {
        $response = (object)[];

        $response->people = $this->db->query("SELECT * FROM users WHERE deleted = false")->fetchAll();

        return $this->response->setJsonContent($response);
    }
}
