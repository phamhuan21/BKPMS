<?php
defined('BASEPATH') OR exit('No direct script access allowed');


function get_notifications_live()
{
    
    $CI =& get_instance();

    $new_noti = true;
    $show_beep_for_msg = false;
    $notifications = get_notifications();
    $unread_msg_count = get_unread_msg_count();
    
    if(($CI->ion_auth->is_admin() || permissions('chat_view')) && $unread_msg_count){
            $show_beep_for_msg = true;
    }

    $new_message = '';
    if($show_beep_for_msg){ 
        $new_noti = false;

        $new_message = '<a href="'.(base_url('chat')).'" class="dropdown-item dropdown-item-unread">
        <figure class="dropdown-item-icon avatar avatar-m bg-primary text-white fa fa-comment-alt"></figure>
        <h6 class="dropdown-item-desc m-2">
        '.($CI->lang->line('new_message')?$CI->lang->line('new_message'):'New Message').'
        </h6>
        </a>';
    }
    
    $whole_noti = '';
    if($notifications){ 
        $new_noti = false;

        foreach($notifications as $notification){
            $profile = '';

            if(isset($notification['profile']) && !empty($notification['profile'])){ 
                $file_upload_path = 'assets/uploads/profiles/'.$notification['profile']; 
                $profile = '<figure class="dropdown-item-icon avatar avatar-m bg-transparent">
                <img src="'.(base_url($file_upload_path)).'" alt="'.(htmlspecialchars($notification['first_name']).' '.htmlspecialchars($notification['last_name'])).'" data-toggle="tooltip" data-placement="top" title="'.(htmlspecialchars($notification['first_name']).' '.htmlspecialchars($notification['last_name'])).'" data-original-title="">
                </figure>';
            }else{
                $profile = '<figure class="dropdown-item-icon avatar avatar-m bg-primary text-white" data-initial="" data-toggle="tooltip" data-placement="top" title="'.(mb_substr(htmlspecialchars($notification['first_name']), 0, 1, "utf-8").''.mb_substr(htmlspecialchars($notification['last_name']), 0, 1, "utf-8")).'" data-original-title="'.(htmlspecialchars($notification['first_name']).' '.htmlspecialchars($notification['last_name'])).'">
                </figure>';
            }

            $whole_noti .= '<a href="'.($notification['notification_url']).'" class="dropdown-item dropdown-item-unread">
                
                '.($profile).'
                
                <div class="dropdown-item-desc  ml-2">
                '.($notification['notification']).'
                <div class="time text-primary">'.(time_elapsed_string($notification['created'])).'</div>
                </div>
            </a>';

        }
    }else{ if($new_noti){
        $whole_noti = '<a class="dropdown-item dropdown-item-unread">
        <div class="dropdown-item-desc  ml-2">
            '.($CI->lang->line('no_new_notifications')?$CI->lang->line('no_new_notifications'):'No new notifications.').'
        </div>
        </a>';
    } }

    return '<li class="dropdown dropdown-list-toggle"><a href="#" data-toggle="dropdown" id="show_beep_new_live_notifications" class="nav-link notification-toggle nav-link-lg '.($notifications || $show_beep_for_msg?'beep':'').'"><i class="far fa-bell"></i></a>
    <div class="dropdown-menu dropdown-list dropdown-menu-right">
        <div class="dropdown-header">
        '.($CI->lang->line('notifications')?$CI->lang->line('notifications'):'Notifications').'
        
        </div>
        <div class="dropdown-list-content dropdown-list-icons" id="new_live_notifications">

        '.($new_message).'
        '.($whole_noti).'

        </div>
        <div class="dropdown-footer text-center">
        <a href="'.(base_url('notifications')).'">'.($CI->lang->line('view_all')?$CI->lang->line('view_all'):'View All').' <i class="fas fa-chevron-right"></i></a>
        </div>
    </div>
    </li>';

}


function get_unread_msg_count()
{
    $CI =& get_instance();
    return $CI->chat_model->get_unread_msg_count($CI->session->userdata('user_id'));				
}

function from_email()
{
    $CI =& get_instance();
    $CI->db->from('settings');
    $CI->db->where(['type'=>'email']);
    $query = $CI->db->get();
    $data = $query->result_array();

    if(!$data){
        return 'admin@high.com';
    }

    $data = json_decode($data[0]['value']);

    if(!empty($data->from_email)){
        return $data->from_email;
    }else{
        return 'admin@high.com';
    }
} 


function get_paystack_secret_key(){
    $CI =& get_instance();
    $CI->db->select('value');
    $CI->db->from('settings');
    $CI->db->where(['type'=>'payment']);
    $query = $CI->db->get();
    $data = $query->result_array();
    if(!empty($data)){
        $data = json_decode($data[0]['value']);
        if(isset($data->paystack_secret_key)){
            return $data->paystack_secret_key;
        }else{
            return true;
        }
    }else{
        return false;
    }
}

function get_razorpay_key_secret(){
    $CI =& get_instance();
    $CI->db->select('value');
    $CI->db->from('settings');
    $CI->db->where(['type'=>'payment']);
    $query = $CI->db->get();
    $data = $query->result_array();
    if(!empty($data)){
        $data = json_decode($data[0]['value']);
        if(isset($data->razorpay_key_secret)){
            return $data->razorpay_key_secret;
        }else{
            return true;
        }
    }else{
        return false;
    }
}

function get_paypal_secret(){
    $CI =& get_instance();
    $CI->db->select('value');
    $CI->db->from('settings');
    $CI->db->where(['type'=>'payment']);
    $query = $CI->db->get();
    $data = $query->result_array();
    if(!empty($data)){
        $data = json_decode($data[0]['value']);
        if(isset($data->paypal_secret)){
            return $data->paypal_secret;
        }else{
            return true;
        }
    }else{
        return false;
    }
}

function get_paystack_public_key(){
    $CI =& get_instance();
    $CI->db->select('value');
    $CI->db->from('settings');
    $CI->db->where(['type'=>'payment']);
    $query = $CI->db->get();
    $data = $query->result_array();
    if(!empty($data)){
        $data = json_decode($data[0]['value']);
        if(isset($data->paystack_public_key)){
            return $data->paystack_public_key;
        }else{
            return true;
        }
    }else{
        return false;
    }
}

