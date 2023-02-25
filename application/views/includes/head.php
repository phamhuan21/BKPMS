<!DOCTYPE html>

<?php
$lang = $this->session->userdata('lang')?$this->session->userdata('lang'):default_language();
$my_current_lang = get_languages('', $lang);
if($my_current_lang){
  if(isset($my_current_lang[0]['active']) && $my_current_lang[0]['active'] == 1){
    $rtl = true;
    echo '<html lang="en" class="w-100 h-100" dir="rtl">';
  }else{
    $rtl = false;
    echo '<html lang="en" class="w-100 h-100">';
  }
}else{
  $rtl = false;
  echo '<html lang="en" class="w-100 h-100">';
}
?>

<head>
  <meta charset="UTF-8">
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
  <title><?=htmlspecialchars($page_title)?></title>

  <link rel="shortcut icon" href="<?=base_url('assets/uploads/logos/'.favicon())?>">
 
  <!-- General CSS Files -->
  <?php if($rtl){ ?>
    <link rel="stylesheet" href="<?=base_url('assets/modules/bootstrap/rtl/css/bootstrap.min.css')?>">
  <?php }else{ ?>
    <link rel="stylesheet" href="<?=base_url('assets/modules/bootstrap/css/bootstrap.min.css')?>">
  <?php } ?>

  <link rel="stylesheet" href="<?=base_url('assets/modules/fontawesome/css/all.min.css')?>">

  <!-- CSS Libraries -->
  <link rel="stylesheet" href="<?=base_url('assets/modules/bootstrap-daterangepicker/daterangepicker.css')?>">
  <link rel="stylesheet" href="<?=base_url('assets/modules/bootstrap-colorpicker/dist/css/bootstrap-colorpicker.min.css')?>">
  <link rel="stylesheet" href="<?=base_url('assets/modules/select2/dist/css/select2.min.css')?>">
  <link rel="stylesheet" href="<?=base_url('assets/modules/bootstrap-table/bootstrap-table.min.css');?>">
  <link rel="stylesheet" href="<?=base_url('assets/modules/izitoast/css/iziToast.min.css');?>">
  <link rel="stylesheet" href="<?=base_url('assets/modules/dropzonejs/dropzone.css');?>">
  <link rel="stylesheet" href="<?=base_url('assets/modules/dragula/dragula.min.css');?>" >
  <link rel="stylesheet" href="<?=base_url('assets/modules/codemirror/lib/codemirror.css');?>">
  <link rel="stylesheet" href="<?=base_url('assets/modules/codemirror/theme/duotone-dark.css');?>">
  <link rel="stylesheet" href="<?=base_url('assets/css/renew.css');?>">

  <!-- Template CSS -->
  <?php if($rtl){ ?>
  <link rel="stylesheet" href="<?=base_url('assets/css/rtl/style.css')?>">
  <link rel="stylesheet" href="<?=base_url('assets/css/rtl/components.css')?>">
  <link rel="stylesheet" href="<?=base_url('assets/css/rtl/custom.css')?>">
  <?php }else{ ?>
  <link rel="stylesheet" href="<?=base_url('assets/css/style.css')?>">
  <link rel="stylesheet" href="<?=base_url('assets/css/components.css')?>">
  <link rel="stylesheet" href="<?=base_url('assets/css/custom.css')?>">
  <?php } ?>
  
  <style>
      :root{--theme-color: <?=theme_color()?>;}
  </style>
  <style>
      body{font-family: -apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif,"Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol","Noto Color Emoji" !important;}
  </style>

<?php $google_analytics = google_analytics(); if($google_analytics){ ?>
  <script async src="https://www.googletagmanager.com/gtag/js?id=<?=htmlspecialchars($google_analytics)?>"></script>
  <script>
    window.dataLayer = window.dataLayer || [];
    function gtag(){dataLayer.push(arguments);}
    gtag('js', new Date());
    gtag('config', '<?=htmlspecialchars($google_analytics)?>');
  </script>
<?php } ?>
<?=get_header_code()?>