<script>
company_name = '<?=company_name()?>';
base_url = "<?=base_url();?>";
date_format_js = "<?=system_date_format_js();?>";
time_format_js = "<?=system_time_format_js();?>";
currency_code = "<?=get_currency('currency_code');?>";
currency_symbol = "<?=get_currency('currency_symbol');?>";
theme_color = "<?=htmlspecialchars(theme_color())?>";
tasks = "<?=$this->lang->line('tasks')?htmlspecialchars($this->lang->line('tasks')):'Tasks'?>";
days = "<?=$this->lang->line('days')?$this->lang->line('days'):'Days'?>";
wait = "<?=$this->lang->line('wait')?$this->lang->line('wait'):"Wait..."?>";
start_timer = "<?=$this->lang->line('start_timer')?$this->lang->line('start_timer'):'Start Timer'?>";
stop_timer = "<?=$this->lang->line('stop_timer')?$this->lang->line('stop_timer'):'Stop Timer'?>";
completed = "<?=$this->lang->line('completed')?htmlspecialchars($this->lang->line('completed')):'Completed'?>";
ok = "<?=$this->lang->line('ok')?htmlspecialchars($this->lang->line('ok')):'OK'?>";
cancel = "<?=$this->lang->line('cancel')?htmlspecialchars($this->lang->line('cancel')):'Cancel'?>";
create = "<?=$this->lang->line('create')?htmlspecialchars($this->lang->line('create')):'Create'?>";
update = "<?=$this->lang->line('update')?htmlspecialchars($this->lang->line('update')):'Update'?>";

progress = "<?=$this->lang->line('progress')?htmlspecialchars($this->lang->line('progress')):'Progress'?>";
default_language_can_not_be_deleted = "<?=$this->lang->line('default_language_can_not_be_deleted')?$this->lang->line('default_language_can_not_be_deleted'):"Default language can not be deleted."?>";
are_you_sure = "<?=$this->lang->line('are_you_sure')?$this->lang->line('are_you_sure'):"Are you sure?"?>";
you_want_to_delete_this_notification = "<?=$this->lang->line('you_want_to_delete_this_notification')?$this->lang->line('you_want_to_delete_this_notification'):"You want to delete this Notification?"?>";
you_want_to_delete_this_todo = "<?=$this->lang->line('you_want_to_delete_this_todo')?$this->lang->line('you_want_to_delete_this_todo'):"You want to delete this ToDo?"?>";
you_want_to_delete_this_note = "<?=$this->lang->line('you_want_to_delete_this_note')?$this->lang->line('you_want_to_delete_this_note'):"You want to delete this note?"?>";
you_want_to_delete_this_project_all_related_data_with_this_project_also_will_be_deleted = "<?=$this->lang->line('you_want_to_delete_this_project_all_related_data_with_this_project_also_will_be_deleted')?$this->lang->line('you_want_to_delete_this_project_all_related_data_with_this_project_also_will_be_deleted'):"You want to delete this project? All related data with this project also will be deleted."?>";
you_want_to_delete_this_task_all_related_data_with_this_task_also_will_be_deleted = "<?=$this->lang->line('you_want_to_delete_this_task_all_related_data_with_this_task_also_will_be_deleted')?$this->lang->line('you_want_to_delete_this_task_all_related_data_with_this_task_also_will_be_deleted'):"You want to delete this task? All related data with this task also will be deleted."?>";
you_want_to_delete_this_user_all_related_data_with_this_user_also_will_be_deleted = "<?=$this->lang->line('you_want_to_delete_this_user_all_related_data_with_this_user_also_will_be_deleted')?$this->lang->line('you_want_to_delete_this_user_all_related_data_with_this_user_also_will_be_deleted'):"You want to delete this user? All related data with this user also will be deleted."?>";
you_want_to_upgrade_the_system_please_take_a_backup_before_going_further = "<?=$this->lang->line('you_want_to_upgrade_the_system_please_take_a_backup_before_going_further')?$this->lang->line('you_want_to_upgrade_the_system_please_take_a_backup_before_going_further'):"You want to upgrade the system? Please take a backup before going further."?>";
you_want_to_delete_this_file = "<?=$this->lang->line('you_want_to_delete_this_file')?$this->lang->line('you_want_to_delete_this_file'):"You want to delete this file?"?>";
you_want_to_activate_this_user = "<?=$this->lang->line('you_want_to_activate_this_user')?$this->lang->line('you_want_to_activate_this_user'):"You want to activate this user?"?>";
you_want_to_deactivate_this_user_this_user_will_be_not_able_to_login_after_deactivation = "<?=$this->lang->line('you_want_to_deactivate_this_user_this_user_will_be_not_able_to_login_after_deactivation')?$this->lang->line('you_want_to_deactivate_this_user_this_user_will_be_not_able_to_login_after_deactivation'):"You want to deactivate this user? This user will be not able to login after deactivation."?>";
something_wrong_try_again = "<?=$this->lang->line('something_wrong_try_again')?$this->lang->line('something_wrong_try_again'):"Something wrong! Try again."?>";
you_want_to_delete_this_chat_this_can_not_be_undo = "<?=$this->lang->line('you_want_to_delete_this_chat_this_can_not_be_undo')?$this->lang->line('you_want_to_delete_this_chat_this_can_not_be_undo'):"You want to delete this chat? This can not be undo."?>";
we_will_contact_you_for_further_process_of_payment_as_soon_as_possible_click_ok_to_confirm = "<?=$this->lang->line('we_will_contact_you_for_further_process_of_payment_as_soon_as_possible_click_ok_to_confirm')?$this->lang->line('we_will_contact_you_for_further_process_of_payment_as_soon_as_possible_click_ok_to_confirm'):"We will contact you for further process of payment as soon as possible. Click OK to confirm."?>";
you_want_to_delete_this_language = "<?=$this->lang->line('you_want_to_delete_this_language')?$this->lang->line('you_want_to_delete_this_language'):"You want to delete this Language?"?>";
you_want_to_delete_this_tax = "<?=$this->lang->line('you_want_to_delete_this_tax')?$this->lang->line('you_want_to_delete_this_tax'):"You want to delete this Tax?"?>";
you_want_to_delete_this_invoice = "<?=$this->lang->line('you_want_to_delete_this_invoice')?$this->lang->line('you_want_to_delete_this_invoice'):"You want to delete this Invoice?"?>";
you_want_accept_this_offline_request_this_can_not_be_undo = "<?=$this->lang->line('you_want_accept_this_offline_request_this_can_not_be_undo')?$this->lang->line('you_want_accept_this_offline_request_this_can_not_be_undo'):"You want accept this offline / bank transfer request? This can not be undo."?>";
you_want_reject_this_offline_request_this_can_not_be_undo = "<?=$this->lang->line('you_want_reject_this_offline_request_this_can_not_be_undo')?$this->lang->line('you_want_reject_this_offline_request_this_can_not_be_undo'):"You want reject this offline / bank transfer request? This can not be undo."?>";
you_will_be_logged_out_from_the_current_account = "<?=$this->lang->line('you_will_be_logged_out_from_the_current_account')?htmlspecialchars($this->lang->line('you_will_be_logged_out_from_the_current_account')):'You will be logged out from the current account.'?>";
convert_invoice_to_estimate = "<?=$this->lang->line('convert_invoice_to_estimate')?htmlspecialchars($this->lang->line('convert_invoice_to_estimate')):'Convert invoice to estimate'?>";
convert_estimate_to_invoice = "<?=$this->lang->line('convert_estimate_to_invoice')?htmlspecialchars($this->lang->line('convert_estimate_to_invoice')):'Convert estimate to invoice'?>";