function render_email_template($template_name, $template_data){
    $CI = get_instance();

    if(!$template_name && !$template_data){
        return false;
    }
    
    $pre_template_data = array();
    $pre_template_data['COMPANY_NAME'] = company_name();
    $pre_template_data['DASHBOARD_URL'] = base_url();
    $pre_template_data['LOGO_URL'] = full_logo();
    
    $template_data = array_merge($pre_template_data,$template_data);

    $template_code = $CI->settings_model->get_email_templates($template_name);
    if($template_code){
        if(isset($template_code[0]['message']) && $template_code[0]['message'] != ''){
            $template = $template_code[0]['message'];
            foreach($template_data as $key => $value)
            {
                $template = str_replace('{'.$key.'}', $value, $template);
            }
            $template_code[0]['message'] = $template;
            return $template_code;
        }else{
            return false;
        }
    }else{
        return false;
    }
}

function send_mail($to, $subject, $message) {
    $CI = get_instance();
    $email_library = get_email_library();
    if($email_library == 'codeigniter'){
        $email_config = Array();
        $email_config["protocol"] = "smtp";
        $email_config["charset"] = "utf-8";
        $email_config["mailtype"] = "html";
        $email_config["smtp_host"] = smtp_host();
        $email_config["smtp_port"] = smtp_port();
        $email_config["smtp_user"] = smtp_username();
        $email_config["smtp_pass"] = smtp_password();
        $email_config["smtp_crypto"] = smtp_encryption();

        if($email_config["smtp_crypto"] == 'none'){
            $email_config["smtp_crypto"] = "";
        }

        $CI->load->library('email', $email_config);
        $CI->email->clear(true);
        $CI->email->set_newline("\r\n");
        $CI->email->set_crlf("\r\n");
        $CI->email->from(from_email(), company_name());
        $CI->email->to($to);
        $CI->email->subject($subject);
        $CI->email->message($message);

        if($CI->email->send()){
            return true;
        }else{
            return false;
        }
    }else{
        require_once('vendor/phpmailer/class.phpmailer.php');
        $CI = new PHPMailer(); 
        $CI->CharSet = 'UTF-8';
        $CI->IsSMTP(); 
        $CI->SMTPDebug = 1; 
        $CI->SMTPAuth = true;
        $CI->SMTPSecure = smtp_encryption();
        $CI->Host = smtp_host();
        $CI->Port = smtp_port();
        $CI->IsHTML(true);
        $CI->Username = smtp_username();
        $CI->Password = smtp_password();
        $CI->SetFrom(from_email(), company_name());
        $CI->Subject = $subject;
        // $CI->Subject = "=?utf-8?B?".base64_encode('Hoşgeldiniz - Dijivo Digital & Creative Agency')."?=";
        $CI->Body = $message;
        $CI->AddAddress($to);
        if($CI->Send()){
            return true;
        }else{
            return false;
        }
    }
}

function get_header_code()
{
    $CI =& get_instance();
    $CI->db->from('settings');
    $CI->db->where(['type'=>'custom_code']);
    $query = $CI->db->get();
    $data = $query->result_array();
    if(!$data){
        return false;
    }
    $data = json_decode($data[0]['value']);
    if(!empty($data->header_code)){
        return $data->header_code;
    }else{
        return '';
    }
} 

function get_footer_code()
{
    $CI =& get_instance();
    $CI->db->from('settings');
    $CI->db->where(['type'=>'custom_code']);
    $query = $CI->db->get();
    $data = $query->result_array();
    if(!$data){
        return false;
    }
    $data = json_decode($data[0]['value']);
    if(!empty($data->footer_code)){
        return $data->footer_code;
    }else{
        return '';
    }
} 

function theme_color(){    
    
    $CI =& get_instance();
    $CI->db->from('settings');
    $CI->db->where(['type'=>'general']);
    $query = $CI->db->get();
    $data = $query->result_array();

    if(!$data){
        return false;
    }
    
    $data = json_decode($data[0]['value']);

    if(isset($data->theme_color) && !empty($data->theme_color)){
        return $data->theme_color;
    }else{
        return '#e52165';
    }

}


function email_activation(){    
    
    $CI =& get_instance();
    $CI->db->from('settings');
    $CI->db->where(['type'=>'general']);
    $query = $CI->db->get();
    $data = $query->result_array();

    if(!$data){
        return false;
    }
    
    $data = json_decode($data[0]['value']);

    if(isset($data->email_activation) && !empty($data->email_activation)){
        return $data->email_activation;
    }else{
        return false;
    }

}
function check_my_timer($task_id = '', $user_id = ''){
    $CI =& get_instance();
    $where = '';
    if($task_id){
        $where .= " AND task_id=$task_id ";
    }
    if($user_id){
        $where .= " AND user_id=$user_id ";
    }else{
        $where .= " AND user_id=".$CI->session->userdata('user_id');
    }
    $query = $CI->db->query("SELECT id FROM timesheet WHERE starting_time IS NOT NULL and ending_time IS NULL $where");
    $data = $query->result_array();
    if(!empty($data)){
        return $data;
    }else{
        return false;
    }
}

function get_razorpay_key_id(){
    $CI =& get_instance();
    $CI->db->select('value');
    $CI->db->from('settings');
    $CI->db->where(['type'=>'payment']);
    $query = $CI->db->get();
    $data = $query->result_array();
    if(!empty($data)){
        $data = json_decode($data[0]['value']);
        if(isset($data->razorpay_key_id)){
            return $data->razorpay_key_id;
        }else{
            return '';
        }
    }else{
        return false;
    }
}

function get_bank_details(){
    $CI =& get_instance();
    $CI->db->select('value');
    $CI->db->from('settings');
    $CI->db->where(['type'=>'payment']);
    $query = $CI->db->get();
    $data = $query->result_array();
    if(!empty($data)){
        $data = json_decode($data[0]['value']);
        if(isset($data->bank_details)){
            return $data->bank_details;
        }else{
            return '';
        }
    }else{
        return false;
    }
}


function get_offline_bank_transfer(){
    $CI =& get_instance();
    $CI->db->select('value');
    $CI->db->from('settings');
    $CI->db->where(['type'=>'payment']);
    $query = $CI->db->get();
    $data = $query->result_array();
    if(!empty($data)){
        $data = json_decode($data[0]['value']);
        if(isset($data->offline_bank_transfer)){
            return $data->offline_bank_transfer;
        }else{
            return '';
        }
    }else{
        return false;
    }
}

