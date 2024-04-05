

"use client"

import React, { useState, useEffect } from 'react';
import HeaderApp from '@/components/HeaderApp';
import { checkNotAuthorized, initAccessMethod } from '@/app/Utils';

import BtnIconAct from '@/components/BtnIconAct';
import { api_services } from '@/hooks/api_services';
import TableHead from '@/components/TableHead';

const headers = [
    {!!$headersFrontend!!}
]

const {{ucfirst($config->tableName)}} = (props) => {
    const page_url = "{{$config->tableName}}"

    const [first_load, setfirst_load] = useState(false)
    const [errors, setErrors] = useState({})
    const [access_method, setaccess_method] = useState({})
    const [is_loading, setis_loading] = useState(false)

    const [{{$config->tableName}}, set{{$config->tableName}}] = useState([])
    const { getapi_services, deleteapi_services } = api_services({
        api_path: `/${page_url}`
    })
    const [datafilter, setdatafilter] = useState({
        paginate: {
            page: 1,
            pagesize: 1000
        },
        nama: "",
    })

    useEffect(() => {
        handleFirstLoad()
    }, [])

    useEffect(() => {
        if (first_load) {
            handleget{{$config->tableName}}()
        }
    }, [datafilter.nama])

    const handleFirstLoad = () => {
        handleInitAccessMethod()
        handleget{{$config->tableName}}()
    }

    const handleInitAccessMethod = async () => {
        const { access_method } = await initAccessMethod(page_url)
        setaccess_method(access_method)
    }

    const handleget{{$config->tableName}} = async () => {
        setis_loading(true)
        const response = await getapi_services({ setErrors, filter: datafilter })
        console.log('get{{$config->tableName}}')
        console.log(response)
        setis_loading(false)

        checkNotAuthorized(response)
        setfirst_load(true)
        set{{$config->tableName}}(response.data)
    }


    const handledelete{{$config->tableName}} = async (id) => {

        const response = await deleteapi_services({ setErrors, id })
        console.log('delete{{$config->tableName}}')
        console.log(response)

        checkNotAuthorized(response)

        handleget{{$config->tableName}}()
    }

    return (
        <>
            <HeaderApp title="{{ucfirst($config->tableName)}}" is_loading={is_loading} data_btn={Object.keys(access_method).length > 0 ? access_method.btn_top : []} />
            <div className='container pl-4 pr-4'>

                <table class="w-full table table-auto border-collapse border">
                    <thead>
                        <TableHead data={headers} access_role={[]} />
                    </thead>
                    <tbody>
                        { {{$config->tableName}} .map((m, i) => (
                            <tr>
                                <td className='border text-center'>{i + 1}</td>
                            
                                {!!$tbodyFrontend!!}
                         
                                <td className='border'>
                                    <div className='flex align-center justify-end td-action'>
                                        <BtnIconAct className="btn-warning" icon="edit" href={`/${page_url}/edit/${m.{{$customPrimaryKey}} }`} />
                                        <BtnIconAct className="btn-danger" icon="delete" onTap={() => {
                                                if (confirm('Yakin menghapus data ini?')) {
                                                    handledelete{{$config->tableName}}(m.{{$customPrimaryKey}})
                                                }
                                            }} />
                                    </div>
                                </td>
                            </tr>
                        ))}

                    </tbody>
                </table>

            </div>
        </>
    )

}

export default {{ucfirst($config->tableName)}}


