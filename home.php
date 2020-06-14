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
						 $pdocrud->crudTableCol(array("customer_name","customer_address","customer_state","gstno","panno"));
                         $pdocrud->dbOrderBy("customer_id asc");//descending
						 $pdocrud->fieldTypes("customer_state", "select");//change state to select dropdown
						$pdocrud->fieldDataBinding("customer_state", "state", "code", "name", "db");
						 $pdocrud->fieldNotMandatory("customer_contact_number");
						 $pdocrud->fieldNotMandatory("email");
						 $pdocrud->fieldNotMandatory("comment");
						 $pdocrud->fieldNotMandatory("gstno");
						 $pdocrud->fieldNotMandatory("panno");
						 echo $pdocrud->dbTable("customers")->render();
                        		
                      
				}else{
                        echo 'You are not authorized to view this page';
               }

                ?>
            </section>
        </div>
    </div>
   
</body>
</html>