function get_stripe_publishable_key(){
    $CI =& get_instance();
    $CI->db->select('value');
    $CI->db->from('settings');
    $CI->db->where(['type'=>'payment']);
    $query = $CI->db->get();
    $data = $query->result_array();
    if(!empty($data)){
        $data = json_decode($data[0]['value']);
        if(isset($data->stripe_publishable_key)){
            return $data->stripe_publishable_key;
        }else{
            return '';
        }
    }else{
        return false;
    }
}
function get_stripe_secret_key(){
    $CI =& get_instance();
    $CI->db->select('value');
    $CI->db->from('settings');
    $CI->db->where(['type'=>'payment']);
    $query = $CI->db->get();
    $data = $query->result_array();
    if(!empty($data)){
        $data = json_decode($data[0]['value']);
        if(isset($data->stripe_secret_key)){
            return $data->stripe_secret_key;
        }else{
            return '';
        }
    }else{
        return false;
    }
}

function get_payment_paypal(){
    $CI =& get_instance();
    $CI->db->select('value');
    $CI->db->from('settings');
    $CI->db->where(['type'=>'payment']);
    $query = $CI->db->get();
    $data = $query->result_array();
    if(!empty($data)){
        $data = json_decode($data[0]['value']);
        if(isset($data->paypal_client_id)){
            return $data->paypal_client_id;
        }else{
            return true;
        }
    }else{
        return false;
    }
}

function get_my_invoices_details(){
    $CI =& get_instance();
    $invoices = $CI->invoices_model->get_invoices();
    if($invoices){
        $amount_final = 0;
        $amount_due_final = 0;
        foreach($invoices as $key => $invoice){
            
            $amount = 0;
            $amount_due = 0;

            if($invoice['status'] == 1){
                $amount = $invoice['amount'];
                if($invoice['tax'] && $invoice['tax'] != ''){
                    $total_tax_per = 0;
                    if(is_numeric($invoice['tax'])){
                        $taxes = get_tax($invoice['tax']);
                        if($taxes){
                            $total_tax_per = $total_tax_per+$taxes[0]['tax'];
                        }
                    }else{
                        foreach(explode(',', $invoice['tax']) as $tax_id){
                            $taxes = get_tax($tax_id);
                            if($taxes){
                                $total_tax_per = $total_tax_per+$taxes[0]['tax'];
                            }
                        }
                    }
                    if($total_tax_per != 0){
                        $total_tax = $amount*$total_tax_per/100;
                    }else{
                        $total_tax = 0;
                    }
                    $amount = $amount+$total_tax;
                }
            }else{
                $amount_due = $invoice['amount'];
                if($invoice['tax'] && $invoice['tax'] != ''){
                    $total_tax_per_due = 0;
                    if(is_numeric($invoice['tax'])){
                        $taxes = get_tax($invoice['tax']);
                        if($taxes){
                            $total_tax_per_due = $total_tax_per_due+$taxes[0]['tax'];
                        }
                    }else{
                        foreach(explode(',', $invoice['tax']) as $tax_id){
                            $taxes = get_tax($tax_id);
                            if($taxes){
                                $total_tax_per_due = $total_tax_per_due+$taxes[0]['tax'];
                            }
                        }
                    }
                    if($total_tax_per_due != 0){
                        $total_tax_due = $amount_due*$total_tax_per_due/100;
                    }else{
                        $total_tax_due = 0;
                    }
                    $amount_due = $amount_due+$total_tax_due;
                }
            }   
            if($amount != 0){
                $amount_final = $amount_final+$amount;
            }else{
                $amount_final = $amount_final;
            }
            if($amount_due != 0){
                $amount_due_final = $amount_due_final+$amount_due;
            }else{
                $amount_due_final = $amount_due_final;
            }
        }

        $data['paid'] = isset($amount_final)?$amount_final:0;
        $data['due'] = isset($amount_due_final)?$amount_due_final:0;
        $data['total'] = $data['paid'] + $data['due'];
    }else{
        $data['paid'] = 0;
        $data['due'] = 0;
        $data['total'] = 0;
    }
return $data;
}

function company_details($type = '', $user_id = '')
{
    $CI =& get_instance();
    if(empty($user_id)){
        $where_type = 'company_'.$CI->session->userdata('user_id');
    }else{
        $where_type = 'company_'.$user_id;
    }

    $CI->db->from('settings');
    $CI->db->where(['type'=>$where_type]);

    $query = $CI->db->get();
    $data = $query->result_array();

    if(!$data){
        return '';
    }
    
    $data = json_decode($data[0]['value']);

    if($type == ''){
        return $data;
    }

    if(!empty($data->{$type})){
        return $data->{$type};
    }else{
        return '';
    }
} 

function get_tax($tax_id = '')
{
    $CI =& get_instance();
    $CI->db->from('taxes');
    if($tax_id){
        $CI->db->where(['id'=>$tax_id]);
    }
    $query = $CI->db->get();
    $data = $query->result_array();
    if(!empty($data)){
        return $data;
    }else{
        return array();
    }
} 

function get_currency($type)
{
    $CI =& get_instance();
    
    $where_type = 'general';

    $CI->db->from('settings');
    $CI->db->where(['type'=>$where_type]);

    $query = $CI->db->get();
    $data = $query->result_array();

    if(!$data){
        if($type == 'currency_code'){
            return 'USD';
        }else{
            return '$';
        }
    }
    
    $data = json_decode($data[0]['value']);

    if(!empty($data->{$type})){
        return $data->{$type};
    }else{
        if($type == 'currency_code'){
            return 'USD';
        }else{
            return '$';
        }
    }
} 

