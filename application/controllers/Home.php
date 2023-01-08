<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends CI_Controller
{
	public $data = [];

	public function __construct()
	{
		parent::__construct();
	}

	public function index()
	{
		if ($this->ion_auth->logged_in())
		{
			$this->data['page_title'] = 'Dashboard - '.company_name();
			$this->data['current_user'] = $this->ion_auth->user()->row();
			$this->data['system_users'] = $this->ion_auth->users(array(1,2,3))->result();
			$this->data['project_status'] = project_status();
			$this->data['task_status'] = task_status();
			$this->data['my_att_running'] = $this->attendance_model->my_att_running($this->session->userdata('user_id'));
				
			$this->load->view('home',$this->data);
		}else{
			redirect('auth', 'refresh');
		}
	}

}
