<?php

class Tauhid_model extends CI_Model
{
    public function savebooking($data)
    {
        return $this->db->insert('bookings', $data);
    }
    public function getCustomer()
    {
        return $this->db->select('id,name')->get('customers')->result();
    }
    public function getVehicle()
    {
        return $this->db->select('id,name')->get('vehicles')->result();
    }
    public function getDriver()
    {
        return $this->db->select('id, name')->where('role', 'driver')->get('admin')->result();
    }
    public function getBooking()
    {
        return $this->db->select('bookings.*, admin.name AS drivername, customers.name AS customername, vehicles.name AS vehiclename')
            ->from('bookings')
            ->join('admin', 'admin.id=bookings.driver_id')
            ->join('customers', 'bookings.customer_id=customers.id')
            ->join('vehicles', 'bookings.vehicle_id=vehicles.id')
            ->where("admin.role='driver'")
            ->get()->result();
    }
    public function deletebooking($id)
    {
        $this->db->where('id', $id)->delete('bookings');
    }
    public function editbooking($id)
    {
        return $this->db->where('id', $id)->get('bookings')->row();
    }
    public function updatebooking($data)
    {
        $this->db->where('id', $data['id'])->update('bookings', $data);
    }
}


?>