function get_notifications($user_id = ''){

    $CI =& get_instance();
    $left_join = " LEFT JOIN users u ON n.from_id=u.id ";
    $query = $CI->db->query("SELECT n.*,u.first_name,u.last_name,u.profile FROM notifications n $left_join WHERE is_read=0 AND to_id=".$CI->session->userdata('user_id')." ORDER BY n.created DESC LIMIT 10");
    $notifications = $query->result_array();
    if($notifications){
        foreach($notifications as $key => $notification){
            $temp[$key] = $notification;

            $extra = '';
            $notification_url = base_url('notifications');
            $notification_txt = $notification['notification'];
            if($notification['type'] == 'new_project'){
                $notification_txt = $CI->lang->line('new_project_created')?$notification['notification']." ".$CI->lang->line('new_project_created'):$notification['notification']." new project created.";
                $notification_url = base_url('projects/detail/'.$notification['type_id']);
                $project = $CI->projects_model->get_projects('',$notification['type_id']);
                if($project){
                    $extra = '<div class="text-small">
                    '.($CI->lang->line('project')?$CI->lang->line('project'):'Project').': <span class="text-info">'.$project[0]['title'].'</span> 
                    </div>';
                }
            }elseif($notification['type'] == 'project_status'){
                $old_status = project_status('',$notification['notification']);
                $project = $CI->projects_model->get_projects('',$notification['type_id']);

                if($old_status && $project){
                    $notification_txt = $CI->lang->line('project_status_changed')?$CI->lang->line('project_status_changed').' <span class="text-info text-strike">'.$old_status[0]['title'].'</span> = <span class="text-info">'.$project[0]['project_status'].'</span>':'Project status changed. <span class="text-info text-strike">'.$old_status[0]['title'].'</span> = <span class="text-info">'.$project[0]['project_status'].'</span>';
                }

                $notification_url = base_url('projects/detail/'.$notification['type_id']);
                
                if($project){
                    $extra = '<div class="text-small">
                    '.($CI->lang->line('project')?$CI->lang->line('project'):'Project').': <span class="text-info">'.$project[0]['title'].'</span> 
                    </div>';
                }
            }elseif($notification['type'] == 'project_file'){
                $notification_txt = $CI->lang->line('project_file_uploaded')?$notification['notification']." ".$CI->lang->line('project_file_uploaded'):$notification['notification']." project file uploaded.";
                $notification_url = base_url('projects/detail/'.$notification['type_id']);
                $project = $CI->projects_model->get_projects('',$notification['type_id']);
                if($project){
                    $extra = '<div class="text-small">
                    '.($CI->lang->line('project')?$CI->lang->line('project'):'Project').': <span class="text-info">'.$project[0]['title'].'</span> 
                    </div>';
                }
            }elseif($notification['type'] == 'new_task'){
                $notification_txt = $CI->lang->line('task_assigned_you')?$notification['notification']." ".$CI->lang->line('task_assigned_you'):$notification['notification']." task assigned you.";
                $task = $CI->projects_model->get_tasks('',$notification['type_id']);
                if($task){
                    $notification_url = base_url('projects/tasks/'.$task[0]['project_id'].'/'.$notification['type_id']);
                    $extra = '<div class="text-small">
                    '.($CI->lang->line('project')?$CI->lang->line('project'):'Project').': <span class="text-info">'.$task[0]['project_title'].'</span> 
                    '.($CI->lang->line('task')?$CI->lang->line('task'):'Task').': <span class="text-info">'.$task[0]['title'].'</span> 
                    </div>';
                }
            }elseif($notification['type'] == 'task_status'){
                $task_status_old = task_status($notification['notification']);
                $task = $CI->projects_model->get_tasks('',$notification['type_id']);

                if($task_status_old && $task){
                    $notification_txt = $CI->lang->line('task_status_changed')?($CI->lang->line('task_status_changed').' <span class="text-info text-strike">'.$task_status_old[0]['title'].'</span> = <span class="text-info">'.$task[0]['task_status'].'</span>'):('Task status changed. <span class="text-info text-strike">'.$task_status_old[0]['title'].'</span> = <span class="text-info">'.$task[0]['task_status'].'</span>');
                }
                
                if($task){
                    $notification_url = base_url('projects/tasks/'.$task[0]['project_id'].'/'.$notification['type_id']);
                    $extra = '<div class="text-small">
                    '.($CI->lang->line('project')?$CI->lang->line('project'):'Project').': <span class="text-info">'.$task[0]['project_title'].'</span> 
                    '.($CI->lang->line('task')?$CI->lang->line('task'):'Task').': <span class="text-info">'.$task[0]['title'].'</span> 
                    </div>';
                }
            }elseif($notification['type'] == 'task_file'){
                $notification_txt = $CI->lang->line('task_file_uploaded')?$notification['notification']." ".$CI->lang->line('task_file_uploaded'):$notification['notification']." task file uploaded.";
                $task = $CI->projects_model->get_tasks('',$notification['type_id']);
                if($task){
                    $notification_url = base_url('projects/tasks/'.$task[0]['project_id'].'/'.$notification['type_id']);
                    $extra = '<div class="text-small">
                    '.($CI->lang->line('project')?$CI->lang->line('project'):'Project').': <span class="text-info">'.$task[0]['project_title'].'</span> 
                    '.($CI->lang->line('task')?$CI->lang->line('task'):'Task').': <span class="text-info">'.$task[0]['title'].'</span> 
                    </div>';
                }
            }elseif($notification['type'] == 'task_comment'){
                $notification_txt = $CI->lang->line('new_task_comment')?$CI->lang->line('new_task_comment')." ".$notification['notification']:"New task comment ".$notification['notification'];
                $task = $CI->projects_model->get_tasks('',$notification['type_id']);
                if($task){
                    $notification_url = base_url('projects/tasks/'.$task[0]['project_id'].'/'.$notification['type_id']);
                    $extra = '<div class="text-small">
                    '.($CI->lang->line('project')?$CI->lang->line('project'):'Project').': <span class="text-info">'.$task[0]['project_title'].'</span> 
                    '.($CI->lang->line('task')?$CI->lang->line('task'):'Task').': <span class="text-info">'.$task[0]['title'].'</span> 
                    </div>';
                }
            }elseif($notification['type'] == 'project_comment'){
                $notification_txt = $CI->lang->line('new_project_comment')?$CI->lang->line('new_project_comment')." ".$notification['notification']:"New project comment ".$notification['notification'];
                $notification_url = base_url('projects/detail/'.$notification['type_id']);
                $project = $CI->projects_model->get_projects('',$notification['type_id']);
                if($project){
                    $extra = '<div class="text-small">
                    '.($CI->lang->line('project')?$CI->lang->line('project'):'Project').': <span class="text-info">'.$project[0]['title'].'</span> 
                    </div>';
                }
            }elseif($notification['type'] == 'new_invoice'){
                $invoice = $CI->invoices_model->get_invoices($notification['type_id']);
                if($invoice){
                    $invoice_id = '<span class="text-info">'.$invoice[0]['invoice_id'].'</span>';
                    $notification_txt = $CI->lang->line('new_invoice_received')?$invoice_id." ".$CI->lang->line('new_invoice_received'):$invoice_id." new invoice received.";
                    $notification_url = base_url('invoices/view/'.$invoice[0]['id']);
                }
            }elseif($notification['type'] == 'bank_transfer'){
                $invoice = $CI->invoices_model->get_invoices($notification['type_id']);
                if($invoice){
                    $invoice_id = '<span class="text-info">'.$invoice[0]['invoice_id'].'</span>';
                    $notification_txt = $CI->lang->line('bank_transfer_request_received_for_the_invoice')?$CI->lang->line('bank_transfer_request_received_for_the_invoice')." ".$invoice_id:"Bank transfer request received for the invoice ".$invoice_id;
                    $notification_url = base_url('invoices/view/'.$invoice[0]['id']);
                }
            }elseif($notification['type'] == 'bank_transfer_accept'){
                $invoice = $CI->invoices_model->get_invoices($notification['type_id']);
                if($invoice){
                    $invoice_id = '<span class="text-info">'.$invoice[0]['invoice_id'].'</span>';
                    $notification_txt = $CI->lang->line('bank_transfer_request_accepted_for_the_invoice')?$CI->lang->line('bank_transfer_request_accepted_for_the_invoice')." ".$invoice_id:"Bank transfer request accepted for the invoice ".$invoice_id;
                    $notification_url = base_url('invoices/view/'.$invoice[0]['id']);
                }
            }elseif($notification['type'] == 'bank_transfer_reject'){
                $invoice = $CI->invoices_model->get_invoices($notification['type_id']);
                if($invoice){
                    $invoice_id = '<span class="text-info">'.$invoice[0]['invoice_id'].'</span>';
                    $notification_txt = $CI->lang->line('bank_transfer_request_rejected_for_the_invoice')?$CI->lang->line('bank_transfer_request_rejected_for_the_invoice')." ".$invoice_id:"Bank transfer request rejected for the invoice ".$invoice_id;
                    $notification_url = base_url('invoices/view/'.$invoice[0]['id']);
                }
            }elseif($notification['type'] == 'payment_received'){
                $invoice = $CI->invoices_model->get_invoices($notification['type_id']);
                if($invoice){
                    $invoice_id = '<span class="text-info">'.$invoice[0]['invoice_id'].'</span>';
                    $notification_txt = $CI->lang->line('payment_received_for_the_invoice')?$CI->lang->line('payment_received_for_the_invoice')." ".$invoice_id:"Payment received for the invoice ".$invoice_id;
                    $notification_url = base_url('invoices/view/'.$invoice[0]['id']);
                }
            }elseif($notification['type'] == 'new_estimate'){
                $estimates = $CI->estimates_model->get_estimates($notification['type_id']); 
                if($estimates){
                    $title = '<span class="text-info">'.$notification['notification'].'</span>';
                    $notification_txt = $CI->lang->line('new_estimate_received')?$title." ".$CI->lang->line('new_estimate_received'):$title." new estimate received.";
                    $notification_url = base_url('estimates/view/'.$notification['type_id']);
                }
            }elseif($notification['type'] == 'estimate_reject'){
                $estimates = $CI->estimates_model->get_estimates($notification['type_id']); 
                if($estimates){
                    $title = '<span class="text-info">'.$notification['notification'].'</span>';
                    $notification_txt = $CI->lang->line('estimate_rejected')?$title." ".$CI->lang->line('estimate_rejected'):$title." estimate rejected.";
                    $notification_url = base_url('estimates/view/'.$notification['type_id']);
                }
            }elseif($notification['type'] == 'estimate_accept'){
                $estimates = $CI->estimates_model->get_estimates($notification['type_id']); 
                if($estimates){
                    $title = '<span class="text-info">'.$notification['notification'].'</span>';
                    $notification_txt = $CI->lang->line('estimate_accepted')?$title." ".$CI->lang->line('estimate_accepted'):$title." estimate accepted.";
                    $notification_url = base_url('estimates/view/'.$notification['type_id']);
                }
            }elseif($notification['type'] == 'new_meeting'){
                $meetings = $CI->meetings_model->get_meetings($notification['type_id']); 
                if($meetings){
                    $title = '<span class="text-info">'.$notification['notification'].'</span>';
                    $notification_txt = $CI->lang->line('new_meeting_created')?$title." ".$CI->lang->line('new_meeting_created'):$title." new meeting scheduled.";
                    $notification_url = base_url('meetings/view/'.$notification['type_id']);
                }
            }elseif($notification['type'] == 'new_estimate'){
                $estimates = $CI->estimates_model->get_estimates($notification['type_id']); 
                if($estimates){
                    $title = '<span class="text-info">'.$notification['notification'].'</span>';
                    $notification_txt = $CI->lang->line('new_estimate_received')?$title." ".$CI->lang->line('new_estimate_received'):$title." new estimate received.";
                    $notification_url = base_url('estimates/view/'.$notification['type_id']);
                }
            }elseif($notification['type'] == 'estimate_reject'){
                $estimates = $CI->estimates_model->get_estimates($notification['type_id']); 
                if($estimates){
                    $title = '<span class="text-info">'.$notification['notification'].'</span>';
                    $notification_txt = $CI->lang->line('estimate_rejected')?$title." ".$CI->lang->line('estimate_rejected'):$title." estimate rejected.";
                    $notification_url = base_url('estimates/view/'.$notification['type_id']);
                }
            }elseif($notification['type'] == 'estimate_accept'){
                $estimates = $CI->estimates_model->get_estimates($notification['type_id']); 
                if($estimates){
                    $title = '<span class="text-info">'.$notification['notification'].'</span>';
                    $notification_txt = $CI->lang->line('estimate_accepted')?$title." ".$CI->lang->line('estimate_accepted'):$title." estimate accepted.";
                    $notification_url = base_url('estimates/view/'.$notification['type_id']);
                }
            }elseif($notification['type'] == 'new_meeting'){
                $meetings = $CI->meetings_model->get_meetings($notification['type_id']); 
                if($meetings){
                    $title = '<span class="text-info">'.$notification['notification'].'</span>';
                    $notification_txt = $CI->lang->line('new_meeting_created')?$title." ".$CI->lang->line('new_meeting_created'):$title." new meeting scheduled.";
                    $notification_url = base_url('meetings/view/'.$notification['type_id']);
                }
            }elseif($notification['type'] == 'leave_request'){
                $leave = $CI->leaves_model->get_leaves_by_id($notification['type_id']);
                if($leave){
                    $notification_txt = $CI->lang->line('leave_request_received')?htmlspecialchars($CI->lang->line('leave_request_received')):'Leave request received';
                    $notification_url = base_url('leaves');
                }
            }elseif($notification['type'] == 'leave_request_accepted'){
                $leave = $CI->leaves_model->get_leaves_by_id($notification['type_id']);
                if($leave){
                    $notification_txt = $CI->lang->line('leave_request_accepted')?htmlspecialchars($CI->lang->line('leave_request_accepted')):'Leave request accepted';
                    $notification_url = base_url('leaves');
                }
            }elseif($notification['type'] == 'leave_request_rejected'){
                $leave = $CI->leaves_model->get_leaves_by_id($notification['type_id']);
                if($leave){
                    $notification_txt = $CI->lang->line('leave_request_rejected')?htmlspecialchars($CI->lang->line('leave_request_rejected')):'Leave request rejected';
                    $notification_url = base_url('leaves');
                }
            }elseif($notification['type'] == 'new_lead'){
                $leads = $CI->leads_model->get_leads_by_id($notification['type_id']);
                if($leads){
                $title = '<span class="text-info">'.$notification['notification'].'</span>';
                $notification_txt = $CI->lang->line('new_lead_assigned_to_you')?$title." ".$CI->lang->line('new_lead_assigned_to_you'):$title." New lead assigned to you.";
                $notification_url = base_url('leads');
                }
            }

            $temp[$key]['notification_url'] = $notification_url;

            $temp[$key]['notification'] = $notification_txt.' '.$extra;
            
            $temp[$key]['first_name'] = $notification['first_name'];
            $temp[$key]['last_name'] = $notification['last_name'];
            $temp[$key]['profile'] = $notification['profile'];

        }
    }else{
        $temp = array();
    }

    if(!empty($temp)){
        return $temp;
    }else{
        return false;
    }
}

