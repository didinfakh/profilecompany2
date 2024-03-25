<?php

namespace App\Http\Controllers\API;

use App\Http\Requests\API\CreateSysActionAPIRequest;
use App\Http\Requests\API\UpdateSysActionAPIRequest;
use App\Models\SysAction;
use App\Repositories\SysActionRepository;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use App\Http\Controllers\AppBaseController;

/**
 * Class SysActionAPIController
 */
class SysActionAPIController extends AppBaseController
{
    private SysActionRepository $sysActionRepository;

    public function __construct(SysActionRepository $sysActionRepo)
    {
        $this->sysActionRepository = $sysActionRepo;
    }

    /**
     * Display a listing of the SysActions.
     * GET|HEAD /sys-actions
     */
    public function index(Request $request): JsonResponse
    {
        $sysActions = $this->sysActionRepository->all(
            $request->except(['skip', 'limit']),
            $request->get('skip'),
            $request->get('limit')
        );

        return $this->sendResponse($sysActions->toArray(), 'Sys Actions retrieved successfully');
    }

    /**
     * Store a newly created SysAction in storage.
     * POST /sys-actions
     */
    public function store(CreateSysActionAPIRequest $request): JsonResponse
    {
        $input = $request->all();

        $sysAction = $this->sysActionRepository->create($input);

        return $this->sendResponse($sysAction->toArray(), 'Sys Action saved successfully');
    }

    /**
     * Display the specified SysAction.
     * GET|HEAD /sys-actions/{id}
     */
    public function show($id): JsonResponse
    {
        /** @var SysAction $sysAction */
        $sysAction = $this->sysActionRepository->find($id);

        if (empty($sysAction)) {
            return $this->sendError('Sys Action not found');
        }

        return $this->sendResponse($sysAction->toArray(), 'Sys Action retrieved successfully');
    }

    /**
     * Update the specified SysAction in storage.
     * PUT/PATCH /sys-actions/{id}
     */
    public function update($id, UpdateSysActionAPIRequest $request): JsonResponse
    {
        $input = $request->all();

        /** @var SysAction $sysAction */
        $sysAction = $this->sysActionRepository->find($id);

        if (empty($sysAction)) {
            return $this->sendError('Sys Action not found');
        }

        $sysAction = $this->sysActionRepository->update($input, $id);

        return $this->sendResponse($sysAction->toArray(), 'SysAction updated successfully');
    }

    /**
     * Remove the specified SysAction from storage.
     * DELETE /sys-actions/{id}
     *
     * @throws \Exception
     */
    public function destroy($id): JsonResponse
    {
        /** @var SysAction $sysAction */
        $sysAction = $this->sysActionRepository->find($id);

        if (empty($sysAction)) {
            return $this->sendError('Sys Action not found');
        }

        $sysAction->delete();

        return $this->sendSuccess('Sys Action deleted successfully');
    }
}
