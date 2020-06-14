<aside class="pdocrud-side-bar col-sm-3" data-obj-key="<?php echo $objKey; ?>">
    <section class="panel">
        <?php if (!empty($sidebarImage) || !empty($sidebarHeading1) || !empty($sidebarHeading2)) { ?>
        <div class="pdocrud-side-bar-heading rounded">
            <?php if (!empty($sidebarImage)) { ?>
            <a href="javscript:;">
                <img src="<?php echo $sidebarImage; ?>" alt="">
            </a>
            <?php }?>
            <?php if (!empty($sidebarHeading1)) echo "<h1>" . $sidebarHeading1 . "</h1>"; ?> 
            <?php if (!empty($sidebarHeading2)) echo "<p>" . $sidebarHeading2 . "</p>"; ?>
        </div>
        <?php }?>
        <?php if($sidebarURLs) { ?>
        <ul class="nav nav-pills nav-stacked">
            <?php foreach($sidebarURLs as $url) { ?>
            <li><?php echo $url;?> </li>
             <?php }?>
        </ul>
        <?php }?>
    </section>
</aside>