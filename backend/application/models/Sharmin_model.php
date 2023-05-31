<?php
class Sharmin_model extends CI_Model
{
    // public function list()
    // {
    //     return $this->db->get('fuels')->result();
    // }
    //----Fuel-save insert ------
 
    public function getVehicle()
    {
        return $this->db->select('id,name')->get('vehicles')->result();
    }
    public function getDriver()
    {
        return $this->db->select('id,name')->where('role','driver')->get('admin')->result();
    }

    public function getFuel()
    { 
        
        $this->db->select('fuels.*, vehicles.name as vehiclename, admin.name as drivername');
        $this->db->from('fuels');
        $this->db->join('admin', 'admin.id = fuels.driver_id');
        $this->db->join('vehicles', 'vehicles.id = fuels.vehicle_id');
        $this->db->where("admin.role = 'driver'");
        $query = $this->db->get();
        return $query->result();

    }

    public function savefuels($data)
    {
        return $this->db->insert('fuels', $data);
    }


    //----Fuel--del--------
    public function deletefuel($id)
    {
        $this->db->where('id',$id)->delete('fuels');
    }
//-------Fuel---edit-------
public function editfuel($id)
{
    return $this->db->where('id',$id)->get('fuels')->row();
}
//-----Fuel---Update--------
public function updatefuel($data)
{
    $this->db->where('id',$data['id'])->update('fuels',$data);
}

}