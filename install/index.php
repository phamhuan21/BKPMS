<?php

error_reporting(0);

$db_config_path = '../application/config/database.php';

function show_message($type,$message) {
    return $message;
}

function write_config($data) {

    $template_path 	= 'assets/template.php';
    
    $output_path 	= '../application/config/database.php';

    $database_file = file_get_contents($template_path);

    $new  = str_replace("%HOSTNAME%",$data['hostname'],$database_file);
    $new  = str_replace("%USERNAME%",$data['username'],$new);
    $new  = str_replace("%PASSWORD%",$data['password'],$new);
    $new  = str_replace("%DATABASE%",$data['name'],$new);

    $handle = fopen($output_path,'w+');
    @chmod($output_path,0777);
    
    if(is_writable(dirname($output_path))) {

        if(fwrite($handle,$new)) {

            $template_path_user 	= 'assets/template.sql';
            
            $output_path_user 	= 'assets/sqlcommand.sql';

            $database_file_user = file_get_contents($template_path_user);
            
            $password = trim($data['admin_password']); 

            $email = trim($data['admin_email']);

            if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
                return false;
            }

            if(strlen($password) < 8){
                return false;
            }

            $new_user  = str_replace("%ADMINEMAIL%",$email,$database_file_user);

            $params = [
                'cost' => 12
            ];

            if (empty($password) || strpos($password, "\0") !== FALSE || strlen($password) > 32)
            {
                return FALSE;
            }else{
                $password = password_hash($password, PASSWORD_BCRYPT, $params);
            }

            $new_user  = str_replace("%ADMINPASSWORD%",$password,$new_user);
            
            $handle_user = fopen($output_path_user,'w+');
            @chmod($output_path_user,0777);
            
            if(is_writable(dirname($output_path_user))) {

                if(fwrite($handle_user,$new_user)) {
                    return true;
                } else {
                    return false;
                }
            } else {
                return false;
            }
        } else {
            return false;
        }
    } else {
        return false;
    }
}

function checkFile(){
    $output_path = '../application/config/database.php';
    
    if (file_exists($output_path)) {
       return true;
    } 
    else{
        return false;
    }
}

function create_database($data)
{
    $mysqli = new mysqli($data['hostname'],$data['username'],$data['password'],'');
    if(mysqli_connect_errno())
        return false;
    $mysqli->query("CREATE DATABASE IF NOT EXISTS ".$data['name']);
    $mysqli->close();
    return true;
}

function create_tables($data)
{	
    $password = !empty($data['password'])?$data['password']:'';
    $mysqli = new mysqli($data['hostname'],$data['username'],$password,$data['name']);
    if(mysqli_connect_errno())
        return false;
    $query = file_get_contents('assets/sqlcommand.sql');
    $mysqli->multi_query($query);
    $mysqli->close();
    return true;
}

