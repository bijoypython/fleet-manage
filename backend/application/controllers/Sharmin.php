<?php
use Firebase\JWT\JWT;
use Firebase\JWT\ExpiredException;
use Firebase\JWT\SignatureInvalidException;
use Firebase\JWT\Key;
class Sharmin extends CI_Controller
{
    public function __construct() {
        parent::__construct();
        header('Access-Control-Allow-Origin: *');
        header('Access-Control-Allow-Headers: *');
        header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
        $this->load->model('Sharmin_model');
    }

    // public function index()
    // {
    //     $data=$this->Sharmin_model->list();
    //     $this->output->set_content_type('application/json')->set_output(json_encode(['list'=>$data,'status'=>true]));
    // }
    

       //-------Fuel--add--start-------
       public function addfuel()
       {
           $data=json_decode(file_get_contents("php://input"),true);
        //    $data['password']=md5($data['password']);
           $header = apache_request_headers();
           $token=$header['Authorization'];
           try{
              // Your section starts here
               $decoded=JWT::decode($token,new Key($this->config->item('encryption_key'),'HS256'));
               $this->Sharmin_model->savefuels($data);
               $this->output->set_content_type('application/json')->set_output(json_encode(['msg'=>'Successfully Inserted!','status'=>true]));
                // Your section ends here
           }catch(ExpiredException $e){
               $this->output->set_content_type('application/json')->set_output(json_encode(['msg'=>$e->getMessage(),'status'=>false]));
           }catch(SignatureInvalidException $s){
               $this->output->set_content_type('application/json')->set_output(json_encode(['msg'=>$s->getMessage(),'status'=>false]));
           }catch(Exception $ex){
               $this->output->set_content_type('application/json')->set_output(json_encode(['msg'=>$ex->getMessage(),'status'=>false]));
           }
       }

     //----------Fuel -Add End-------

     public function getVehicle()
     {
         $data=$this->Sharmin_model->getVehicle();
         $this->output->set_content_type('application/json')->set_output(json_encode(['vehicle' => $data, 'status' => true]));
     }

     public function getDriver()
     {
         $data=$this->Sharmin_model->getDriver();
         $this->output->set_content_type('application/json')->set_output(json_encode(['driver' => $data, 'status' => true]));
     }

     public function index()
     {
         $data=$this->Sharmin_model->getFuel();
         $this->output->set_content_type('application/json')->set_output(json_encode(['fuels' => $data, 'status' => true]));
     }


     // ----------------Fuel-delete-------Start---
     public function deletefuel()
     {
         
         $header = apache_request_headers();
         $token=$header['Authorization'];
         try{
             $decoded=JWT::decode($token,new Key($this->config->item('encryption_key'),'HS256'));
             // Your section starts here
             $data=json_decode(file_get_contents("php://input"),true);
             $d=$this->Sharmin_model->deletefuel($data['id']);
             $this->output->set_content_type('application/json')->set_output(json_encode(['msg'=>'Successfully deleted!','status'=>true]));
             // Your section ends here
         }catch(ExpiredException $e){
             $this->output->set_content_type('application/json')->set_output(json_encode(['msg'=>$e->getMessage(),'status'=>false]));
         }catch(SignatureInvalidException $s){
             $this->output->set_content_type('application/json')->set_output(json_encode(['msg'=>$s->getMessage(),'status'=>false]));
         }catch(Exception $ex){
             $this->output->set_content_type('application/json')->set_output(json_encode(['msg'=>$ex->getMessage(),'status'=>false]));
         }
     }
     // -----------Fuel------delete---End-----

//----------edit--start-------
public function editfuel()
{
    
    $header = apache_request_headers();
    $token=$header['Authorization'];
    try{
        $decoded=JWT::decode($token,new Key($this->config->item('encryption_key'),'HS256'));
        // Your section starts here
        $data=json_decode(file_get_contents("php://input"),true);
        $d=$this->Sharmin_model->editfuel($data['id']);
        $this->output->set_content_type('application/json')->set_output(json_encode(['fuel'=>$d,'status'=>true]));
        // Your section ends here
    }catch(ExpiredException $e){
        $this->output->set_content_type('application/json')->set_output(json_encode(['msg'=>$e->getMessage(),'status'=>false]));
    }catch(SignatureInvalidException $s){
        $this->output->set_content_type('application/json')->set_output(json_encode(['msg'=>$s->getMessage(),'status'=>false]));
    }catch(Exception $ex){
        $this->output->set_content_type('application/json')->set_output(json_encode(['msg'=>$ex->getMessage(),'status'=>false]));
    }
}
  //-----Fuel-----Edit End-------

   //------Fuel----Update End-------
   public function updatefuel()
   {
       
       $header = apache_request_headers();
       $token=$header['Authorization'];
       try{
           $decoded=JWT::decode($token,new Key($this->config->item('encryption_key'),'HS256'));
           // Your section starts here
           $data=json_decode(file_get_contents("php://input"),true);
        //    $data['password']=md5($data['password']);
           $this->Sharmin_model->updatefuel($data);
           $this->output->set_content_type('application/json')->set_output(json_encode(['msg'=>'Successfully Updated!','status'=>true]));
           // Your section ends here
       }catch(ExpiredException $e){
           $this->output->set_content_type('application/json')->set_output(json_encode(['msg'=>$e->getMessage(),'status'=>false]));
       }catch(SignatureInvalidException $s){
           $this->output->set_content_type('application/json')->set_output(json_encode(['msg'=>$s->getMessage(),'status'=>false]));
       }catch(Exception $ex){
           $this->output->set_content_type('application/json')->set_output(json_encode(['msg'=>$ex->getMessage(),'status'=>false]));
       }
   }
   //--------Fuel----update end--------
}
