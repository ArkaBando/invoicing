<?php 
ob_start();
require_once './script/pdocrud.php'; 
include './includes/header.php';

?>
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
                
                $pdocrud = new PDOCrud(false, "pure", "pure");;
               
                
                if ($pdocrud->checkUserSession("userId")) {
                   
                        echo "Welcome ".$pdocrud->getUserSession("userName");
                         $pdocrud->setSkin("pure");
                         $pdocrud->setSettings("autoSuggestion", true); 
                         $pdocrud->setSettings("tableCellEdit", true);
						 $pdocrud->fieldTypes("role", "select"); //change fieldname to select dropdown
                         $pdocrud->fieldDataBinding("role", array("Admin", "Staff"), "", "", "array"); 
						 echo $pdocrud->dbTable("login")->render();
                      
				}else{
                        echo 'You are not authorized to view this page';
               }

                ?>
            </section>
        </div>
    </div>
   
</body>
</html>