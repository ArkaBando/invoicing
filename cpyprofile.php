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
                         $pdocrud->setSettings("searchbox", false);
						 $pdocrud->setSettings("deleteMultipleBtn",false);
                         $pdocrud->setSettings("tableCellEdit", true);
						 $pdocrud->crudTableCol(array("logo","name","address","gstno","panno","state","bankdetails"));
						 
						 $pdocrud->viewColFormatting("logo", "image");
						 $pdocrud->resizeImage(array("100"=>"100"));
						 $pdocrud->fieldTypes("logo", "image");
						 $pdocrud->thumbnailImage(100, 100);
                         $pdocrud->dbOrderBy("id asc");//descending
						 $pdocrud->fieldTypes("state", "select");//change state to select dropdown
						 $pdocrud->fieldDataBinding("state", "state", "code", "name", "db");
						 $pdocrud->fieldNotMandatory("phone");
						 $pdocrud->fieldNotMandatory("fax");
						 echo $pdocrud->dbTable("profile")->render();
                         		
                      
				}else{
                        echo 'You are not authorized to view this page';
               }

                ?>
            </section>
        </div>
    </div>
   
</body>
</html>