<?php
require_once './script/pdocrud.php'; 



                
       $pdocrud = new PDOCrud(false, "pure", "pure");;
       if ($pdocrud->checkUserSession("userId")) {

		   $role=$pdocrud->getUserSession("role");

?>
<aside class="main-sidebar">
    <section class="sidebar">          
        <ul class="sidebar-menu">
            <li class="treeview">
				<a href="orders.php">
                    <i class="fa fa-dashboard"></i><span>Orders Master</span>
                </a>

				<?php 
			if ($role == 'Admin') {
				?>
				<a href="home.php">
                    <i class="fa fa-dashboard"></i><span>Customers Master</span>
                </a>
				<a href="category.php">
                    <i class="fa fa-dashboard"></i><span>Category Master</span>
                </a>
				<a href="cpyprofile.php">
                    <i class="fa fa-dashboard"></i><span>Company Profile</span>
                </a>
				<a href="state.php">
                    <i class="fa fa-dashboard"></i><span>State Master</span>
                </a>
				<a href="users.php">
                    <i class="fa fa-dashboard"></i><span>Users Master</span>
                </a>
				<?php
						}
					?>
				 <a href="logout.php">
                    <i class="fa fa-dashboard"></i><span>Logout</span>
                </a>
            </li>
        </ul>
    </section>
</aside>

<?php
	}
?>