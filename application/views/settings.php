<?php $this->load->view('includes/head'); ?>
</head>
<body>
  <div id="app">
    <div class="main-wrapper">
      <?php $this->load->view('includes/navbar'); ?>
        <div class="main-content">
          <section class="section">
            <div class="section-header">
              <div class="section-header-back">
                <a href="javascript:history.go(-1)" class="btn btn-icon"><i class="fas fa-arrow-left"></i></a>
              </div>
              <h1><?=$this->lang->line('settings')?$this->lang->line('settings'):'Settings'?></h1>
              <div class="section-header-breadcrumb">
                <div class="breadcrumb-item active"><a href="<?=base_url()?>"><?=$this->lang->line('dashboard')?$this->lang->line('dashboard'):'Dashboard'?></a></div>
                <div class="breadcrumb-item"><?=$this->lang->line('settings')?$this->lang->line('settings'):'Settings'?></div>
              </div>
            </div>

            <div class="section-body">
              <div class="row">
                <div class="col-md-3">
                  <div class="card card-primary">
                    <div class="card-body">
                      <ul class="nav nav-pills flex-column">
                        <li class="nav-item"><a href="<?=base_url('settings/email')?>" class="nav-link <?=($main_page == 'email')?'active':''?>"><i class="fas fa-at"></i> <?=$this->lang->line('email')?$this->lang->line('email'):'Email'?></a></li>
                        <li class="nav-item"><a href="<?=base_url('settings/email-templates')?>" class="nav-link <?=($main_page == 'email-templates')?'active':''?>"><i class="fas fa-mail-bulk"></i> <?=$this->lang->line('email_templates')?$this->lang->line('email_templates'):'Email Templates'?></a></li>
                        <li class="nav-item"><a href="<?=base_url('settings/user-permissions')?>" class="nav-link <?=($main_page == 'permissions')?'active':''?>"><i class="fas fa-user-cog"></i> <?=$this->lang->line('user_permissions')?$this->lang->line('user_permissions'):'User Permissions'?></a></li>
                      </ul>
                    </div>
                  </div>
                </div>
                <div class="col-md-9">
                  <div class="card card-primary" id="settings-card">
                    <?php $this->load->view('setting-forms/'.htmlspecialchars($main_page)); ?>
                  </div>
                </div>
              </div>
            </div>
          </section>
        </div>
      <?php $this->load->view('includes/footer'); ?>
    </div>
  </div>
<?php $this->load->view('includes/js'); ?>

<?php if($this->uri->segment(2) == 'custom-code'){ ?>
  <script>
    CodeMirror.fromTextArea(document.getElementById('header_code'), { 
      lineNumbers: true,
      theme: 'duotone-dark',
    }).on('change', editor => {
      $("#header_code").val(editor.getValue());
    });

    CodeMirror.fromTextArea(document.getElementById('footer_code'), { 
      lineNumbers: true,
      theme: 'duotone-dark',
    }).on('change', editor => {
      $("#footer_code").val(editor.getValue());
    });
  </script>
<?php } ?>

</body>
</html>