if($_SERVER['REQUEST_METHOD'] == 'POST' && $_POST) {

    if(!empty($_POST['hostname']) && !empty($_POST['username']) && !empty($_POST['name'])  && !empty($_POST['admin_email'])  && !empty($_POST['admin_password'])){
        if(create_database($_POST) == false)
        {
            $message = show_message('error',"The database could not be created, make sure your the host, username, password, database name is correct.");
        }else if (write_config($_POST) == false)
        {
            $message = show_message('error',"The database configuration file could not be written, please chmod application/config/database.php file to 777 OR Email and Password not passed validation.");
        }
        else if (create_tables($_POST) == false)
        {
            $message = show_message('error',"The database could not be created, make sure your the host, username, password, database name is correct.");
        } 
        else if (checkFile() == false)
        {
            $message = show_message('error',"File application/config/database.php is Empty");
        }
         
        if(!isset($message)) {
            copy('assets/index.php', '../index.php');
            $domain = $_SERVER['HTTP_HOST'] . $_SERVER['SCRIPT_NAME'];
            $domain = preg_replace('/index.php.*/', '', $domain);
            $domain = preg_replace('/install.*/', '', $domain);
            if (!empty($_SERVER['HTTPS'])) {
                $urlWb = 'https://' . $domain;
            } else {
                $urlWb = 'http://' . $domain;
            }
            header("Location: ".$urlWb."settings/clear-cache");
        }
    }else{
        $message = show_message('error','The host, username, database name. admin email and admin password is required.');
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>HIGH Installer</title>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="../assets/uploads/logos/logo-half.png">
 
    <!-- General CSS Files -->
    <link rel="stylesheet" href="../assets/modules/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../assets/modules/fontawesome/css/all.min.css">

    <!-- CSS Libraries -->
    <link rel="stylesheet" href="../assets/modules/bootstrap-daterangepicker/daterangepicker.css">
    <link rel="stylesheet" href="../assets/modules/select2/dist/css/select2.min.css">
    <link rel="stylesheet" href="../assets/modules/bootstrap-table/bootstrap-table.min.css">
    <link rel="stylesheet" href="../assets/modules/izitoast/css/iziToast.min.css">
    <link rel="stylesheet" href="../assets/modules/dropzonejs/dropzone.css">

    <!-- Template CSS -->
    <link rel="stylesheet" href="../assets/css/style.css">
    <link rel="stylesheet" href="../assets/css/components.css">
    <link rel="stylesheet" href="../assets/css/custom.css">

</head>
<body class="bg-secondary">

	<div class="container">

        <div class="row mt-4">
        
                        
            <div class="col-12">
            <div class="card">
                <div class="card-body">
                <div class="empty-state p-2">
                    <img src="../assets/uploads/logos/logo.png" style="max-width: 35%; max-height: 100%;">
                    <h2>Welcome to HIGH Installer</h2>
                </div>
                <form class="wizard-content mt-2" method="POST" action="<?php echo $_SERVER['PHP_SELF']; ?>">

                    <?php
                        if(isset($message)) {
                            if( isset($type) && $type == 'success' ){
                                echo '
                                <div class="alert alert-success alert-dismissible" role="alert">
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                ' . htmlspecialchars($message) . '
                                </div>';
                            }else{
                                echo '
                                <div class="alert alert-warning alert-dismissible" role="alert">
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                ' . htmlspecialchars($message) . '
                                </div>';
                            }
                        }
                    ?>

                    <div class="wizard-pane">
                    <div class="form-group row align-items-center">
                        <label class="col-md-4 text-md-right text-left">Database Hostname</label>
                        <div class="col-lg-4 col-md-6">
                        <input type="text" name="hostname" class="form-control" value="localhost">
                        </div>
                    </div>
                    
                    <div class="form-group row align-items-center">
                        <label class="col-md-4 text-md-right text-left">Database Name</label>
                        <div class="col-lg-4 col-md-6">
                        <input type="text" name="name" class="form-control">
                        </div>
                    </div>

                    <div class="form-group row align-items-center">
                        <label class="col-md-4 text-md-right text-left">Database Username</label>
                        <div class="col-lg-4 col-md-6">
                        <input type="text" name="username" class="form-control">
                        </div>
                    </div>
                    
                    <div class="form-group row align-items-center">
                        <label class="col-md-4 text-md-right text-left">Database Password</label>
                        <div class="col-lg-4 col-md-6">
                        <input type="text" name="password" class="form-control">
                        </div>
                    </div>
                    
                    <div class="form-group row align-items-center">
                        <label class="col-md-4 text-md-right text-left">Admin Email</label>
                        <div class="col-lg-4 col-md-6">
                        <input type="email" name="admin_email" class="form-control">
                        </div>
                    </div>
                    
                    <div class="form-group row align-items-center">
                        <label class="col-md-4 text-md-right text-left">Admin Password</label>
                        <div class="col-lg-4 col-md-6">
                        <input type="text" name="admin_password" pattern="^.{8}.*$" class="form-control">
                        <small class="form-text text-muted">
                            Your password must be 8 characters long.
                        </small>
                        </div>
                    </div>

                    <div class="form-group row">
                        <div class="col-md-4"></div>
                        <div class="col-lg-4 col-md-6 text-right">
                        <button type="submit" class="btn btn-icon icon-right btn-secondary" onclick="$(this).html('Installing...');">Install </button>
                        </div>
                    </div>
                    </div>
                </form>
                </div>
            </div>
            </div>
        </div>
	</div>


    <!-- General JS Scripts -->
<script src="../assets/modules/jquery.min.js"></script>
<script src="../assets/modules/popper.js"></script>
<script src="../assets/modules/tooltip.js"></script>
<script src="../assets/modules/bootstrap/js/bootstrap.min.js"></script>
<script src="../assets/modules/nicescroll/jquery.nicescroll.min.js"></script>
<script src="../assets/modules/moment.min.js"></script>
<script src="../assets/js/stisla.js"></script>
 
<!-- JS Libraies -->
<script src="../assets/modules/bootstrap-daterangepicker/daterangepicker.js"></script>
<script src="../assets/modules/chart.min.js"></script>
<script src="../assets/modules/select2/dist/js/select2.full.min.js"></script>
<script src="../assets/modules/bootstrap-table/bootstrap-table.min.js"></script>
<script src="../assets/modules/bootstrap-table/bootstrap-table-mobile.js"></script>
<script src="../assets/modules/izitoast/js/iziToast.min.js"></script>
<script src="../assets/modules/sweetalert/sweetalert.min.js"></script>
<script src="../assets/modules/dropzonejs/min/dropzone.min.js"></script>

<!-- Template JS File -->
<script src="../assets/js/scripts.js"></script>
<script src="../assets/js/custom.js"></script>
</body>
</html>
