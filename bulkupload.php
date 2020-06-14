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
                echo "Please follow following steps before uploading data
                <BR/>1.Download Format file from  <a href='./uploads/uploadDataFormat.csv'>here</a>
                <BR/>2.Paste your Data file in  above file 
                <BR/>3.Rename File uploadData and save it in same CSV Format Only
                <BR/>4.Upload file in  uploads/uploadData.csv Folder 
                <BR/>5.Go to Bulk Import page in sidemenu
                <BR/>6.DO NOT REFRESH. Every time you refresh same data gets inserted TWICE!
                <BR/>7.Delete File From Server once data is imported";
                
                
                $pdocrud = new PDOCrud(); 
                echo "<BR/>Records Imported: ". $pdocrud->bulkImport("uploads/uploadData.csv", "Drivers");


                ?>
            </section>
        </div>
    </div>
   
</body>
</html>