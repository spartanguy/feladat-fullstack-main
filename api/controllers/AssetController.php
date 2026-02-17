<?php

class AssetController extends BaseController
{
    public function listAction()
    {
        if ($this->routeGuard('asset.read')) {
            $db = $this->getDI()->get('db');
            $result = $db->query(
                "SELECT 
                    a.id,
                    a.name,
                    a.description,
                    a.expires_at,
                    COALESCE(array_agg(u.id) FILTER (WHERE u.id IS NOT NULL), '{}') AS user_ids,
                    COALESCE(array_agg(u.name) FILTER (WHERE u.id IS NOT NULL), '{}') AS user_names
                FROM assets a
                LEFT JOIN user_assets ua ON ua.asset_id = a.id
                LEFT JOIN users u ON u.id = ua.user_id AND u.deleted = false
                WHERE a.deleted = false
                GROUP BY a.id
                ORDER BY a.id"
            );

            $assets = $result->fetchAll();

            foreach ($assets as $asset) {
                $asset->user_ids = $this->parsePgArray($asset->user_ids);
                $asset->user_names = $this->parsePgArray($asset->user_names);
            }

            return $this->response->setJsonContent($assets);
        }
    }

    public function createAction()
    {
        if ($this->routeGuard('asset.write')) {
            $data = $this->request->getJsonRawBody();

            $db = $this->getDI()->get('db');
            $db->execute(
                "INSERT INTO assets (name, description, expires_at) VALUES (:name, :description, :expires_at)",
                [
                    'name' => $data->name,
                    'description' => $data->description,
                    'expires_at' => $data->expires_at,
                ]
            );

            return $this->response->setJsonContent(['message' => 'Asset created']);
        }
    }

    public function deleteAction($id)
    {
        if ($this->routeGuard('asset.write')) {
            $db = $this->getDI()->get('db');
            $db->execute("UPDATE assets SET deleted = true WHERE id = :id", ['id' => $id]);
            return $this->response->setJsonContent(['message' => 'Asset deleted']);
        }
    }

    public function assignAction()
    {
        if ($this->routeGuard('asset.write')) {
            $data = $this->request->getJsonRawBody();
            $db = $this->getDI()->get('db');

            $exists = $db->query(
                "SELECT id FROM user_assets WHERE user_id = :user_id AND asset_id = :asset_id",
                [
                    'user_id' => $data->user_id,
                    'asset_id' => $data->asset_id,
                ]
            )->fetch();

            if (!$exists) {
                $db->execute(
                    "INSERT INTO user_assets (user_id, asset_id) VALUES (:user_id, :asset_id)",
                    [
                        'user_id' => $data->user_id,
                        'asset_id' => $data->asset_id,
                    ]
                );
            }

            return $this->response->setJsonContent(['message' => 'Asset assigned']);
        }
    }

    public function unassignAction()
    {
        if ($this->routeGuard('asset.write')) {
            $data = $this->request->getJsonRawBody();
            $db = $this->getDI()->get('db');

            $db->execute(
                "DELETE FROM user_assets WHERE user_id = :user_id AND asset_id = :asset_id",
                [
                    'user_id' => $data->user_id,
                    'asset_id' => $data->asset_id,
                ]
            );

            return $this->response->setJsonContent(['message' => 'Asset unassigned']);
        }
    }

    private function parsePgArray($value)
    {
        if (is_array($value)) {
            return $value;
        }

        $trimmed = trim((string)$value, '{}');
        if ($trimmed === '') {
            return [];
        }

        return array_map('trim', explode(',', $trimmed));
    }
}
