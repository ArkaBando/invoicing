<script type="text/javascript">
    jQuery(document).on("pdocrud_on_load pdocrud_after_ajax_action", function (event, container) {
    jQuery("<?php echo $elementName; ?>").pwstrength({
        <?php if(isset($params)){
            foreach($params as $key => $options) { ?>
           <?php echo $key?>: { <?php
            echo implode(', ', array_map(
                            function ($v, $k) {
                        return $k . ':' . $v;
                    }, $options, array_keys($options)
            ));
            ?>
               },
            <?php }
        }
            ?>
    });
    });
</script>    