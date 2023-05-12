<?php include 'includes/session.php'; ?>
<?php include 'includes/header.php';?>
<body class="hold-transition skin-blue layout-top-nav">
<div class="wrapper">

	<?php 
	include 'includes/navbar.php'; ?>
	  <div class="content-wrapper">
	  <?php if(isset($_SESSION['message'])){
				echo "
				<div class='callout callout-"; echo ($_SESSION['error']) ? 'danger' : 'success'; echo" success danger text-center'>
					<p>".$_SESSION['message']."</p> 
				</div>
				";
				unset($_SESSION['error']);
				unset($_SESSION['message']);
			}
			?>
	    <div class="container">

	      <!-- Main content -->
	      <section class="content">
	        <div class="row">
			<div class="col-sm-1">
	        	</div>
	        	<div class="col-sm-10">
	        		<h1 class="page-header">YOUR CART</h1>
	        		<div class="box box-solid">
	        			<div class="box-body">
		        		<table class="table table-bordered">
		        			<thead>
		        				<th></th>
		        				<th>Photo</th>
		        				<th>Name</th>
		        				<th>Price</th>
		        				<th width="20%">Quantity</th>
		        				<th>Subtotal</th>
		        			</thead>
		        			<tbody id="tbody">
								<?php include "cart_table.php";?>
		        			</tbody>
		        		</table>
	        			</div>
	        		</div>
	        		<?php
	        			if(isset($_SESSION['user'])){
	        				echo "
							<div class='box-header with-border'>
              					<a href='sales.php' data-toggle='modal' class='btn btn-primary btn-sm btn-flat'>PAY</a>
            				</div>
	        				";
	        			}
	        			else{
	        				echo "
	        					<h4>You need to <a href='login.php'>Login</a> to checkout.</h4>
	        				";
	        			}
	        		?>
	        	</div>
	        	<div class="col-sm-1">
	        	</div>
	        </div>
	      </section>
	     
	    </div>
	  </div>
  	<?php $pdo->close(); ?>
  	<?php 
		include 'includes/footer.php'; 
		include 'cart_total.php';
	?>
</div>

<?php include 'includes/scripts.php'; ?>
</body>
</html>