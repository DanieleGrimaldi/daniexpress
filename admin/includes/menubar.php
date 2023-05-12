<aside class="main-sidebar">
  <!-- sidebar: style can be found in sidebar.less -->
  <section class="sidebar">
    <!-- Sidebar user panel -->
    <div class="user-panel">
      <div class="pull-left image">
        <img src="<?php echo (!empty($admin['photo'])) ? '../images/'.$admin['photo'] : '../images/profile.jpg'; ?>" class="img-circle" alt="User Image">
      </div>
      <div class="pull-left info">
        <p><?php echo $admin['firstname'].' '.$admin['lastname']; ?></p>
      </div>
    </div>
    <!-- sidebar menu: : style can be found in sidebar.less -->
    <ul class="sidebar-menu" data-widget="tree">
      <li class="header">MANAGE</li>
      <li><a href="users.php"><i class="fa fa-users"></i> <span>Users</span></a></li>
      <li><a href="products.php"><i class="fa"></i> Product List</a></li>
      <li><a href="category.php"><i class="fa"></i> Category</a></li>
      <li><a href="sales.php"><i class="fa"></i> Sales</a></li>
      <li><a href="../logout.php"><i class="fa"></i> LogOut</a></li>
    </ul>
  </section>
  <!-- /.sidebar -->
</aside>