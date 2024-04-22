

"use client"

import React, { useState, useEffect, useRef } from 'react';
import HeaderApp from '@/components/HeaderApp';
import { checkNotAuthorized, initAccessMethod } from '@/app/Utils';

import BtnIconAct from '@/components/BtnIconAct';
import Pagination from '@/components/Pagination';
import { api_services } from '@/hooks/api_services';
import TableHead from '@/components/TableHead';

const titlePage = "{!!$titlePageFrontend!!}"

const headers = [
    {!!$headersFrontend!!}
]

const {{ucfirst($config->tableName)}} = (props) => {
    const page_url = "{{$config->tableName}}"

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
            pagesize: 1000,
        },
        nama: "",
    })

    const initialized = useRef(false)

    useEffect(() => {
        //first load
        if (!initialized.current) {
            handleInitAccessMethod()
            initialized.current = true
        } else {
            handleget{{$config->tableName}}()
        }
    }, [datafilter.paginate.page, datafilter.nama])


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
        if(response.error) return
        set{{$config->tableName}}(response.data)
        setdatafilter({
            ...datafilter,
            paginate: {
                ...datafilter.paginate,
                total_records: response.total_records
            }
        })
    }


    const handledelete{{$config->tableName}} = async (id) => {

        const response = await deleteapi_services({ setErrors, id })
        console.log('delete{{$config->tableName}}')
        console.log(response)

        checkNotAuthorized(response)
        if(response.error) return
        handleget{{$config->tableName}}()
    }

    return (
        <>
            <HeaderApp title={titlePage} is_loading={is_loading} data_btn={Object.keys(access_method).length > 0 ? access_method.btn_top : []} />
            <div className='container pl-4 pr-4'>

            <div className="table-responsive">

                <table className="w-full table table-auto border-collapse border">
                    <thead>
                        <TableHead data={headers} access_role={[]} />
                    </thead>
                    <tbody>
                        { {{$config->tableName}} .map((m, i) => (
                            <tr key={i}>
                                <td className='border text-center'>{i + 1}</td>
                            
                                {Object.keys(m).map(a => {
                                            return headers.map(x => x.name === a ? (<td key={i} className='border'>{m[a]}</td>) : null)
                                        })}
                         
                                <td className='border'>
                                    <div className='flex align-center justify-end td-action'>
                                    {Object.keys(access_method).length > 0 && Object.keys( access_method.btn_edit_delete).length > 0 && access_method.btn_edit_delete.edit === true ? (
                                        <BtnIconAct className="btn-warning" icon="edit" href={`/${page_url}/edit/${m.{{$customPrimaryKey}} }`} />
                                        ) : null}
                                        {Object.keys(access_method).length > 0 && Object.keys( access_method.btn_edit_delete).length > 0 && access_method.btn_edit_delete.delete === true ? (
                                        <BtnIconAct className="btn-danger" icon="delete" onTap={() => {
                                                if (confirm('Yakin menghapus data ini?')) {
                                                    handledelete{{$config->tableName}}(m.{{$customPrimaryKey}})
                                                }
                                            }} />
                                            ) : null}
                                    </div>
                                </td>
                            </tr>
                        ))}

                    </tbody>
                </table>
            </div>

                <Pagination 
                paginate={datafilter.paginate}
                onPageClick={(page) => {
                    setdatafilter({
                        ...datafilter,
                        paginate: {
                            ...datafilter.paginate,
                            page: page.selected + 1
                        }
                    })
                }}
                />

            </div>
        </>
    )

}

export default {{ucfirst($config->tableName)}}

