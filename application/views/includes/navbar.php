<div class="navbar-bg"></div>
<nav class="navbar navbar-expand-lg main-navbar">
  <ul class="navbar-nav mr-auto">
    <li><a href="#" data-toggle="sidebar" class="nav-link nav-link-lg"><i class="fas fa-bars"></i></a></li>
  </ul>
  <ul class="navbar-nav navbar-right">

    <?php if(!$this->ion_auth->in_group(3)){ ?>
      <li id="nav_timer" class="<?=(check_my_timer())?'':'d-none'?>"><a href="<?=base_url('projects/timesheet')?>" class="nav-link nav-link-lg beep" target="_blank"><i class="fas fa-stopwatch text-danger"></i></a></li>
    <?php } ?>


    <?php echo get_notifications_live(); ?>
  
    <li class="dropdown">
      <a href="#" data-toggle="dropdown" class="nav-link notification-toggle nav-link-lg">
      <i class="fa fa-language"></i>
      </a>
      <div class="dropdown-menu dropdown-menu-right">
        <?php $languages = get_languages('', '', 1);
          if($languages){
          foreach($languages as $language){  ?>
            <a href="<?=base_url('languages/change/'.$language['language'])?>" class="dropdown-item <?=$language['language']==$this->session->userdata('lang') || ($language['language'] == default_language() && !$this->session->userdata('lang'))?'active':''?>">
              <?=ucfirst($language['language'])?>
            </a>
        <?php } } ?>
      </div>
    </li>


    <li class="dropdown"><a href="#" data-toggle="dropdown" class="nav-link dropdown-toggle nav-link-lg nav-link-user">
      <?php if(isset($current_user->profile) && !empty($current_user->profile)){ ?>
          <img alt="image" src="<?=base_url(UPLOAD_PROFILE.''.htmlspecialchars($current_user->profile))?>" class="rounded-circle mr-1">
      <?php }else{ ?>
          <figure class="avatar mr-2 avatar-sm bg-danger text-white" data-initial="<?=mb_substr(htmlspecialchars($current_user->first_name), 0, 1, "utf-8").''.mb_substr(htmlspecialchars($current_user->last_name), 0, 1, "utf-8")?>"></figure>
      <?php } ?>
      <div class="d-sm-none d-lg-inline-block"><?=htmlspecialchars($current_user->first_name)?> <?=htmlspecialchars($current_user->last_name)?></div></a>
      <div class="dropdown-menu dropdown-menu-right">
        <a href="<?=base_url('users/profile')?>" class="dropdown-item has-icon <?=(current_url() == base_url('users/profile'))?'active':''?>">
          <i class="far fa-user"></i> <?=$this->lang->line('profile')?$this->lang->line('profile'):'Profile'?>
        </a>

        <?php if($this->ion_auth->in_group(3)){ ?>
          <a href="<?=base_url('users/company')?>" class="dropdown-item has-icon <?=(current_url() == base_url('users/company'))?'active':''?>">
            <i class="far fa-copyright"></i> <?=$this->lang->line('company')?$this->lang->line('company'):'Company'?>
          </a>
        <?php } ?>

        <div class="dropdown-divider"></div>
        <a href="<?=base_url('auth/logout')?>" class="dropdown-item has-icon text-danger">
          <i class="fas fa-sign-out-alt"></i> <?=$this->lang->line('logout')?$this->lang->line('logout'):'Logout'?>
        </a>
      </div>
    </li>
  </ul>
