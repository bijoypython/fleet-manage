<?php

use SebastianBergmann\CodeCoverage\Driver\Driver;

class Driver_model extends CI_Model
{
   public function list()
   {
      //  return $this->db->get('drivers')->result();
      return
         $this->db->select('*')
            ->from('drivers')
            ->join('admin', 'drivers.admin_id = admin.id')
            ->get()
            ->result();
   }
   // public function mahmud($data)
   // {
   //    $this->db->insert('admin', ['name' => $data['name'], 'email' => $data['email'], 'password' => $data['  '], 'role' => $data['role']]);
   //    $last_id = $this->db->insert_id();

   //    $this->db->insert('drivers', ['admin_id' => $last_id, 'phone' => $data['phone'], 'age' => $data['age'], 'license_no' => $data['license_no'], 'license_expire_date' => $data['license_expire_date'], 'experience' => $data['experience'], 'joining_date' => $data['joining_date'], 'reference' => $data['reference'], 'address' => $data['address'], 'status' => $data['status'], 'photo' => $data['photo'], 'documents' => $data['documents']]);

   // }
   public function deletedriver($id)
   {
      $this->db->where('admin_id', $id)->delete('drivers');
      $this->db->where('id', $id)->delete('admin');
   }
   public function editdrive($id)
   {
      // return $this->db->where('admin_id',$id)->get('drivers')->row();

      $this->db->from('drivers');
      $this->db->join('admin', 'drivers.admin_id = admin.id');
      return $this->db->where('admin_id', $id)->get()->row();
   }
   public function update_driver($data1, $name, $email, $password,$phone, $age, $license_no, $license_expire_date, $experience, $joining_date, $reference, $address, $status, $data,$id)
   {
      // $this->db->where('id',$data['id'])->update('drivers',$data);
      $this->db->where('id', $id)->update('admin', ['name' => $name, 'email' => $email, 'password' => $password, 'role' => 'Driver']);
      // var_dump($name);


      return $this->db->where('admin_id', $id)->update('drivers', ['admin_id' => $id, 'phone' => $phone, 'age' => $age, 'license_no' => $license_no, 'license_expire_date' => $license_expire_date, 'experience' => $experience, 'joining_date' => $joining_date, 'reference' => $reference, 'address' => $address, 'status' => $status, 'photo' => $data1, 'documents' => $data]);
   }
   // public function update_driver($data)
   // {
   //    // $this->db->where('id',$data['id'])->update('drivers',$data);
   //    $this->db->where('id', $data['id'])->update('admin', ['name' => $data['name'], 'email' => $data['email'], 'password' => $data['password'], 'role' => $data['role']]);

   //    $this->db->where('admin_id', $data['id'])->update('drivers', ['admin_id' => $data['id'], 'phone' => $data['phone'], 'age' => $data['age'], 'license_no' => $data['license_no'], 'license_expire_date' => $data['license_expire_date'], 'experience' => $data['experience'], 'joining_date' => $data['joining_date'], 'reference' => $data['reference'], 'address' => $data['address'], 'status' => $data['status'], 'photo' => $data['photo'], 'documents' => $data['documents']]);
   // }
   public function adminlist()
   {
      return $this->db->get('admin')->result();
   }

   public function saveuser($data1, $name, $email, $password,$phone, $age, $license_no, $license_expire_date, $experience, $joining_date, $reference, $address, $status, $data)
   {

      $this->db->insert('admin', ['name' => $name, 'email' => $email, 'password' => $password, 'role' => 'Driver']);
      $last_id = $this->db->insert_id();

      $this->db->insert('drivers', ['admin_id' => $last_id, 'phone' => $phone, 'age' => $age, 'license_no' => $license_no, 'license_expire_date' => $license_expire_date, 'experience' => $experience, 'joining_date' => $joining_date, 'reference' => $reference, 'address' => $address, 'status' => $status, 'photo' => $data1, 'documents' => $data]);


   }
}