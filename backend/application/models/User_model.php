<?php
class User_model extends CI_Model
{
    public function list()
    {
        return $this->db->get('admin')->result();
    }
    public function saveuser($data)
    {
        return $this->db->insert('admin',$data);
    }
    public function deleteuser($id)
    {
        $this->db->where('id',$id)->delete('admin');
    }
    public function edituser($id)
    {
        return $this->db->where('id',$id)->get('admin')->row();
    }
    public function updateuser($data)
    {
        $this->db->where('id',$data['id'])->update('admin',$data);
    }
}
