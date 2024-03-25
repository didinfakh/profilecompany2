<?php

namespace App\Http\Controllers\API;

use App\Http\Requests\API\CreateSysGroupAPIRequest;
use App\Http\Requests\API\UpdateSysGroupAPIRequest;
use App\Models\SysGroup;
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
}