</script>

<!-- General JS Scripts -->
<script src="<?=base_url('assets/modules/jquery.min.js')?>"></script>
<script src="<?=base_url('assets/modules/popper.js')?>"></script>
<script src="<?=base_url('assets/modules/tooltip.js')?>"></script>
<script src="<?=base_url('assets/modules/bootstrap/js/bootstrap.min.js')?>"></script>
<script src="<?=base_url('assets/modules/nicescroll/jquery.nicescroll.min.js')?>"></script>
<script src="<?=base_url('assets/modules/moment.min.js')?>"></script>
<script src="<?=base_url('assets/js/stisla.js')?>"></script>
 
<!-- JS Libraies -->
<script src="<?=base_url('assets/modules/bootstrap-daterangepicker/daterangepicker.js')?>"></script>
<script src="<?=base_url('assets/modules/bootstrap-colorpicker/dist/js/bootstrap-colorpicker.min.js')?>"></script>
<script src="<?=base_url('assets/modules/chart.min.js')?>"></script>
<script src="<?=base_url('assets/modules/select2/dist/js/select2.full.min.js')?>"></script>
<script src="<?=base_url('assets/modules/bootstrap-table/tableExport.min.js');?>"></script>
<script src="<?=base_url('assets/modules/bootstrap-table/bootstrap-table.min.js');?>"></script>
<script src="<?=base_url('assets/modules/bootstrap-table/bootstrap-table-mobile.js');?>"></script>
<script src="<?=base_url('assets/modules/bootstrap-table/bootstrap-table-export.min.js');?>"></script>
<script src="<?=base_url('assets/modules/izitoast/js/iziToast.min.js');?>"></script>
<script src="<?=base_url('assets/modules/sweetalert/sweetalert.min.js');?>"></script>
<script src="<?=base_url('assets/modules/dropzonejs/min/dropzone.min.js');?>"></script>
<script src="<?=base_url('assets/modules/codemirror/lib/codemirror.js');?>"></script>

