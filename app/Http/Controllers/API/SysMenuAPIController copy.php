<?php

namespace App\Http\Controllers\API;

use App\Http\Requests\API\CreateSysMenuAPIRequest;
use App\Http\Requests\API\UpdateSysMenuAPIRequest;
use App\Models\SysMenu;
use App\Repositories\SysMenuRepository;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use App\Http\Controllers\AppBaseController;

/**
 * Class SysMenuAPIController
 */
class SysMenuAPIController extends AppBaseController
{
    private SysMenuRepository $sysMenuRepository;

    public function __construct(SysMenuRepository $sysMenuRepo)
    {
        $this->sysMenuRepository = $sysMenuRepo;
    }

    /**
     * Display a listing of the SysMenus.
     * GET|HEAD /sys-menus
     */
    public function index(Request $request): JsonResponse
    {
        $sysMenus = $this->sysMenuRepository->all(
            $request->except(['skip', 'limit']),
            $request->get('skip'),
            $request->get('limit')
        );

        return $this->sendResponse($sysMenus->toArray(), 'Sys Menus retrieved successfully');
    }

    /**
     * Store a newly created SysMenu in storage.
     * POST /sys-menus
     */
    public function store(CreateSysMenuAPIRequest $request): JsonResponse
    {
        $input = $request->all();

        $sysMenu = $this->sysMenuRepository->create($input);

        return $this->sendResponse($sysMenu->toArray(), 'Sys Menu saved successfully');
    }

    /**
     * Display the specified SysMenu.
     * GET|HEAD /sys-menus/{id}
     */
    public function show($id): JsonResponse
    {
        /** @var SysMenu $sysMenu */
        $sysMenu = $this->sysMenuRepository->find($id);

        if (empty($sysMenu)) {
            return $this->sendError('Sys Menu not found');
        }

        return $this->sendResponse($sysMenu->toArray(), 'Sys Menu retrieved successfully');
    }

    /**
     * Update the specified SysMenu in storage.
     * PUT/PATCH /sys-menus/{id}
     */
    public function update($id, UpdateSysMenuAPIRequest $request): JsonResponse
    {
        $input = $request->all();

        /** @var SysMenu $sysMenu */
        $sysMenu = $this->sysMenuRepository->find($id);

        if (empty($sysMenu)) {
            return $this->sendError('Sys Menu not found');
        }

        $sysMenu = $this->sysMenuRepository->update($input, $id);

        return $this->sendResponse($sysMenu->toArray(), 'SysMenu updated successfully');
    }

    /**
     * Remove the specified SysMenu from storage.
     * DELETE /sys-menus/{id}
     *
     * @throws \Exception
     */
    public function destroy($id): JsonResponse
    {
        /** @var SysMenu $sysMenu */
        $sysMenu = $this->sysMenuRepository->find($id);

        if (empty($sysMenu)) {
            return $this->sendError('Sys Menu not found');
        }

        $sysMenu->delete();

        return $this->sendSuccess('Sys Menu deleted successfully');
    }
}
