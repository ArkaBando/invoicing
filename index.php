<?php require_once './script/pdocrud.php'; ?>
<?php include './includes/header.php'; ?>



<body class="hold-transition skin-blue sidebar-mini">
    <!-- Site wrapper -->
    <div class="wrapper">
            <!-- Content Wrapper. Contains page content -->
             <?php include './includes/topheader.php'; ?>
             <?php include './includes/sidebar.php'; ?>
        <div class="content-wrapper">
            
            <!-- Code box -->
            <section class="content">
                
<?php    

            
             $pdo_crud = new PDOCrud();
             //$pdo_crud->addCallback("before_select", "beforeloginCallback");
             $pdo_crud->addCallback("after_select", "afterLoginCallBack");
             $pdo_crud->formFields(array("email", "password"));
			 //$pdo_crud->fieldTypes("role", "select");
			 //$pdo_crud->fieldDataBinding("role", array("Admin", "Staff"), "", "", "array");
			 $pdo_crud->setUserSession("userId", "user_id");
             $pdo_crud->setUserSession("userName", "user_name");
             $pdo_crud->setUserSession("role", "role");
			 $url=$config["script_url"].'orders.php';
             $pdo_crud->formRedirection("$url",true);
             echo $pdo_crud->dbTable("login")->render("selectform");
 
 
 ?>
            </section>
        </div>
    </div>
   
</body>
</html>