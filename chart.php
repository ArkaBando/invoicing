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
                $pdocrud = new PDOCrud();
                $pdocrud->addChart("chart1", "google-chart", array("'Task'" => "'Hour per day'","'Work'"=>8, "'Eat'"=>2, "'TV'"=>3, "'Gym'"=>4,"'Sleep'"=>9), "", "", "array",array("title" => "Drivers Data","width"=>"500", "height"=>"500","google-chart-type"=>"LineChart"));
                $pdocrud->addChart("chart2", "google-chart", array("'Task'" => "'Hour per day'","'Work'"=>8, "'Eat'"=>2, "'TV'"=>3, "'Gym'"=>4,"'Sleep'"=>9), "", "", "array",array("title" => "Drivers Data","width"=>"500", "height"=>"500","google-chart-type"=>"BarChart"));
                $pdocrud->addChart("chart3", "google-chart", array("'Task'" => "'Hour per day'","'Work'"=>8, "'Eat'"=>2, "'TV'"=>3, "'Gym'"=>4,"'Sleep'"=>9), "", "", "array",array("title" => "Drivers Data","width"=>"500", "height"=>"500","google-chart-type"=>"PieChart"));
                $pdocrud->addChart("chart4", "google-chart", array("'Task'" => "'Hour per day'","'Work'"=>8, "'Eat'"=>2, "'TV'"=>3, "'Gym'"=>4,"'Sleep'"=>9), "", "", "array",array("title" => "Drivers Data","width"=>"500", "height"=>"500","pieHole"=> 0.4,"google-chart-type"=>"PieChart"));
                $pdocrud->addChart("chart5", "google-chart", array("'Task'" => "'Hour per day'","'Work'"=>8, "'Eat'"=>2, "'TV'"=>3, "'Gym'"=>4,"'Sleep'"=>9), "", "", "array",array("title" => "Drivers Data","width"=>"500", "height"=>"500","google-chart-type"=>"AreaChart"));
                echo $pdocrud->render("chart", array("chart1","chart2","chart3","chart4","chart5"));
                ?>
            </section>
        </div>
    </div>
   
</body>
</html>