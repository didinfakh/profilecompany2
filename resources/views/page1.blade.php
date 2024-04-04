"use client"

import React, { useState, useEffect } from 'react';
import HeaderApp from '@/components/HeaderApp';
import { checkNotAuthorized, initAccessMethod } from '@/app/Utils';

import BtnIconAct from '@/components/BtnIconAct';
import { api_services } from '@/hooks/api_services';
import TableHead from '@/components/TableHead';

const headers = [
    @foreach($this->config->fields as $fields)
    {
        name: "{{$fields->name}}",
        label: "{{ucfirst($fields->name)}}",
        width: "auto",
        type: "{{$field->dbType}}",
    },
    @endforeach
]

const {{ucfirst($this->config->tableName)}} = (props) => {
    const page_url = "{{$this->config->tableName}}"

    const [first_load, setfirst_load] = useState(false)
    const [errors, setErrors] = useState({})
    const [access_method, setaccess_method] = useState({})
    const [is_loading, setis_loading] = useState(false)

    const [{{$this->config->tableName}}, set{{$this->config->tableName}}] = useState([])
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
            handleget{{$this->config->tableName}}()
        }
    }, [datafilter.nama])

    const handleFirstLoad = () => {
        handleInitAccessMethod()
        handleget{{$this->config->tableName}}()
    }

    const handleInitAccessMethod = async () => {
        const { access_method } = await initAccessMethod(page_url)
        setaccess_method(access_method)
    }

    const handleget{{$this->config->tableName}} = async () => {
        setis_loading(true)
        const response = await getapi_services({ setErrors, filter: datafilter })
        console.log('get{{$this->config->tableName}}')
        console.log(response)
        setis_loading(false)

        checkNotAuthorized(response)
        setfirst_load(true)
        set{{$this->config->tableName}}(response.data)
    }


    const handledelete{{$this->config->tableName}} = async (id) => {

        const response = await deleteapi_services({ setErrors, id })
        console.log('delete{{$this->config->tableName}}')
        console.log(response)

        checkNotAuthorized(response)

        handleget{{$this->config->tableName}}()
    }

 
 return (
        <>
            <HeaderApp title="{{ucfirst($this->config->tableName)}}" is_loading={is_loading} data_btn={Object.keys(access_method).length > 0 ? access_method.btn_top : []} />
            <div className='container pl-4 pr-4'>

                <table class="w-full table table-auto border-collapse border">
                    <thead>
                        <TableHead data={headers} access_role={[]} />
                    </thead>
                    <tbody>
                        {{{$this->config->tableName}}.map((m, i) => (
                            <tr>
                                <td className='border text-center'>{i + 1}</td>
                                @foreach($this->config->fields as $f)
                                <td className='border'>{m.{{$f->name}}}</td>
                                @endforeach
                                <td className='border'>
                                    <div className='flex align-center justify-end td-action'>
                                        <BtnIconAct className="btn-warning" icon="edit" href={`/${page_url}/edit/${m.{{primaryKey}}}`} />
                                        <BtnIconAct className="btn-danger" icon="delete" onTap={() => {
                                            if (confirm('Yakin menghapus data ini?')) {
                                                handledeletesys_user(m.{{$primaryKey}})
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

export default {{ucfirst($this->config->tableName)}}



