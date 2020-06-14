<?php if (isset($advSearch)) { ?>
    <form class="pdocrud-adv-search-form">
        <div class="pdocrud-adv-search-container" data-objkey="<?php echo $objKey; ?>" >
            <div class="row">
                <div class="col-sm-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title"><?php echo $lang["advance_search"];?> </h4>
                        </div>
                        <div class="panel-body">
                            
                            <?php 
                            $loopCol = 0;
                            foreach ($advSearch as $search) { ?>
                                <?php if($loopCol%2 === 0) { ?>
                                    <div class="row">
                                <?php } ?>
                                        <div class="form-group col-sm-6 validating">
                                            <?php echo $search["lable"]; ?>
                                            <?php echo $search["element"]; ?>
                                        </div>
                                <?php if($loopCol >0 && ($loopCol+1)%2 === 0) { ?>
                                    </div>
                               <?php } ?>
                            <?php $loopCol++;  } 
                            ?>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <input type="hidden" class="pdoobj" value="<?php echo $objKey; ?>" />
    </form>
    <div class="pdocrud-adv-search-result"></div>
<?php } ?>