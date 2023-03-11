<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Class Auth
 * @property Ion_auth|Ion_auth_model $ion_auth        The ION Auth spark
 * @property CI_Form_validation      $form_validation The form validation library
 */
class Settings extends CI_Controller
{
	public $data = [];

	public function __construct()
	{
		parent::__construct();
	}

	public function clear_cache()
	{	
		$cache_path = 'install';
		delete_files($cache_path, true);
		rmdir($cache_path);
		redirect('auth', 'refresh');
	}



	public function email_templates()
	{ 
		if ($this->ion_auth->logged_in() && $this->ion_auth->in_group(1))
		{
			$this->data['page_title'] = 'Settings - '.company_name();
			$this->data['main_page'] = 'email-templates';
			$this->data['current_user'] = $this->ion_auth->user()->row();

			$this->data['email_templates'] = $this->settings_model->get_email_templates();
			if($this->uri->segment(3)){
				$this->data['template'] = $this->settings_model->get_email_templates($this->uri->segment(3));
			}else{
				$this->data['template'] = $this->settings_model->get_email_templates('new_user_registration');
			}

			$this->load->view('settings',$this->data);
		}else{
			redirect('auth', 'refresh');
		}
	}

	public function save_email_templates_setting()
	{
		if ($this->ion_auth->logged_in() && $this->ion_auth->in_group(1))
		{

			$this->form_validation->set_rules('name', 'Name', 'trim|required|strip_tags|xss_clean');
			$this->form_validation->set_rules('subject', 'Subject', 'required');
			$this->form_validation->set_rules('message', 'Message', 'required');

			if($this->form_validation->run() == TRUE){

				$data = array(
					'subject' => $this->input->post('subject'),
					'message' => $this->input->post('message'),	
				);

				if($this->settings_model->update_email_templates($this->input->post('name'),$data)){
				    
					$this->data['error'] = false;
					$this->data['message'] = $this->lang->line('email_setting_saved')?$this->lang->line('email_setting_saved'):"Email Setting Saved.";
					echo json_encode($this->data); 
				}else{
					$this->data['error'] = true;
					$this->data['message'] = $this->lang->line('something_wrong_try_again')?$this->lang->line('something_wrong_try_again'):"Something wrong! Try again.";
					echo json_encode($this->data);
				}
			}else{
				$this->data['error'] = true;
				$this->data['message'] = validation_errors();
				echo json_encode($this->data); 
			}
		}else{
			
			$this->data['error'] = true;
			$this->data['message'] = $this->lang->line('access_denied')?$this->lang->line('access_denied'):"Access Denied";
			echo json_encode($this->data); 
		}
	}

	public function user_permissions()
	{
		if ($this->ion_auth->logged_in() && $this->ion_auth->is_admin())
		{
			$this->data['page_title'] = 'Settings - '.company_name();
			$this->data['main_page'] = 'permissions';
			$this->data['current_user'] = $this->ion_auth->user()->row();
			$this->data['permissions'] = permissions();
			$this->data['clients_permissions'] = clients_permissions();
			$this->load->view('settings',$this->data);
		}else{
			redirect('auth', 'refresh');
		}
	}

	public function email()
	{
		if ($this->ion_auth->logged_in() && $this->ion_auth->is_admin())
		{
			$this->data['page_title'] = 'Settings - '.company_name();
			$this->data['main_page'] = 'email';
			$this->data['current_user'] = $this->ion_auth->user()->row();

			$this->data['smtp_host'] = smtp_host();
			$this->data['smtp_port'] = smtp_port();
			$this->data['smtp_username'] = smtp_username();
			$this->data['smtp_password'] = smtp_password();
			$this->data['smtp_encryption'] = smtp_encryption();
			$this->data['email_library'] = get_email_library();
			$this->data['from_email'] = from_email();
			$this->load->view('settings',$this->data);
		}else{
			redirect('auth', 'refresh');
		}
	}