function time_elapsed_string($datetime, $full = false) {
    $now = new DateTime;
    $ago = new DateTime($datetime);
    $diff = $now->diff($ago);

    $diff->w = floor($diff->d / 7);
    $diff->d -= $diff->w * 7;

    $string = array(
        'y' => 'year',
        'm' => 'month',
        'w' => 'week',
        'd' => 'day',
        'h' => 'hour',
        'i' => 'minute',
        's' => 'second',
    );
    foreach ($string as $k => &$v) {
        if ($diff->$k) {
            $v = $diff->$k . ' ' . $v . ($diff->$k > 1 ? 's' : '');
        } else {
            unset($string[$k]);
        }
    }

    if (!$full) $string = array_slice($string, 0, 1);
    return $string ? implode(', ', $string) . ' ago' : 'just now';
}

function recurse_copy($src,$dst) {
    $dir = opendir($src);
    if(!is_dir($dst)){
        mkdir($dst,0775,true);
    }
    while(false !== ( $file = readdir($dir)) ) {
        if (( $file != '.' ) && ( $file != '..' )) {
            if ( is_dir($src . '/' . $file) ) {
                recurse_copy($src . '/' . $file,$dst . '/' . $file);
            }
            else {
                copy($src . '/' . $file,$dst . '/' . $file);
            }
        }
    }
    closedir($dir);
}

