<?php

namespace App\Http\Controllers\API;

use App\Http\Requests\API\CreateSysGroupMenuAPIRequest;
use App\Http\Requests\API\UpdateSysGroupMenuAPIRequest;
use App\Models\SysGroupMenu;
use App\Repositories\SysGroupMenuRepository;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use App\Http\Controllers\AppBaseController;

/**
 * Class SysGroupMenuAPIController
 */
class SysGroupMenuAPIController extends AppBaseController
{
    private SysGroupMenuRepository $sysGroupMenuRepository;

    public function __construct(SysGroupMenuRepository $sysGroupMenuRepo)
    {
        $this->sysGroupMenuRepository = $sysGroupMenuRepo;
    }

    /**
     * Display a listing of the SysGroupMenus.
     * GET|HEAD /sys-group-menus
     */
    public function index(Request $request): JsonResponse
    {
        $sysGroupMenus = $this->sysGroupMenuRepository->all(
            $request->except(['skip', 'limit']),
            $request->get('skip'),
            $request->get('limit')
        );

        return $this->sendResponse($sysGroupMenus->toArray(), 'Sys Group Menus retrieved successfully');
    }

    /**
     * Store a newly created SysGroupMenu in storage.
     * POST /sys-group-menus
     */
    public function store(CreateSysGroupMenuAPIRequest $request): JsonResponse
    {
        $input = $request->all();

        $sysGroupMenu = $this->sysGroupMenuRepository->create($input);

        return $this->sendResponse($sysGroupMenu->toArray(), 'Sys Group Menu saved successfully');
    }

    /**
     * Display the specified SysGroupMenu.
     * GET|HEAD /sys-group-menus/{id}
     */
    public function show($id): JsonResponse
    {
        /** @var SysGroupMenu $sysGroupMenu */
        $sysGroupMenu = $this->sysGroupMenuRepository->find($id);

        if (empty($sysGroupMenu)) {
            return $this->sendError('Sys Group Menu not found');
        }

        return $this->sendResponse($sysGroupMenu->toArray(), 'Sys Group Menu retrieved successfully');
    }

    /**
     * Update the specified SysGroupMenu in storage.
     * PUT/PATCH /sys-group-menus/{id}
     */
    public function update($id, UpdateSysGroupMenuAPIRequest $request): JsonResponse
    {
        $input = $request->all();

        /** @var SysGroupMenu $sysGroupMenu */
        $sysGroupMenu = $this->sysGroupMenuRepository->find($id);

        if (empty($sysGroupMenu)) {
            return $this->sendError('Sys Group Menu not found');
        }

        $sysGroupMenu = $this->sysGroupMenuRepository->update($input, $id);

        return $this->sendResponse($sysGroupMenu->toArray(), 'SysGroupMenu updated successfully');
    }

    /**
     * Remove the specified SysGroupMenu from storage.
     * DELETE /sys-group-menus/{id}
     *
     * @throws \Exception
     */
    public function destroy($id): JsonResponse
    {
        /** @var SysGroupMenu $sysGroupMenu */
        $sysGroupMenu = $this->sysGroupMenuRepository->find($id);

        if (empty($sysGroupMenu)) {
            return $this->sendError('Sys Group Menu not found');
        }

        $sysGroupMenu->delete();

        return $this->sendSuccess('Sys Group Menu deleted successfully');
    }
}