	public function save_permissions_setting()
	{
		
		if ($this->ion_auth->logged_in() && $this->ion_auth->is_admin())
		{
				$data_json = array(
					'project_view' => $this->input->post('project_view') != ''?1:0,
					'project_create' => $this->input->post('project_create') != ''?1:0,
					'project_edit' => $this->input->post('project_edit') != ''?1:0,
					'project_delete' => $this->input->post('project_delete') != ''?1:0,
					'task_view' => $this->input->post('task_view') != ''?1:0,
					'task_create' => $this->input->post('task_create') != ''?1:0,
					'task_edit' => $this->input->post('task_edit') != ''?1:0,
					'task_delete' => $this->input->post('task_delete') != ''?1:0,
					'user_view' => $this->input->post('user_view') != ''?1:0,
					'client_view' => $this->input->post('client_view') != ''?1:0,
					'setting_view' => $this->input->post('setting_view') != ''?1:0,
					'setting_update' => $this->input->post('setting_update') != ''?1:0,
					'todo_view' => $this->input->post('todo_view') != ''?1:0,
					'notes_view' => $this->input->post('notes_view') != ''?1:0,
					'chat_view' => $this->input->post('chat_view') != ''?1:0,
					'chat_delete' => $this->input->post('chat_delete') != ''?1:0,
					'team_members_and_client_can_chat' => $this->input->post('team_members_and_client_can_chat') != ''?1:0,
					'task_status' => $this->input->post('task_status') != ''?1:0,
					'project_budget' => $this->input->post('project_budget') != ''?1:0,
					'gantt_view' => $this->input->post('gantt_view') != ''?1:0,
					'gantt_edit' => $this->input->post('gantt_edit') != ''?1:0,
					'calendar_view' => $this->input->post('calendar_view') != ''?1:0,
					'meetings_view' => $this->input->post('meetings_view') != ''?1:0,
					'meetings_create' => $this->input->post('meetings_create') != ''?1:0,
					'meetings_edit' => $this->input->post('meetings_edit') != ''?1:0,
					'meetings_delete' => $this->input->post('meetings_delete') != ''?1:0,
					'lead_view' => $this->input->post('lead_view') != ''?1:0,
					'lead_create' => $this->input->post('lead_create') != ''?1:0,
					'lead_edit' => $this->input->post('lead_edit') != ''?1:0,
					'lead_delete' => $this->input->post('lead_delete') != ''?1:0,
				);

				$data = array(
					'value' => json_encode($data_json)
				);

				$client_data_json = array(
					'project_view' => $this->input->post('client_project_view') != ''?1:0,
					'project_create' => $this->input->post('client_project_create') != ''?1:0,
					'project_edit' => $this->input->post('client_project_edit') != ''?1:0,
					'project_delete' => $this->input->post('client_project_delete') != ''?1:0,
					'task_view' => $this->input->post('client_task_view') != ''?1:0,
					'task_create' => $this->input->post('client_task_create') != ''?1:0,
					'task_edit' => $this->input->post('client_task_edit') != ''?1:0,
					'task_delete' => $this->input->post('client_task_delete') != ''?1:0,
					'user_view' => $this->input->post('client_user_view') != ''?1:0,
					'client_view' => $this->input->post('client_client_view') != ''?1:0,
					'setting_view' => $this->input->post('client_setting_view') != ''?1:0,
					'setting_update' => $this->input->post('client_setting_update') != ''?1:0,
					'todo_view' => $this->input->post('client_todo_view') != ''?1:0,
					'notes_view' => $this->input->post('client_notes_view') != ''?1:0,
					'chat_view' => $this->input->post('client_chat_view') != ''?1:0,
					'chat_delete' => $this->input->post('client_chat_delete') != ''?1:0,
					'team_members_and_client_can_chat' => $this->input->post('team_members_and_client_can_chat') != ''?1:0,
					'task_status' => $this->input->post('client_task_status') != ''?1:0,
					'project_budget' => $this->input->post('client_project_budget') != ''?1:0,
					'gantt_view' => $this->input->post('client_gantt_view') != ''?1:0,
					'gantt_edit' => $this->input->post('client_gantt_edit') != ''?1:0,
					'calendar_view' => $this->input->post('client_calendar_view') != ''?1:0,
					'meetings_view' => $this->input->post('client_meetings_view') != ''?1:0,
					'meetings_create' => $this->input->post('client_meetings_create') != ''?1:0,
					'meetings_edit' => $this->input->post('client_meetings_edit') != ''?1:0,
					'meetings_delete' => $this->input->post('client_meetings_delete') != ''?1:0,
					'lead_view' => $this->input->post('client_lead_view') != ''?1:0,
					'lead_create' => $this->input->post('client_lead_create') != ''?1:0,
					'lead_edit' => $this->input->post('client_lead_edit') != ''?1:0,
					'lead_delete' => $this->input->post('client_lead_delete') != ''?1:0,
				);

				$client_data = array(
					'value' => json_encode($client_data_json)
				);

				if($this->settings_model->save_settings('permissions',$data)){
					$this->settings_model->save_settings('clients_permissions',$client_data);
					$this->data['error'] = false;
					$this->data['data'] = $data_json;
					$this->data['message'] = $this->lang->line('permissions_setting_saved')?$this->lang->line('permissions_setting_saved'):"Permissions Setting Saved.";
					echo json_encode($this->data); 
				}else{
					$this->data['error'] = true;
					$this->data['message'] = $this->lang->line('something_wrong_try_again')?$this->lang->line('something_wrong_try_again'):"Something wrong! Try again.";
					echo json_encode($this->data);
				}
		}else{
			
			$this->data['error'] = true;
			$this->data['message'] = $this->lang->line('access_denied')?$this->lang->line('access_denied'):"Access Denied";
			echo json_encode($this->data); 
		}
	}

