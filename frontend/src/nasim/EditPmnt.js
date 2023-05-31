import Menu from "../Menu";
import Footer from "../Footer";
import { useEffect, useState } from "react";
import axios from "axios";
import { useNavigate, useParams } from "react-router-dom";



export default function EditPmnt() {

    const [Vnm, setVehi] = useState([]);
    const [carID, setcarID] = useState('');
    const [inExid, setinExid] = useState('');
    const [Vname, setVehiNM] = useState(0);
    const [Vdate, seteDate] = useState('');
    const [amnt, setAmnt] = useState('');
    const [rmRk, setRmrk] = useState('');
    const [typ_e, setType] = useState('');
    const [msg, setmsg] = useState('');
    const q = useParams();
    // console.log(q);
    const navigate = useNavigate();

    useEffect(() => {
        axios.post('http://localhost/fleet_manage/backend/Payment_c/getPerId', {
            id: q.id
        }, {
            headers: {
                'Content-Type': 'application/json',
                'Authorization': localStorage.getItem('token')
            }
        }).then(function (response) {
            let vehicleId = response.data.income_expense.vehicle_id;
            setcarID(vehicleId);
            setinExid(response.data.income_expense.id);
            setType(response.data.income_expense.type);
            seteDate(response.data.income_expense.trans_date);
            setAmnt(response.data.income_expense.amount);
            setRmrk(response.data.income_expense.remarks);
            console.log(response.data.income_expense);
        }
        )
    }, []);


    // -------- Part for Name

    const getdata = () => {
        axios({
            method: 'get',
            url: 'http://localhost/fleet_manage/backend/Payment_c/VehicleName',
            responseType: 'json'
        }).then(function (response) {
            let VnmN = response.data.vehicl;
            setVehi(VnmN);

        });
    }

    useEffect(() => {
        getdata();
    }, []);

    // -------- /Part for Name

    const update = () => {
        axios.post('http://localhost/fleet_manage/backend/Payment_c/saveUpdate', {
            id:inExid,
            vehicle_id: carID,
            trans_date: Vdate,
            amount: amnt,
            remarks: rmRk,
            type: typ_e
        }, {
            headers: {
                'Content-Type': 'application/json',
                'Authorization': localStorage.getItem('token')
            }
        }).then(function (response) {
            let data = response.data;
            setmsg(data.msg);
            setVehiNM(data.msg);
            // seteDate('');
            // setRmrk('');
            // setAmnt('');
            // setType('');
            navigate("/payment");
        })
    }


    return (
        <div className="hold-transition sidebar-mini">
            <div className="wrapper">
                <Menu />
                <div className="content-wrapper">
                    <div className="content-header">
                        <div className="container-fluid">
                            <div className="row mb-2">
                                <div className="col-sm-6">
                                    <h1 className="m-0">Starter Page</h1>
                                </div>
                                <div className="col-sm-6">
                                    <ol className="breadcrumb float-sm-right">
                                        <li className="breadcrumb-item"><a href="#">Home</a></li>
                                        <li className="breadcrumb-item active">Starter Page</li>
                                    </ol>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div className="content">
                        <div className="container-fluid">

                            <div className="row">

                                <div className="col-12">
                                    <div className="card card-primary card-outline">
                                        <div className="card-header">
                                            <h5 className="m-0">Add New</h5>
                                        </div>
                                        <div className="card-body">
                                            <h4>{msg}</h4>
                                            <table className='table table-bordered'>
                                                <tbody>
                                                    <tr>
                                                        <th>Vehicle Name</th>
                                                        <td>
                                                            <select className='form-control' onChange={(e) => setcarID(e.target.value)} value={carID} >
                                                                {
                                                                    Vnm.map((d, i) => {
                                                                        return (
                                                                            <option value={d.id} key={i}  > {d.name} </option>
                                                                        )
                                                                    })
                                                                }
                                                            </select>

                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th>Transjection date</th>
                                                        <td><input type='date' className='form-control' onChange={(e) => seteDate(e.target.value)} value={Vdate} /></td>
                                                    </tr>
                                                    <tr>
                                                        <th>Amount</th>
                                                        <td><input type='number' className='form-control' onChange={(e) => setAmnt(e.target.value)} value={amnt} /></td>
                                                    </tr>
                                                    <tr>
                                                        <th>Remarks</th>
                                                        <td><input type='text' className='form-control' onChange={(e) => setRmrk(e.target.value)} value={rmRk} /></td>
                                                    </tr>
                                                    <tr>
                                                        <th>Type</th>
                                                        <td>
                                                            {(typ_e == 'income') ? <>
                                                                <input type="radio" id="html" name="fav_language" value={'income'} onChange={(e) => setType(e.target.value)} checked /><label >Income</label> </> : <> <input type="radio" id="html" name="fav_language" value={'income'} onChange={(e) => setType(e.target.value)} /><label >Income</label> </>}

                                                            {(typ_e == 'expense')
                                                                ? <>
                                                                    <input type="radio" id="html" name="fav_language" value={'expense'} onChange={(e) => setType(e.target.value)} checked />
                                                                    <label >Expense</label><br />
                                                                </>
                                                                :
                                                                <><input type="radio" id="html" name="fav_language" value={'expense'} onChange={(e) => setType(e.target.value)} /><label >Expense</label><br />
                                                                </>}


                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colSpan={2}><input type='submit' className='btn btn-block btn-primary' value="Save" onClick={update} /></td>
                                                    </tr>
                                                </tbody>
                                            </table>

                                        </div>
                                    </div>
                                </div>

                            </div>



                        </div>
                    </div>

                </div>

                <Footer />
            </div>
        </div>
    );

}