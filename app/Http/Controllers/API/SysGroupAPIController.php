<?php

namespace App\Http\Controllers\API;

use App\Http\Requests\API\CreateSysGroupAPIRequest;
use App\Http\Requests\API\UpdateSysGroupAPIRequest;
use App\Models\SysGroup;
use App\Models\SysGroupAction;
use App\Repositories\SysGroupRepository;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use App\Http\Controllers\AppBaseController;

/**
 * Class SysGroupAPIController
 */
class SysGroupAPIController extends AppBaseController
{
    private SysGroupRepository $sysGroupRepository;

    public function __construct(SysGroupRepository $sysGroupRepo)
    {
        $this->sysGroupRepository = $sysGroupRepo;
    }

    /**
     * Display a listing of the SysGroups.
     * GET|HEAD /sys-groups
     */
    public function index(Request $request): JsonResponse
    {
        $sysGroups = $this->sysGroupRepository->all(
            $request->except(['skip', 'limit']),
            $request->get('skip'),
            $request->get('limit')
        );

        return $this->sendResponse($sysGroups->toArray(), 'Sys Groups retrieved successfully');
    }

    /**
     * Store a newly created SysGroup in storage.
     * POST /sys-groups
     */
    public function store(CreateSysGroupAPIRequest $request): JsonResponse
    {
        $input = $request->all();

        $sysGroup = $this->sysGroupRepository->create($input);

        return $this->sendResponse($sysGroup->toArray(), 'Sys Group saved successfully');
    }

    /**
     * Display the specified SysGroup.
     * GET|HEAD /sys-groups/{id}
     */
    public function show($id): JsonResponse
    {
        /** @var SysGroup $sysGroup */
        $sysGroup = $this->sysGroupRepository->find($id);

        if (empty($sysGroup)) {
            return $this->sendError('Sys Group not found');
        }

        return $this->sendResponse($sysGroup->toArray(), 'Sys Group retrieved successfully');
    }

    /**
     * Update the specified SysGroup in storage.
     * PUT/PATCH /sys-groups/{id}
     */
    public function update($id, UpdateSysGroupAPIRequest $request): JsonResponse
    {
        $input = $request->all();

        /** @var SysGroup $sysGroup */
        $sysGroup = $this->sysGroupRepository->find($id);

        if (empty($sysGroup)) {
            return $this->sendError('Sys Group not found');
        }

        $sysGroup = $this->sysGroupRepository->update($input, $id);

        return $this->sendResponse($sysGroup->toArray(), 'SysGroup updated successfully');
    }

    /**
     * Remove the specified SysGroup from storage.
     * DELETE /sys-groups/{id}
     *
     * @throws \Exception
     */
    public function destroy($id): JsonResponse
    {
        /** @var SysGroup $sysGroup */
        $sysGroup = $this->sysGroupRepository->find($id);

        if (empty($sysGroup)) {
            return $this->sendError('Sys Group not found');
        }

        $sysGroup->delete();

        return $this->sendSuccess('Sys Group deleted successfully');
    }

    #function pindahan ci4
    public function setmenu($id_group = null)
    {
        $groupmenuModel = new \App\Models\SysGroupMenu();
        $groupactionModel = new \App\Models\SysGroupAction();

        $ret = true;
        $groupactionModel->db->transStart();
        $rows = $groupmenuModel->where("id_group", $id_group)->findAll();
        foreach ($rows as $r) {
            if (!$ret)
                break;

            $ret = $groupactionModel->db->query('delete from sys_group_action where id_group_menu = ' . $r->id_group_menu);
        }
        if ($ret)
            $ret = $groupmenuModel->db->query("delete from sys_group_menu where id_group = " . $id_group);

        $data = $this->request->getJSON();
        if ($ret)
            $ret = $this->_setmenu($groupmenuModel, $groupactionModel, $data, $id_group);

        if ($ret) {
            $groupactionModel->db->transCommit();
            return $this->respond(['success' => true]);
        } else {
            $groupactionModel->db->transRollback();
            return $this->fail(['errorr' => true]);
        }
    }