	public function save_email_setting()
	{
		if ($this->ion_auth->logged_in() && $this->ion_auth->is_admin())
		{

			$this->form_validation->set_rules('smtp_host', 'SMTP Host', 'trim|required|strip_tags|xss_clean');
			$this->form_validation->set_rules('smtp_port', 'SMTP Port', 'trim|required|strip_tags|xss_clean');
			$this->form_validation->set_rules('smtp_username', 'Username', 'trim|required|strip_tags|xss_clean');
			$this->form_validation->set_rules('smtp_password', 'Password', 'trim|required|strip_tags|xss_clean');
			$this->form_validation->set_rules('smtp_encryption', 'Encryption', 'trim|required|strip_tags|xss_clean');
			$this->form_validation->set_rules('email_library', 'email library', 'trim|required|strip_tags|xss_clean');
			$this->form_validation->set_rules('from_email', 'from email', 'trim|required|strip_tags|xss_clean');

			if($this->form_validation->run() == TRUE){

				$template_path 	= 'assets/templates/email.php';
                    
        		$output_path 	= 'application/config/email.php';
        
        		$email_file = file_get_contents($template_path);

        		if($this->input->post('smtp_encryption') == 'none'){
				     $smtp_encryption = $this->input->post('smtp_encryption');
				}else{
				     $smtp_encryption = $this->input->post('smtp_encryption').'://'.$this->input->post('smtp_host');
				}
				
        		$new  = str_replace("%SMTP_HOST%",$smtp_encryption,$email_file);
        		$new  = str_replace("%SMTP_PORT%",$this->input->post('smtp_port'),$new);
        		$new  = str_replace("%SMTP_USER%",$this->input->post('smtp_username'),$new);
        		$new  = str_replace("%SMTP_PASS%",$this->input->post('smtp_password'),$new);
        
        		if(!write_file($output_path, $new)){
        			$this->data['error'] = true;
					$this->data['message'] = $this->lang->line('something_wrong_try_again')?$this->lang->line('something_wrong_try_again'):"Something wrong! Try again.";
					echo json_encode($this->data);
					return false;
        		} 

				$data_json = array(
					'smtp_host' => $this->input->post('smtp_host'),
					'smtp_port' => $this->input->post('smtp_port'),
					'smtp_username' => $this->input->post('smtp_username'),
					'smtp_password' => $this->input->post('smtp_password'),
					'smtp_encryption' => $this->input->post('smtp_encryption'),	
					'email_library' => $this->input->post('email_library'),	
					'from_email' => $this->input->post('from_email'),
				);

				$data = array(
					'value' => json_encode($data_json)
				);

				if($this->settings_model->save_settings('email',$data)){
				    
				    if($this->input->post('email')){ 
            			$body = "<html>
            				<body>
            					<p>SMTP is perfectly configured.</p>
            					<p>Go To your workspace <a href='".base_url()."'>Click Here</a></p>
            				</body>
            			</html>";
						send_mail($this->input->post('email'),'Testing SMTP',$body);

				    }
				    
					$this->data['error'] = false;
					$this->data['data'] = $data_json;
					$this->data['message'] = $this->lang->line('email_setting_saved')?$this->lang->line('email_setting_saved'):"Email Setting Saved.";
					echo json_encode($this->data); 
				}else{
					$this->data['error'] = true;
					$this->data['message'] = $this->lang->line('something_wrong_try_again')?$this->lang->line('something_wrong_try_again'):"Something wrong! Try again.";
					echo json_encode($this->data);
				}
			}else{
				$this->data['error'] = true;
				$this->data['message'] = validation_errors();
				echo json_encode($this->data); 
			}
		}else{
			
			$this->data['error'] = true;
			$this->data['message'] = $this->lang->line('access_denied')?$this->lang->line('access_denied'):"Access Denied";
			echo json_encode($this->data); 
		}
	}	
}