<!-- Template JS File -->
<script src="<?=base_url('assets/js/scripts.js')?>"></script>
<script src="<?=base_url('assets/js/custom.js')?>"></script>

<?php if($this->session->flashdata('message') && $this->session->flashdata('message_type') == 'success'){ ?>
  <script>
  iziToast.success({
    title: "<?=$this->session->flashdata('message');?>",
    message: "",
    position: 'topRight'
  });
  </script>
<?php } ?>

<script>
  function get_live_notifications(){

    var $notifications = [];
    var $unread_msg_count = [];
    var $whole_noti = '';
    var $new_noti = true;
    var $show_beep_for_msg = false;
    var $is_admin = <?=$this->ion_auth->is_admin()?1:0?>;
    var $permissions_chat_view = <?=permissions('chat_view')?>;

    $.ajax({
      type: "POST",
      url: base_url+'notifications/get_live_notifications', 
      dataType: "json",
      success:function(result){
        if(result['error'] == false){
          $notifications = result['data']['notifications'];
          $unread_msg_count = result['data']['unread_msg_count'];
          if($unread_msg_count.length && ($is_admin || $permissions_chat_view)){
            $show_beep_for_msg = true;
          }

          var $new_message = '';
          if($show_beep_for_msg){ 
              $new_noti = false;
              $new_message = '<a href="<?=base_url('chat')?>" class="dropdown-item dropdown-item-unread"><figure class="dropdown-item-icon avatar avatar-m bg-primary text-white fa fa-comment-alt"></figure><h6 class="dropdown-item-desc m-2"><?=$this->lang->line('new_message')?$this->lang->line('new_message'):'New Message'?></h6></a>';
          }

          if($notifications.length){ 
              $new_noti = false;
              $.each($notifications, function (key, notification) {

                var $profile = '';
                var $file_upload_path = '';

                if(typeof(notification['profile']) != "undefined" && notification['profile'] !== null && notification['profile'] !== ''){ 
                    $file_upload_path = 'assets/uploads/profiles/'+notification['profile'];
                    $profile = '<figure class="dropdown-item-icon avatar avatar-m bg-transparent"><img src="'+base_url+''+$file_upload_path+'" alt="'+notification['first_name']+' '+notification['last_name']+'" data-toggle="tooltip" data-placement="top" title="'+notification['first_name']+' '+notification['last_name']+'" data-original-title=""></figure>';
                }else{
                    $profile = '<figure class="dropdown-item-icon avatar avatar-m bg-primary text-white" data-initial="" data-toggle="tooltip" data-placement="top" title="'+notification['first_name'].substr(0, 1)+''+notification['last_name'].substr(0, 1)+'" data-original-title="'+notification['first_name']+' '+notification['last_name']+'"></figure>';
                }

                $whole_noti += '<a href="'+notification['notification_url']+'" class="dropdown-item dropdown-item-unread">'+$profile+'<div class="dropdown-item-desc  ml-2">'+notification['notification']+'<div class="time text-primary">'+notification['created']+'</div></div></a>';
              });

          }else{ if($new_noti){
              $whole_noti = '<a class="dropdown-item dropdown-item-unread"><div class="dropdown-item-desc  ml-2"><?=$this->lang->line('no_new_notifications')?$this->lang->line('no_new_notifications'):'No new notifications.'?></div></a>';
          } }

          if($notifications || $show_beep_for_msg){
            $("#show_beep_new_live_notifications").addClass('beep');
          }else{
            $("#show_beep_new_live_notifications").removeClass('beep');
          }
          $("#new_live_notifications").html($new_message+' '+$whole_noti);

        }else{
          $("#show_beep_new_live_notifications").removeClass('beep');
          $("#new_live_notifications").html('<a class="dropdown-item dropdown-item-unread"><div class="dropdown-item-desc  ml-2"><?=$this->lang->line('no_new_notifications')?$this->lang->line('no_new_notifications'):'No new notifications.'?></div></a>');
        }    
      },
      error:function(){
          $("#show_beep_new_live_notifications").removeClass('beep');
          $("#new_live_notifications").html('<a class="dropdown-item dropdown-item-unread"><div class="dropdown-item-desc  ml-2"><?=$this->lang->line('no_new_notifications')?$this->lang->line('no_new_notifications'):'No new notifications.'?></div></a>');   
      }
    });

  setTimeout(get_live_notifications, 10000);

  }

  get_live_notifications();
</script>


<?=get_footer_code()?>