    private function _setmenu($groupmenuModel, $groupactionModel, $data, $id_group)
    {
        $ret = true;
        foreach ($data as $d) {
            if (!$ret)
                break;

            if ($d->action)
                foreach ($d->action as $da) {
                    if ($da->selected) {
                        $d->selected = 1;
                    }
                }

            if ($d->selected) {
                $ret = $id_group_menu = $groupmenuModel->insert(["id_group" => $id_group, "id_menu" => $d->id_menu]);
                if ($d->action)
                    foreach ($d->action as $da) {
                        if (!$ret)
                            break;

                        if ($da->selected) {
                            $ret = $groupactionModel->insert(["id_group_menu" => $id_group_menu, "id_action" => $da->id_action]);
                        }
                    }
            }
            if ($d->submenu && $ret) {
                $ret = $this->_setmenu($groupmenuModel, $groupactionModel, $d->submenu, $id_group);
            }
        }
        return $ret;
    }
    public function getmenu($id_group = null)
    {

        $menuModel = new \App\Models\SysMenu();
        $actionModel = new \App\Models\SysAction();

        $rows = $menuModel->orderBy("sort, id_menu")->findAll();

        $menuarr = array();
        $menuarr1 = array();
        foreach ($rows as $r) {
            if ($r->nama)
                $menuarr[$r->id_menu] = $r;

            $menuarr1[$r->id_menu] = $r;
        }


        $menutarr = $menuarr;
        $menu = $this->_getChild($menutarr, $id_group, null);

        // return array($menu);
        return $this->respond($menu);
    }

    private function _getChild(&$menuarr, $id_group, $idparent = null)
    {
        $actionModel = new \App\Models\SysAction();
        $groupmenuModel = new \App\Models\SysGroupMenu();
        $menu = array();
        // $rows = $actionModel->where("exists (select 1 
        // from sys_group_action where exists (
        //     select 1 from sys_group_menu where sys_group_action.id_group_menu = sys_group_menu.id_group_menu
        //     and id_group = " . $menuModel->db->escape($id_group) . "
        // ))")->findAll();

        foreach ($menuarr as $idmenu => $r) {
            $action = array();
            $groupmenu = $groupmenuModel->where("id_menu", $idmenu)->where("id_group", $id_group)->first();

            $action = $actionModel->select("sys_action.*, 
            case when sys_group_action.id_action is not null then 1 
            else 0 end as selected ", FALSE)->join("sys_group_action", "sys_group_action.id_action = sys_action.id_action and 
            sys_group_action.id_group_menu = coalesce(" . $actionModel->db->escape($groupmenu->id_group_menu) . ", 0)", "left")->where("id_menu", $idmenu)->findAll();


            if ($r->id_parent_menu == $idparent) {
                unset($menuarr[$idmenu]);
                $submenu = $this->_getChild($menuarr, $id_group, $idmenu);
                $menu[] = [
                    "page" => $r->url,
                    "id_menu" => $idmenu,
                    "label" => $r->nama,
                    "icon" => $r->icon,
                    'submenu' => $submenu,
                    "action" => $action,
                    "selected" => ($groupmenu->id_group_menu ? 1 : 0)
                ];
            }
        }

        if (!$idparent) {
            foreach ($menuarr as $idmenu => $r) {
                $groupmenu = $groupmenuModel->where("id_menu", $idmenu)->where("id_group", $id_group)->first();

                $action = array();

                $action = $actionModel->select("sys_action.*, 
            case when sys_group_action.id_action is not null then 1 
            else 0 end as selected ", FALSE)->join("sys_group_action", "sys_group_action.id_action = sys_action.id_action and 
            sys_group_action.id_group_menu = coalesce(" . $actionModel->db->escape($groupmenu->id_group_menu) . ", 0)", "left")->where("id_menu", $idmenu)->findAll();

                $menu[] = [
                    "page" => $r->url,
                    "id_menu" => $idmenu,
                    "label" => $r->nama,
                    "icon" => $r->icon,
                    'submenu' => $submenu,
                    "action" => $action,
                    "selected" => ($groupmenu->id_group_menu ? 1 : 0)
                ];
            }
        }

        return $menu;
    }
}
