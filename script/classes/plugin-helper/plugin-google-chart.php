<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
    jQuery(document).on("pdocrud_on_load pdocrud_after_submission pdocrud_after_ajax_action", function (event, container) {
        // Load google charts
        google.charts.load('current', {'packages':['corechart']});
        google.charts.setOnLoadCallback(drawChart);
            // Draw the chart and set the chart values
            function drawChart() {
                    var data = google.visualization.arrayToDataTable([
                            <?php
                            if(isset($params["data"])){
                                foreach($params["data"] as $googledata){
                                    $gval = "[";
                                    foreach($googledata as $val){
                                       $gval .=  $val.",";
                                    }
                                    echo rtrim($gval, ",");
                                    echo "],";
                                }
                            }
                            ?>
                              ]);

      var options = {
         <?php
         $parameters = array();
         if(isset($params["param"]))
            $parameters = $params["param"];
         
                        if (isset($parameters))
                            echo implode(', ', array_map(
                                            function ($v, $k) {
                                        return "'" . $k . "'" . ':' . "'" . $v . "'";
                                        }, $parameters, array_keys($parameters)
                            ));
                        ?>

      };
      <?php if(isset($parameters["google-chart-type"]) && $parameters["google-chart-type"]==="AreaChart") {?>
        var chart = new google.visualization.AreaChart(document.getElementById("<?php echo $elementName; ?>"));
      <?php } else if(isset($parameters["google-chart-type"]) && $parameters["google-chart-type"]==="PieChart") {?>
          var chart = new google.visualization.PieChart(document.getElementById("<?php echo $elementName; ?>"));
      <?php } else if(isset($parameters["google-chart-type"]) && $parameters["google-chart-type"]==="ColumnChart") {?>
          var chart = new google.visualization.ColumnChart(document.getElementById("<?php echo $elementName; ?>"));
      <?php } else if(isset($parameters["google-chart-type"]) && $parameters["google-chart-type"]==="LineChart") {?>
          var chart = new google.visualization.LineChart(document.getElementById("<?php echo $elementName; ?>"));
      <?php } else if(isset($parameters["google-chart-type"]) && $parameters["google-chart-type"]==="BubbleChart") {?>
        var chart = new google.visualization.BubbleChart(document.getElementById("<?php echo $elementName; ?>"));
      <?php } else if(isset($parameters["google-chart-type"]) && $parameters["google-chart-type"]==="BarChart") {?>   
        var chart = new google.visualization.BarChart(document.getElementById("<?php echo $elementName; ?>"));
      <?php } else {?>    
        var chart = new google.visualization.PieChart(document.getElementById("<?php echo $elementName; ?>"));
      <?php } ?>
          
      chart.draw(data, options);
  }
});
</script>