function project_status($field = '', $status_id = ''){
    $CI =& get_instance();
    if(!empty($field)){
        $CI->db->select($field);
    }
    $CI->db->from('project_status');
    if(!empty($status_id)){
        $CI->db->where(['id'=>$status_id]);
    }
    $query = $CI->db->get();
    $data = $query->result_array();
    if(!empty($data)){
        foreach($data as $key => $project_title){
            $tmp[$key] = $project_title;
            if($project_title['title'] == 'Not Started'){
            $tmp[$key]['title'] = $CI->lang->line('not_started')?$CI->lang->line('not_started'):'Not Started';
            }elseif($project_title['title'] == 'On Going'){
            $tmp[$key]['title'] = $CI->lang->line('on_going')?$CI->lang->line('on_going'):'On Going';
            }elseif($project_title['title'] == 'Finished'){
            $tmp[$key]['title'] = $CI->lang->line('finished')?$CI->lang->line('finished'):'Finished';
            }
        }
        return $tmp;
    }else{
        return false;
    }
}

function priorities(){
    $CI =& get_instance();
    $CI->db->from('priorities');
    $query = $CI->db->get();
    $data = $query->result_array();
    if(!empty($data)){
        foreach($data as $key => $priority){
            $tmp[$key] = $priority;
            if($priority['title'] == 'Low'){
            $tmp[$key]['title'] = $CI->lang->line('low')?$CI->lang->line('low'):'Low';
            }elseif($priority['title'] == 'Medium'){
            $tmp[$key]['title'] = $CI->lang->line('medium')?$CI->lang->line('medium'):'Medium';
            }elseif($priority['title'] == 'High'){
            $tmp[$key]['title'] = $CI->lang->line('high')?$CI->lang->line('high'):'High';
            }
        }
        return $tmp;
    }else{
        return false;
    }
}

function task_status($id = ''){
    $CI =& get_instance();
    $CI->db->from('task_status');
    if(!empty($id)){
        $CI->db->where(['id'=>$id]);
    }
    $query = $CI->db->get();
    $data = $query->result_array();
    if(!empty($data)){
        foreach($data as $key => $task_title){
            $tmp[$key] = $task_title;
            if($task_title['title'] == 'Todo'){
            $tmp[$key]['title'] = $CI->lang->line('todo')?$CI->lang->line('todo'):'Todo';
            }elseif($task_title['title'] == 'In Progress'){
            $tmp[$key]['title'] = $CI->lang->line('in_progress')?$CI->lang->line('in_progress'):'In Progress';
            }elseif($task_title['title'] == 'In Review'){
            $tmp[$key]['title'] = $CI->lang->line('in_review')?$CI->lang->line('in_review'):'In Review';
            }elseif($task_title['title'] == 'Completed'){
            $tmp[$key]['title'] = $CI->lang->line('completed')?$CI->lang->line('completed'):'Completed';
            }
        }
        return $tmp;
    }else{
        return false;
    }
}

function get_languages($language_id = '', $language_name = '', $status = ''){
    $CI =& get_instance();
    $languages = $CI->languages_model->get_languages($language_id, $language_name, $status);
    if(empty($languages)){
        return false;
    }else{
        return $languages;
    }
}

function permissions($permissions_type = '')
{
    $CI =& get_instance();
    $CI->db->from('settings');
    if($CI->ion_auth->in_group(3)){
        $CI->db->where(['type'=>'clients_permissions']);
    }else{
        $CI->db->where(['type'=>'permissions']);
    }
    $query = $CI->db->get();
    $data = $query->result_array();

    if(!$data){
        return false;
    }
    
    $data = json_decode($data[0]['value']);

    if(empty($permissions_type)){
        return $data;
    }else{
        if(isset($data->$permissions_type)){
            return $data->$permissions_type;
        }else{
            return false;
        }
    }
} 

function users_permissions($permissions_type = '')
{
    $CI =& get_instance();
    $where_type = 'permissions';
    $CI->db->from('settings');
    $CI->db->where(['type'=>$where_type]);
    $query = $CI->db->get();
    $data = $query->result_array();

    if(!$data){
        return false;
    }
    
    $data = json_decode($data[0]['value']);

    if(empty($permissions_type)){
        return $data;
    }else{
        if(isset($data->$permissions_type)){
            return $data->$permissions_type;
        }else{
            return false;
        }
    }
} 

