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
                       
						 if(($pdocrud->getUserSession("role")) == "Admin" ){
								$pdocrud->setSettings("tableCellEdit", true);
								$pdocrud->setSettings("addbtn", true);
								$pdocrud->setSettings("delbtn", true);
								$pdocrud->setSettings("editbtn", true);
						 }else{
								$pdocrud->setSettings("tableCellEdit", false);
								$pdocrud->setSettings("addbtn", false);
								$pdocrud->setSettings("delbtn", false);
								$pdocrud->setSettings("editbtn", false);
						 }
						 
						 $pdocrud->crudTableCol(array("ID","order_suffix","order_date","PO","customer_name","customer_address","customer_state","order_amount","CGST","SGST","IGST","order_status","comments","seller"));
                        //$pdocrud->colSumTotal("product_sell_price");
						$pdocrud->fieldNotMandatory("order_suffix");
						$pdocrud->fieldNotMandatory("comments");
						$pdocrud->fieldNotMandatory("PO");
						$pdocrud->fieldNotMandatory("CGST");
						$pdocrud->fieldNotMandatory("SGST");
						$pdocrud->fieldNotMandatory("IGST");
						$pdocrud->fieldNotMandatory("transport_mode");
						$pdocrud->fieldNotMandatory("vehicle_no");
						$pdocrud->fieldNotMandatory("date_of_supply");
						$pdocrud->fieldNotMandatory("place_of_supply");
						$pdocrud->fieldNotMandatory("reverse_charge");
						$todaydt=date('Ymd');
						$pdocrud->crudColTooltip("CGST", "Add tax rate only eg 9 Do NOT Add % sign!");
						$pdocrud->crudColTooltip("SGST", "Add tax rate only eg 9 Do NOT Add % sign!");
						$pdocrud->crudColTooltip("IGST", "Add tax rate only eg 18 Do NOT Add % sign!");
                        
						$pdocrud->fieldDesc("CGST", "For CGST (Just add tax rate for eg 9 without % Keep empty if no value)");
						$pdocrud->fieldDesc("SGST", "For SGST (Just add tax rate for eg 9 without % Keep empty if no value)");
						$pdocrud->fieldDesc("IGST", "For IGST (Just add tax rate for eg 18 without % Keep empty if no value)");
						$pdocrud->fieldDesc("transport_mode", "Only applicable for IGST invoice Keep empty if no value");
						$pdocrud->fieldDesc("vehicle_no", "Only applicable for IGST invoice Keep empty if no value");
						$pdocrud->fieldDesc("date_of_supply", "Only applicable for IGST invoice Keep empty if no value");					
						$pdocrud->fieldDesc("place_of_supply", "Only applicable for IGST invoice Keep empty if no value");		


						$pdocrud->formFieldValue("order_no", "$todaydt");//set some default value  
						
						$newtodaydt=date('Y-m-d');
						$pdocrud->formFieldValue("order_no", "$todaydt");//set some default value 
						$pdocrud->formFieldValue("order_date", "$newtodaydt");//set some default value  

						$pdocrud->fieldTypes("category", "select");//change state to select dropdown
						$pdocrud->fieldDataBinding("category", "category", "category_id", "name", "db");

						$pdocrud->tableColAddition("Total", "sum",array("order_amount","CGST","SGST"));
						//$pdocrud->crudRemoveCol(array("ID"));	

						$pdocrud->fieldTypes("customer_name", "select"); //change type to select
                        $pdocrud->fieldDataBinding("customer_name", "customers","customer_name","customer_shortcode",  "db"); 


						$pdocrud->addDateRangeReport("This Year", "calendar_year", "order_date");
						$pdocrud->addDateRangeReport("This Month", "calendar_month", "order_date");
						$pdocrud->addDateRangeReport("Last 365 days", "year", "order_date");
						$pdocrud->addDateRangeReport("Last 30 days", "month", "order_date");
						$pdocrud->addDateRangeReport("1 Day", "Last 1 day", "order_date");
						$pdocrud->addDateRangeReport("Today", "today", "order_date");

						$pdocrud->fieldTypes("customer_address", "select"); //change type to select
                        $pdocrud->fieldDataBinding("customer_address", "customers", "customer_address","customer_shortcode", "db"); 

						$pdocrud->fieldTypes("customer_state", "select"); //change type to select
                        $pdocrud->fieldDataBinding("customer_state", "state", "name", "code", "db"); 
							
						$pdocrud->fieldTypes("seller", "select"); //change type to select
                        $pdocrud->fieldDataBinding("seller", "profile", "id", "name", "db"); 			 
						

						$action=$config["script_url"].'invoice.php?id={pk}';
						 $text = '<i class="fa fa-external-link" aria-hidden="true">CGST/SGST</i>';
						$attr = array("title"=>"View Invoice");
						$pdocrud->enqueueBtnActions("url2", $action, "url",$text,"order_status", $attr);
						

						$action=$config["script_url"].'IGST_invoice.php?id={pk}';
						$text = '<i class="fa fa-external-link" aria-hidden="true">IGST</i>';
						$attr = array("title"=>"View Invoice");
						$pdocrud->enqueueBtnActions("url3", $action, "url",$text,"order_status", $attr);


						$pdocrud->fieldTypes("order_status", "select"); //change fieldname to select dropdown
                        $pdocrud->fieldDataBinding("order_status", array("Completed", "In Progress", "Re-Issued.", "Pending", "Comments"), "", "", "array"); //add data
						 
						 echo $pdocrud->dbTable("orders")->render();
						 
                       		
                      
				}else{
                        echo 'You are not authorized to view this page';
               }

                ?>
            </section>
        </div>
    </div>
   
</body>
</html>