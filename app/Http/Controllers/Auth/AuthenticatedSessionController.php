<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\AppBaseController;
use App\Http\Controllers\Controller;
use App\Http\Requests\Auth\LoginRequest;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class AuthenticatedSessionController extends AppBaseController
{
    /**
     * Handle an incoming authentication request.
     */
    public function store(LoginRequest $request)
    {
        
        $request->authenticate();

        $user = $request->user();

        $response = [
            "user" => $user
        ];

        $groups = DB::select("select a.*, b.nama 
        from sys_user_group a 
        join sys_group b on a.id_group = b.id_group
        where a.id_user = ?", [$user->id_user]);

        if (!count($groups))
            return $this->failValidationError("Username atau password salah !");

        if (count($groups) > 1) {
            $response['groups'] = $groups;
        } else {
            $id_group = $groups[0]->id_group;
            $request->session()->put("id_group", $id_group);
            list($access, $menu, $accessmethod) = $this->_getAccessMenu($id_group);
            $response['access'] = $access;
            $response['menu'] = $menu;
            $response['id_group'] = $id_group;
            $response['accessmethod'] = $accessmethod;
            $request->session()->regenerate();

        }
        return $this->respond($response, 200, 'success');
    }

    public function choseGroup(Request $request)
    {
        $id_group = $request->get("id_group");

        list($access, $menu, $accessmethod) = $this->_getAccessMenu($id_group);

        $response = [];
        $response['access'] = $access;
        $response['menu'] = $menu;
        $response['accessmethod'] = $accessmethod;

        $request->session()->put("id_group", $id_group);
        return $this->respond($response, 200, 'success');
    }

    private function _getAccessMenu($id_group)
    {
        $rows = DB::select("select * from sys_menu where exists (select 1 
        from sys_group_menu 
        where sys_menu.id_menu = sys_group_menu.id_menu 
        and id_group = " . DB::escape($id_group) . ") 
        and coalesce(sys_menu.deleted_at, now()) >= now()
        order by sort, id_menu");

        $menuarr = array();
        $menuarr1 = array();
        $access = array();
        $accessmethod = array();
        foreach ($rows as $r) {
            if ($r->nama)
                $menuarr[$r->id_menu] = $r;

            $menuarr1[$r->id_menu] = $r;
            $access[] = ["page" => $r->url];
            $accessmethod[$r->url]["index"] = true;
            $accessmethod[$r->url]["add"] = false;
            $accessmethod[$r->url]["edit"] = false;
            $accessmethod[$r->url]["delete"] = false;
        }

        $access[] = ["page" => "sub"];

        $menutarr = $menuarr;
        $menu = $this->_getChild($menutarr, null);

        $rows = DB::select("select * from sys_action 
        where exists (select 1 
        from sys_group_action where exists (
            select 1 from sys_group_menu 
            where sys_group_action.id_group_menu = sys_group_menu.id_group_menu
            and id_group = " . DB::escape($id_group) . "
        ))");

        foreach ($rows as $r) {
            if (!empty($menuarr[$r->id_menu]) && !empty($r->nama)) {
                $access[] = ["page" => $menuarr[$r->id_menu]->url . '_' . $r->nama];
                $accessmethod[$menuarr1[$r->id_menu]->url][$r->nama] = true;
            }
        }

        return array($access, $menu, $accessmethod);
    }

    private function _getChild(&$menuarr, $idparent = null)
    {
        $menu = array();
        foreach ($menuarr as $idmenu => $r) {
            if (!$r->is_show)
                continue;

            if ($r->id_parent_menu == $idparent) {
                unset($menuarr[$idmenu]);
                $submenu = $this->_getChild($menuarr, $idmenu);
                $menu[] = [
                    "id_menu" => $idmenu,
                    "id_prent_menu" => $r->id_parent_menu,
                    "page" => $r->url,
                    "label" => $r->nama,
                    "icon" => $r->icon,
                    'submenu' => $submenu
                ];
            }
        }

        if (!$idparent) {
            foreach ($menuarr as $idmenu => $r) {
                if (!$r->is_show)
                    continue;

                $menu[] = [
                    "id_menu" => $idmenu,
                    "id_prent_menu" => $r->id_parent_menu,
                    "page" => $r->url,
                    "label" => $r->nama,
                    "icon" => $r->icon,
                    'submenu' => $submenu
                ];
            }
        }

        return $menu;
    }

    /**
     * Destroy an authenticated session.
     */
    public function destroy(Request $request)
    {
        Auth::guard('web')->logout();

        $request->session()->invalidate();

        $request->session()->regenerateToken();

        return response()->noContent();
    }
}