function clients_permissions($permissions_type = '')
{
    $CI =& get_instance();
    $CI->db->from('settings');
    $CI->db->where(['type'=>'clients_permissions']);
    $query = $CI->db->get();
    $data = $query->result_array();

    if(!$data){
        return false;
    }
    
    $data = json_decode($data[0]['value']);

    if(empty($permissions_type)){
        return $data;
    }else{
        if(isset($data->$permissions_type)){
            return $data->$permissions_type;
        }else{
            return false;
        }
    }
} 

function get_system_version(){
    $CI =& get_instance();
    $CI->db->select('value');
    $CI->db->from('settings');
    $CI->db->where(['type'=>'system_version']);
    $query = $CI->db->get();
    $data = $query->result_array();
    if(!empty($data)){
        return $data[0]['value'];
    }else{
        return false;
    }
}

function get_count($field,$table,$where = ''){ 
    if(!empty($where))
        $where = "where ".$where;
        
    $CI =& get_instance();
    $query = $CI->db->query("SELECT $field FROM ".$table." ".$where." ");
    $res = $query->result_array();
    if(!empty($res)){
        return count($res);
    }else{
        return 0;
    }
}

function get_email_library()
{
    $CI =& get_instance();
    $CI->db->from('settings');
    $CI->db->where(['type'=>'email']);
    $query = $CI->db->get();
    $data = $query->result_array();

    if(!$data){
        return "codeigniter";
    }

    $data = json_decode($data[0]['value']);

    if(!empty($data->email_library)){
        return $data->email_library;
    }else{
        return "codeigniter";
    }
} 

function smtp_host()
{
    $CI =& get_instance();
    $CI->db->from('settings');
    $CI->db->where(['type'=>'email']);
    $query = $CI->db->get();
    $data = $query->result_array();

    if(!$data){
        return false;
    }

    $data = json_decode($data[0]['value']);

    if(!empty($data->smtp_host)){
        return $data->smtp_host;
    }else{
        return false;
    }
} 

function smtp_port()
{
    $CI =& get_instance();
    $CI->db->from('settings');
    $CI->db->where(['type'=>'email']);
    $query = $CI->db->get();
    $data = $query->result_array();

    if(!$data){
        return false;
    }
    
    $data = json_decode($data[0]['value']);

    if(!empty($data->smtp_port)){
        return $data->smtp_port;
    }else{
        return false;
    }
} 

function smtp_username()
{
    $CI =& get_instance();
    $CI->db->from('settings');
    $CI->db->where(['type'=>'email']);
    $query = $CI->db->get();
    $data = $query->result_array();

    if(!$data){
        return false;
    }
    
    $data = json_decode($data[0]['value']);

    if(!empty($data->smtp_username)){
        return $data->smtp_username;
    }else{
        return false;
    }
}

function smtp_password()
{
    $CI =& get_instance();
    $CI->db->from('settings');
    $CI->db->where(['type'=>'email']);
    $query = $CI->db->get();
    $data = $query->result_array();

    if(!$data){
        return false;
    }
    
    $data = json_decode($data[0]['value']);

    if(!empty($data->smtp_password)){
        return $data->smtp_password;
    }else{
        return false;
    }
}

function smtp_encryption()
{
    $CI =& get_instance();
    $CI->db->from('settings');
    $CI->db->where(['type'=>'email']);
    $query = $CI->db->get();
    $data = $query->result_array();

    if(!$data){
        return false;
    }
    
    $data = json_decode($data[0]['value']);

    if(!empty($data->smtp_encryption)){
        return $data->smtp_encryption;
    }else{
        return false;
    }
}

function company_name()
{
    $CI =& get_instance();
    $CI->db->from('settings');
    $CI->db->where(['type'=>'general']);
    $query = $CI->db->get();
    $data = $query->result_array();

    if(!$data){
        return false;
    }
    
    $data = json_decode($data[0]['value']);

    if(!empty($data->company_name)){
        return $data->company_name;
    }else{
        return 'Your Company';
    }
} 

function company_email()
{
    $CI =& get_instance();
    $CI->db->from('settings');
    $CI->db->where(['type'=>'general']);
    $query = $CI->db->get();
    $data = $query->result_array();

    if(!$data){
        return false;
    }
    
    $data = json_decode($data[0]['value']);

    if(!empty($data->company_email)){
        return $data->company_email;
    }else{
        return 'admin@admin.com';
    }
} 

function footer_text()
{
    $CI =& get_instance();
    $CI->db->from('settings');
    $CI->db->where(['type'=>'general']);
    $query = $CI->db->get();
    $data = $query->result_array();

    if(!$data){
        return false;
    }
    
    $data = json_decode($data[0]['value']);

    if(!empty($data->footer_text)){
        return $data->footer_text;
    }else{
        return company_name().' '.date('Y').' All Rights Reserved';
    }
} 

function google_analytics()
{
    $CI =& get_instance();
    $CI->db->from('settings');
    $CI->db->where(['type'=>'general']);
    $query = $CI->db->get();
    $data = $query->result_array();

    if(!$data){
        return false;
    }
    
    $data = json_decode($data[0]['value']);

    if(!empty($data->google_analytics)){
        return $data->google_analytics;
    }else{
        return false;
    }
} 

function mysql_timezone()
{
    $CI =& get_instance();
    $CI->db->from('settings');
    $CI->db->where(['type'=>'general']);
    $query = $CI->db->get();
    $data = $query->result_array();

    if(!$data){
        return false;
    }
    
    $data = json_decode($data[0]['value']);

    if(!empty($data->mysql_timezone)){
        return $data->mysql_timezone;
    }else{
        return '-11:00';
    }
} 

function php_timezone()
{
    $CI =& get_instance();
    $CI->db->from('settings');
    $CI->db->where(['type'=>'general']);
    $query = $CI->db->get();
    $data = $query->result_array();

    if(!$data){
        return false;
    }
    
    $data = json_decode($data[0]['value']);

    if(!empty($data->php_timezone)){
        return $data->php_timezone;
    }else{
        return 'Pacific/Midway';
    }
} 

function system_date_format_js()
{
    $CI =& get_instance();
    $CI->db->from('settings');
    $CI->db->where(['type'=>'general']);
    $query = $CI->db->get();
    $data = $query->result_array();

    if(!$data){
        return false;
    }
    
    $data = json_decode($data[0]['value']);

    if(!empty($data->date_format_js)){
        return $data->date_format_js;
    }else{
        return 'd-m-yyyy';
    }
} 

