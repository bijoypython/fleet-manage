import './App.css';
import { BrowserRouter, Route, Routes } from 'react-router-dom';
import Login from './Login';
import Dashboard from './Dashboard';
import List from './users/List';
import Edit from './Edit';
import Stockout from './bijoy/Stockout';
import Editstock from './bijoy/Editstock';
import Partinventory from './bijoy/Partinventory';
import Stockdetails from './bijoy/Stockdetails';
import Payment from './nasim/Payment';
import EditPmnt from './nasim/EditPmnt';
import Fuel from './Sharmin/Fuel';
import Fuel_Edit from './Sharmin/Fuel_Edit';
import Fuel_list from './Sharmin/Fuel_list';
import Vendorlist from './Vendors/Vendorlist';
import Edit_vandor from './Vendors/Edit_vandor';
import Booking_add from './Tauhid/Booking_add';
import Booking_list from './Tauhid/Booking_list';
import Booking_edit from './Tauhid/Booking_edit';
import Booking_view from './Tauhid/Booking_view';

import Vehicles from './Rubel/Vehicles';
import Vehicle_type from './Rubel/Vehicle_type';
import Vehicles_add from './Rubel/Vehicles_add';
import Vehicleedit from './Rubel/Vehicleedit';
import Type_list from './Rubel/Type_list';
import Edit_type from './Rubel/Edit_type';


import Maintenance from './component/Maintenance';
import Editmaintenance from './component/Editmaintenance';
import Maintenancelist from './component/Maintenancelist';

import Parts from './alamin/Parts';
import Parts_edit from './alamin/Parts_edit';

import Driver from './mahmud/Driver';
import Driveredit from './mahmud/Driveredit';
import Driverlist from './mahmud/Driverlist';


import Customers from './customers/Customers';
import Customersedit from './customers/Customersedit';
import Customer_list from './customers/Customer_list';


import Driver_payment_add from './Opu/Driver_payment_add';
import Driver_payment_list from './Opu/Driver_payment_list';
import Payment_edit from './Opu/Payment_edit';

import Parts_stock_in from './Ashraf/Parts_stock_in';
import EditParts from './Ashraf/EditParts'
import Availablecar from './bijoy/Availablecar';


function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path='/' element={<Login/>}/>
        <Route path='/dashboard' element={<Dashboard/>}/>
        <Route path='/admin' element={<List/>}/>
        <Route path='/edit/:id' element={<Edit/>}/>
        <Route path='/stock-out' element={<Stockout/>}></Route>
        <Route path='/editparts/:id' element={<Editstock/>}></Route>
        <Route path='/parts-inventory/' element={<Partinventory/>}></Route>
        <Route path='/stock-details/:id' element={<Stockdetails/>}/>
        <Route path='/available-car' element={<Availablecar/>}/>

        <Route path='/payment' element={<Payment/>} />
        <Route path='/editpay/:id' element={<EditPmnt/>} />

        <Route path='/fuel_edit/:id' element={<Fuel_Edit/>}/>
        <Route path='/fuel' element={<Fuel/>}/>
        <Route path='/fuel_list' element={<Fuel_list/>}/>

        <Route path='/vendor' element={<Vendorlist/>}/>
        <Route path='/editvendors/:id' element={<Edit_vandor/>}/>

        <Route path='/bookingadd' element={<Booking_add/>}/>
        <Route path='/bookinglist' element={<Booking_list/>}/>
        <Route path='/bookingedit/:id' element={<Booking_edit/>}/>
        <Route path='/bookingview/:id' element={<Booking_view/>}/>

        <Route path='/vehicle' element={<Vehicles/>}/>
        <Route path='/type' element={<Vehicle_type/>}/>
        <Route path='/typelist' element={<Type_list/>}/>
        <Route path='/add' element={<Vehicles_add/>}/>
        <Route path='/editvehicle/:id' element={<Vehicleedit/>}/>
        <Route path='typeedit/:id' element={<Edit_type/>}/>

        <Route path='/maintenance/' element={<Maintenance/>}/>
        <Route path='/maintanenceedit/:id' element={<Editmaintenance/>}/>
        <Route path='/list' element={<Maintenancelist/>}/>

        <Route path='/parts' element={<Parts/>}/>
        <Route path='/parts_edit/:id' element={<Parts_edit/>}/>

        <Route path='/driver' element={<Driver/>}/>
        <Route path='/driverlist' element={<Driverlist/>}/>
        <Route path='/editdriver/:id' element={<Driveredit/>}/>

        <Route path='/customer' element={<Customers/>}/>
        <Route path='/customersedit/:id' element={<Customersedit/>}/>
        <Route path='/customers_management' element={<Customer_list/>}/>


        <Route path='/driverpaymentadd' element={<Driver_payment_add/>}/>
        <Route path='/driverpaymentlist' element={<Driver_payment_list/>}/>
        <Route path='/paymentedit/:id' element={<Payment_edit/>}/>

        <Route path='/parts_stock_in' element={<Parts_stock_in/>}/>
        <Route path='/editPartsin/:id' element={<EditParts/>}/>

      </Routes>
    </BrowserRouter>
  );
}

export default App;
