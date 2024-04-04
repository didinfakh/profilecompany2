<?php

namespace App\Http\Controllers\API;

use Illuminate\Support\Facades\Hash;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use App\Http\Controllers\BaseResourceController;

/**
 * Class SysGroupMenuAPIController
 */
class SysUserAPIController extends BaseResourceController
{
    public function __construct()
    {
        $this->model = new \App\Models\SysUser;
    }

    public function index(Request $request): JsonResponse
    {
        return $this->respond(['success' => 'succeessss']);
        //     $search = $request->get('q');
        //     if ($search) {
        //         if (!empty($search['nama']))
        //             $search['nama'] = "%" . $search['nama'] . "%";
        //         if (!empty($search['kode']))
        //             $search['kode'] = "%" . $search['kode'] . "%";
        //     }
        //     // $filter = $request->get('q');
        //     $page = $request->get('page') ?? 1;
        //     $limit = $request->get('pagesize') ?? $this->limit;
        //     $db = $this->model->search($search);

        //     $orderby = $request->get('order');
        //     if ($orderby) {
        //         $orderby = explode(",", $orderby);
        //         if (!is_array($orderby))
        //             $orderby = array($orderby);

        //         foreach ($orderby as $v) {
        //             list($column, $sc) = explode(" ", $v);

        //             $db = $db->orderBy($column, $sc);
        //         }
        //     } else if ($this->model->primaryKey) {
        //         $db = $db->orderBy($this->model->primaryKey);
        //     }

        //     // if($filter)
        //     // 	$db = $db->where($filter);
        //     $data = $db->paginate($limit);
        //     // $pagination = [
        //     // 	'currentPage' => $this->model->pager->getCurrentPage(),
        //     // 	'totalPage' => $this->model->pager->getPageCount(),
        //     // ];
        //     // dd($data->items);
        //     return $this->respond([
        //         'page' => $data->currentPage(),
        //         'page_size' => $data->perPage(),
        //         'data' => $data->items(),
        //         'total_page' => ceil($data->total() / $limit),
        //         'total_records' => $data->total()
        //     ]);
        //     // return $this->respond([
        //     //     'page' => $this->model->pager->getCurrentPage(),
        //     //     'page_size' => $limit,
        //     //     'data' => $data,
        //     //     'total_page' => $this->model->pager->getPageCount(),
        //     //     'total_records' => $this->model->pager->getDataCount()
        //     // ]);
    }

    public function create(Request $request): JsonResponse
    {
        $data = $request->all();
        if ($data['password'] <> $data['password_konfirmasi']) {
            return $this->failValidationError("Password tidak sama dengan password konfirmasi");
        }

        if (!$data['password'] || !$data['name'] || !$data['email'])
            return $this->fail(["errorr" => "Masukan data dengan lengkap !"]);

        $ret = $this->model->where('name', $data['name'])->get();
        if (count($ret)) {
            return $this->fail(['errorr' => 'nama sudah ada']);
        }

        $this->model->create([
            'name' => $data['name'],
            'email' => $data['email'],
            'password' => Hash::make($request->password)
        ]);

        // if (!$id = $this->model->insert($data)) {
        //     return $this->fail($this->model->errors());
        // }

        // unset($data->password);
        // unset($data->salt);

        // $data->id_user = $id;
        // $data->id_driver = $id;

        return $this->respondCreated($data, 'data created');
    }
}