function system_time_format_js()
{
    $CI =& get_instance();
    $CI->db->from('settings');
    $CI->db->where(['type'=>'general']);
    $query = $CI->db->get();
    $data = $query->result_array();

    if(!$data){
        return false;
    }
    
    $data = json_decode($data[0]['value']);

    if(!empty($data->time_format_js)){
        return $data->time_format_js;
    }else{
        return 'hh:MM A';
    }
} 

function count_days_btw_two_dates($today , $sec_date){
    $CI =& get_instance();
    $today=date_create($today);
    $sec_date=date_create($sec_date);
    $diff=date_diff($today,$sec_date);
    $data['days'] = $diff->format("%a");
    if($today < $sec_date || $today == $sec_date){
        $data['days_status'] = $CI->lang->line('left')?$CI->lang->line('left'):'Left';
    }else{
        $data['days_status'] = $CI->lang->line('overdue')?$CI->lang->line('overdue'):'Overdue';
    }
    return $data;
}

function format_date($date, $date_format){
    $date = str_replace('/', '-', $date);  
    $date = date_create($date);
    return date_format($date,$date_format);
}

function system_date_format()
{
    $CI =& get_instance();
    $CI->db->from('settings');
    $CI->db->where(['type'=>'general']);
    $query = $CI->db->get();
    $data = $query->result_array();

    if(!$data){
        return false;
    }
    
    $data = json_decode($data[0]['value']);

    if(!empty($data->date_format)){
        return $data->date_format;
    }else{
        return 'd-m-Y';
    }
} 

function system_time_format()
{
    $CI =& get_instance();
    $CI->db->from('settings');
    $CI->db->where(['type'=>'general']);
    $query = $CI->db->get();
    $data = $query->result_array();

    if(!$data){
        return false;
    }
    
    $data = json_decode($data[0]['value']);

    if(!empty($data->time_format)){
        return $data->time_format;
    }else{
        return 'h:i A';
    }
} 

function full_logo()
{
    $CI =& get_instance();
    $CI->db->from('settings');
    $CI->db->where(['type'=>'general']);
    $query = $CI->db->get();
    $data = $query->result_array();

    if(!$data){
        return false;
    }
    
    $data = json_decode($data[0]['value']);

    if(!empty($data->full_logo)){
        return $data->full_logo;
    }else{
        return 'logo.png';
    }
} 

function file_upload_format()
{
    $CI =& get_instance();
    $CI->db->from('settings');
    $CI->db->where(['type'=>'general']);
    $query = $CI->db->get();
    $data = $query->result_array();

    if(!$data){
        return false;
    }
    
    $data = json_decode($data[0]['value']);

    if(!empty($data->file_upload_format)){
        return $data->file_upload_format;
    }else{
        return 'jpg|png';
    }
}

function default_language()
{
    $CI =& get_instance();
    $CI->db->from('settings');
    $CI->db->where(['type'=>'general']);
    $query = $CI->db->get();
    $data = $query->result_array();

    if(!$data){
        return false;
    }
    
    $data = json_decode($data[0]['value']);

    if(!empty($data->default_language)){
        return $data->default_language;
    }else{
        return 'english';
    }
}


function formatBytes($bytes, $precision = 2) { 
    $units = array('KB', 'KB', 'MB', 'GB', 'TB'); 

    $bytes = max($bytes, 0); 
    $pow = floor(($bytes ? log($bytes) : 0) / log(1024)); 
    $pow = min($pow, count($units) - 1); 

    return round($bytes, $precision) . ' ' . $units[$pow]; 
} 

function half_logo()
{
    $CI =& get_instance();
    $CI->db->from('settings');
    $CI->db->where(['type'=>'general']);
    $query = $CI->db->get();
    $data = $query->result_array();

    if(!$data){
        return false;
    }
    
    $data = json_decode($data[0]['value']);

    if(!empty($data->half_logo)){
        return $data->half_logo;
    }else{
        return 'logo-half.png';
    }
} 

function favicon()
{
    $CI =& get_instance();
    $CI->db->from('settings');
    $CI->db->where(['type'=>'general']);
    $query = $CI->db->get();
    $data = $query->result_array();
    
    if(!$data){
        return false;
    }
    
    $data = json_decode($data[0]['value']);

    if(!empty($data->favicon)){
        return $data->favicon;
    }else{
        return 'favicon.png';
    }
} 


function time_formats(){
    $CI =& get_instance();
    $CI->db->from('time_formats');
    $query = $CI->db->get();
    $data = $query->result_array();
    if(!empty($data)){
        return $data;
    }else{
        return false;
    }
}

function date_formats(){
    $CI =& get_instance();
    $CI->db->from('date_formats');
    $query = $CI->db->get();
    $data = $query->result_array();
    if(!empty($data)){
        return $data;
    }else{
        return false;
    }
}

function timezones(){
    $list = DateTimeZone::listAbbreviations();
    $idents = DateTimeZone::listIdentifiers();
    
        $data = $offset = $added = array();
        foreach ($list as $abbr => $info) {
            foreach ($info as $zone) {
                if ( ! empty($zone['timezone_id'])
                    AND
                    ! in_array($zone['timezone_id'], $added)
                    AND 
                      in_array($zone['timezone_id'], $idents)) {
                    $z = new DateTimeZone($zone['timezone_id']);
                    $c = new DateTime(null, $z);
                    $zone['time'] = $c->format('H:i a');
                    $offset[] = $zone['offset'] = $z->getOffset($c);
                    $data[] = $zone;
                    $added[] = $zone['timezone_id'];
                }
            }
        }
    
        array_multisort($offset, SORT_ASC, $data);
        
        $i = 0;$temp = array();
        foreach ($data as $key => $row) {
            $temp[0] = $row['time'];
            $temp[1] = formatOffset($row['offset']);
            $temp[2] = $row['timezone_id'];
            $options[$i++] = $temp;
        }
        
        if(!empty($options)){
            return $options;
        }
}

function formatOffset($offset) {
    $hours = $offset / 3600;
    $remainder = $offset % 3600;
    $sign = $hours > 0 ? '+' : '-';
    $hour = (int) abs($hours);
    $minutes = (int) abs($remainder / 60);

    if ($hour == 0 AND $minutes == 0) {
        $sign = ' ';
    }
    return $sign . str_pad($hour, 2, '0', STR_PAD_LEFT).':'. str_pad($minutes,2, '0');
}

function is_my_project($id){
    $CI =& get_instance();
    $query = $CI->db->query("SELECT id FROM projects WHERE id=$id AND client_id=".$CI->session->userdata('user_id'));
    $res = $query->result_array();
    if(!empty($res)){
        return true;
    }else{
        return false;
    } 
}

?>