</nav>
<div class="main-sidebar sidebar-style-2">
  <aside id="sidebar-wrapper">
    <div class="sidebar-brand">
      <a href="<?=base_url()?>"><img class="navbar-logos" alt="Logo" src="<?=base_url('assets/uploads/logos/'.full_logo())?>"></a>
    </div>
    <div class="sidebar-brand sidebar-brand-sm">
      <a href="<?=base_url()?>"><img class="navbar-logos" alt="Logo Half" src="<?=base_url('assets/uploads/logos/'.half_logo())?>"></a>
    </div>
    <ul class="sidebar-menu">
      <?php if($this->ion_auth->is_admin() || $this->ion_auth->in_group(2)){ ?> 
      <li <?=(current_url() == base_url('/'))?'class="active"':''; ?>><a class="nav-link" href="<?=base_url()?>"><i class="fas fa-home text-primary"></i> <span><?=$this->lang->line('dashboard')?$this->lang->line('dashboard'):'Dashboard'?></span></a></li>
      <?php } ?>
      <?php if($this->ion_auth->is_admin() || permissions('project_view')){ ?> 
        <li <?=(current_url() == base_url('projects') || $this->uri->segment(2) == 'detail' || $this->uri->segment(2) == 'list')?'class="active"':''; ?>><a class="nav-link" href="<?=base_url('projects')?>"><i class="fas fa-layer-group text-danger"></i> <span><?=$this->lang->line('projects')?$this->lang->line('projects'):'Projects'?></span></a></li>
      <?php } ?>

      <?php if($this->ion_auth->is_admin() || permissions('task_view')){ ?>  
        <li <?=(current_url() == base_url('projects/tasks') || $this->uri->segment(2) == 'tasks' || $this->uri->segment(2) == 'tasks-list')?'class="active"':''; ?>><a class="nav-link" href="<?=base_url('projects/tasks')?>"><i class="fas fa-tasks text-success"></i> <span><?=$this->lang->line('tasks')?$this->lang->line('tasks'):'Tasks'?></span></a></li>
      <?php } ?>
      
      
      <?php if($this->ion_auth->is_admin() || permissions('meetings_view')){ ?> 
        <li <?=(current_url() == base_url('meetings'))?'class="active"':''; ?>><a class="nav-link" href="<?=base_url('meetings')?>"><i class="fas fa-video text-dark"></i> <span><?=$this->lang->line('video_meetings')?$this->lang->line('video_meetings'):'Video Meetings'?></span></a></li>
      <?php } ?>

      <?php if($this->ion_auth->is_admin() || permissions('client_view')){ ?>  
        <li <?=(current_url() == base_url('users/client'))?'class="active"':''; ?>><a class="nav-link" href="<?=base_url('users/client')?>"><i class="fas fa-handshake text-warning"></i> <span><?=$this->lang->line('clients')?$this->lang->line('clients'):'Clients'?></span></a></li>
      <?php } ?>
      
      <?php if($this->ion_auth->is_admin() || permissions('user_view')){ ?> 
        <li <?=(current_url() == base_url('users'))?'class="active"':''; ?>><a class="nav-link" href="<?=base_url('users')?>"><i class="fas fa-users text-dark"></i> <span><?=$this->lang->line('team_members')?$this->lang->line('team_members'):'Team Members'?></span></a></li>
      <?php } ?>

      <?php if($this->ion_auth->is_admin() || permissions('chat_view')){ ?>  
        <li <?=(current_url() == base_url('chat'))?'class="active"':''; ?>><a class="nav-link" href="<?=base_url('chat')?>"><i class="fas fa-comment-alt text-primary"></i> <span><?=$this->lang->line('chat')?$this->lang->line('chat'):'Chat'?></span></a></li>
      <?php } ?>

      <?php if(!$this->ion_auth->in_group(3)){ ?>  
        <li <?=(current_url() == base_url('projects/timesheet') || $this->uri->segment(2) == 'timesheet')?'class="active"':''; ?>><a class="nav-link" href="<?=base_url('projects/timesheet')?>"><i class="fas fa-clock text-info"></i> <span><?=$this->lang->line('timesheet')?$this->lang->line('timesheet'):'Timesheet'?></span></a></li>
      <?php } ?>

      <?php if($this->ion_auth->is_admin() || permissions('gantt_view')){ ?>  
        <li <?=(current_url() == base_url('projects/gantt') || $this->uri->segment(2) == 'gantt')?'class="active"':''; ?>><a class="nav-link" href="<?=base_url('projects/gantt')?>"><i class="fas fa-layer-group text-success"></i> <span><?=$this->lang->line('gantt')?$this->lang->line('gantt'):'Gantt'?></span></a></li>
      <?php } ?>

      <?php if($this->ion_auth->is_admin() || permissions('calendar_view')){ ?>  
        <li <?=(current_url() == base_url('projects/calendar') || $this->uri->segment(2) == 'calendar')?'class="active"':''; ?>><a class="nav-link" href="<?=base_url('projects/calendar')?>"><i class="fas fa-calendar-alt text-danger"></i> <span><?=$this->lang->line('calendar')?$this->lang->line('calendar'):'Calendar'?></span></a></li>
      <?php } ?>

      <?php if($this->ion_auth->is_admin() || permissions('todo_view')){ ?>  
        <li <?=(current_url() == base_url('todo'))?'class="active"':''; ?>><a class="nav-link" href="<?=base_url('todo')?>"><i class="fas fa-tasks text-warning"></i> <span><?=$this->lang->line('todo')?$this->lang->line('todo'):'ToDo'?></span></a></li>
      <?php } ?>

      <?php if($this->ion_auth->is_admin() || permissions('notes_view')){ ?>  
        <li <?=(current_url() == base_url('notes'))?'class="active"':''; ?>><a class="nav-link" href="<?=base_url('notes')?>"><i class="fas fa-sticky-note text-info"></i> <span><?=$this->lang->line('notes')?$this->lang->line('notes'):'Notes'?></span></a></li>
      <?php } ?>
        
      <?php if(!$this->ion_auth->in_group(3)){ ?>  
        <li <?=(current_url() == base_url('leaves'))?'class="active"':''; ?>><a class="nav-link" href="<?=base_url('leaves')?>"><i class="fas fa-calendar-alt text-danger"></i> <span><?=$this->lang->line('leaves')?$this->lang->line('leaves'):'Leaves'?></span></a></li>
        <li <?=(current_url() == base_url('attendance'))?'class="active"':''; ?>><a class="nav-link" href="<?=base_url('attendance')?>"><i class="fas fa-clipboard-check text-warning"></i> <span><?=$this->lang->line('attendance')?$this->lang->line('attendance'):'Attendance'?></span></a></li>
      <?php } ?>

      <?php if($this->ion_auth->is_admin()){ ?>           
        <li class="dropdown <?=(current_url() == base_url('reports') || $this->uri->segment(1) == 'reports')?'active':''; ?>">
        <a class="nav-link has-dropdown" href="#"><i class="fas fa-chart-bar text-success"></i> 
        <span><?=$this->lang->line('reports')?$this->lang->line('reports'):'Reports'?></span></a>
          <ul class="dropdown-menu">

          
          <li <?=(current_url() == base_url('reports/projects'))?'class="active"':''; ?>><a class="nav-link" href="<?=base_url('reports/projects')?>"><?=$this->lang->line('projects')?htmlspecialchars($this->lang->line('projects')):'Projects'?></a></li>

          <li <?=(current_url() == base_url('reports/tasks'))?'class="active"':''; ?>><a class="nav-link" href="<?=base_url('reports/tasks')?>"><?=$this->lang->line('tasks')?htmlspecialchars($this->lang->line('tasks')):'Tasks'?></a></li>

          <li <?=(current_url() == base_url('reports/clients'))?'class="active"':''; ?>><a class="nav-link" href="<?=base_url('reports/clients')?>"><?=$this->lang->line('clients')?htmlspecialchars($this->lang->line('clients')):'Clients'?></a></li>

          <li <?=(current_url() == base_url('reports/team'))?'class="active"':''; ?>><a class="nav-link" href="<?=base_url('reports/team')?>"><?=$this->lang->line('team_members')?htmlspecialchars($this->lang->line('team_members')):'Team Members'?></a></li>

          <li <?=(current_url() == base_url('reports/meetings'))?'class="active"':''; ?>><a class="nav-link" href="<?=base_url('reports/meetings')?>"><?=$this->lang->line('video_meetings')?htmlspecialchars($this->lang->line('video_meetings')):'Video Meetings'?></a></li>

        
          <li <?=(current_url() == base_url('reports/timesheet'))?'class="active"':''; ?>><a class="nav-link" href="<?=base_url('reports/timesheet')?>"><?=$this->lang->line('timesheet')?htmlspecialchars($this->lang->line('timesheet')):'Timesheet'?></a></li>

          <li <?=(current_url() == base_url('reports/leaves'))?'class="active"':''; ?>><a class="nav-link" href="<?=base_url('reports/leaves')?>"><?=$this->lang->line('leaves')?htmlspecialchars($this->lang->line('leaves')):'Leaves'?></a></li>

          <li <?=(current_url() == base_url('reports/attendance'))?'class="active"':''; ?>><a class="nav-link" href="<?=base_url('reports/attendance')?>"><?=$this->lang->line('attendance')?htmlspecialchars($this->lang->line('attendance')):'Attendance'?></a></li>
          </ul>
        </li>
      <?php } ?>

      <?php if($this->ion_auth->is_admin()){ ?>  

        <li class="dropdown <?=($this->uri->segment(1) == 'settings' || $this->uri->segment(1) == 'languages')?'active':''; ?>">
        <a class="nav-link has-dropdown" href="#"><i class="fas fa-cog text-dark"></i> 
        <span><?=$this->lang->line('settings')?$this->lang->line('settings'):'Settings'?></span></a>
          <ul class="dropdown-menu">


              <li <?=(current_url() == base_url('settings/email'))?'class="active"':''; ?>><a class="nav-link" href="<?=base_url('settings/email')?>"><?=$this->lang->line('email')?$this->lang->line('email'):'Email'?></a></li>

              <li <?=(current_url() == base_url('settings/email-templates'))?'class="active"':''; ?>><a class="nav-link" href="<?=base_url('settings/email-templates')?>"><?=$this->lang->line('email_templates')?$this->lang->line('email_templates'):'Email Templates'?></a></li>

              <li <?=(current_url() == base_url('settings/user-permissions'))?'class="active"':''; ?>><a class="nav-link" href="<?=base_url('settings/user-permissions')?>"><?=$this->lang->line('user_permissions')?$this->lang->line('user_permissions'):'User Permissions'?></a></li>

          </ul>
        </li>

      <?php } ?>
      
    </ul>
  </aside>
</div>