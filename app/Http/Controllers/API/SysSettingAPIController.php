<?php

namespace App\Http\Controllers\API;

use App\Http\Requests\API\CreateSysSettingAPIRequest;
use App\Http\Requests\API\UpdateSysSettingAPIRequest;
use App\Models\SysSetting;
use App\Repositories\SysSettingRepository;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use App\Http\Controllers\AppBaseController;

/**
 * Class SysSettingAPIController
 */
class SysSettingAPIController extends AppBaseController
{
    private SysSettingRepository $sysSettingRepository;

    public function __construct(SysSettingRepository $sysSettingRepo)
    {
        $this->sysSettingRepository = $sysSettingRepo;
    }

    /**
     * Display a listing of the SysSettings.
     * GET|HEAD /sys-settings
     */
    public function index(Request $request): JsonResponse
    {
        $sysSettings = $this->sysSettingRepository->all(
            $request->except(['skip', 'limit']),
            $request->get('skip'),
            $request->get('limit')
        );

        return $this->sendResponse($sysSettings->toArray(), 'Sys Settings retrieved successfully');
    }

    /**
     * Store a newly created SysSetting in storage.
     * POST /sys-settings
     */
    public function store(CreateSysSettingAPIRequest $request): JsonResponse
    {
        $input = $request->all();

        $sysSetting = $this->sysSettingRepository->create($input);

        return $this->sendResponse($sysSetting->toArray(), 'Sys Setting saved successfully');
    }

    /**
     * Display the specified SysSetting.
     * GET|HEAD /sys-settings/{id}
     */
    public function show($id): JsonResponse
    {
        /** @var SysSetting $sysSetting */
        $sysSetting = $this->sysSettingRepository->find($id);

        if (empty($sysSetting)) {
            return $this->sendError('Sys Setting not found');
        }

        return $this->sendResponse($sysSetting->toArray(), 'Sys Setting retrieved successfully');
    }

    /**
     * Update the specified SysSetting in storage.
     * PUT/PATCH /sys-settings/{id}
     */
    public function update($id, UpdateSysSettingAPIRequest $request): JsonResponse
    {
        $input = $request->all();

        /** @var SysSetting $sysSetting */
        $sysSetting = $this->sysSettingRepository->find($id);

        if (empty($sysSetting)) {
            return $this->sendError('Sys Setting not found');
        }

        $sysSetting = $this->sysSettingRepository->update($input, $id);

        return $this->sendResponse($sysSetting->toArray(), 'SysSetting updated successfully');
    }

    /**
     * Remove the specified SysSetting from storage.
     * DELETE /sys-settings/{id}
     *
     * @throws \Exception
     */
    public function destroy($id): JsonResponse
    {
        /** @var SysSetting $sysSetting */
        $sysSetting = $this->sysSettingRepository->find($id);

        if (empty($sysSetting)) {
            return $this->sendError('Sys Setting not found');
        }

        $sysSetting->delete();

        return $this->sendSuccess('Sys Setting deleted successfully');
    }
}
