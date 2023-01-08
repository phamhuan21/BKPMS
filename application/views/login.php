<?php $this->load->view('includes/head'); ?>
</head>
<body>
  <div id="app">
    <section class="section">
      <div class="container mt-5">
        <div class="row">
          <div class="col-12 col-sm-8 offset-sm-2 col-md-6 offset-md-3 col-lg-6 offset-lg-3 col-xl-4 offset-xl-4">
            <div class="login-brand">
              <img src="<?=base_url('assets/uploads/logos/'.full_logo());?>" alt="logo" width="100%">
            </div>

            <div class="card card-primary">
              <div class="card-header"><h4><?=$this->lang->line('login')?$this->lang->line('login'):'Login'?></h4></div>

              <div class="card-body">
                <form id="login" method="POST" action="<?=base_url('auth/login')?>" class="needs-validation" novalidate="">
                  <div class="form-group">
                    <label for="identity"><?=$this->lang->line('email')?$this->lang->line('email'):'Email'?></label>
                    <input id="identity" type="email" class="form-control" name="identity" tabindex="1" required autofocus>
                  </div>

                  <div class="form-group">
                    <div class="d-block">
                      <label for="password" class="control-label"><?=$this->lang->line('password')?$this->lang->line('password'):'Password'?></label>
                      <div class="float-right">
                        <a href="#" id="modal-forgot-password" class="text-small">
                        <?=$this->lang->line('forgot_password')?$this->lang->line('forgot_password'):'Forgot Password'?>
                        </a>
                      </div>
                    </div>
                    <input id="password" type="password" class="form-control" name="password" tabindex="2" required>
                  </div>

                  <div class="form-group">
                    <div class="custom-control custom-checkbox">
                      <input type="checkbox" name="remember" class="custom-control-input" tabindex="3" id="remember-me">
                      <label class="custom-control-label" for="remember-me"><?=$this->lang->line('remember_me')?$this->lang->line('remember_me'):'Remember Me'?></label>
                    </div>
                  </div>

                  <div class="form-group">
                    <button type="submit" class="savebtn btn btn-primary btn-lg btn-block" tabindex="4">
                    <?=$this->lang->line('login')?$this->lang->line('login'):'Login'?>
                    </button>
                  </div>

                  <div class="form-group">
                    <div class="result"><?=isset($message)?htmlspecialchars($message):'';?></div>
                  </div>

                </form>
              </div>
            </div>
            <div class="simple-footer">
              <?=footer_text()?>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
  
  <form class="modal-part" id="modal-forgot-password-part" action="<?=base_url('auth/forgot-password')?>" class="needs-validation" novalidate="" data-title="<?=$this->lang->line('forgot_password')?$this->lang->line('forgot_password'):'Forgot Password'?>" data-btn="<?=$this->lang->line('send')?$this->lang->line('send'):'Send'?>">
    <p><?=$this->lang->line('we_will_send_a_link_to_reset_your_password')?$this->lang->line('we_will_send_a_link_to_reset_your_password'):'We will send a link to reset your password.'?></p>
    <div class="form-group">
      <label><?=$this->lang->line('email')?$this->lang->line('email'):'Email'?></label>
      <div class="input-group">
        <div class="input-group-prepend">
          <div class="input-group-text">
            <i class="fas fa-envelope"></i>
          </div>
        </div>
        <input type="text" class="form-control" placeholder="Email" name="identity">
      </div>
    </div>
  </form>
<?php $this->load->view('includes/js'); ?>
</body>
</html>
