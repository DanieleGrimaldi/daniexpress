<?php include 'includes/session.php'; ?>
<?php
	$conn = $pdo->open();

	$slug = $_GET['product'];

	try{
		 		
	    $stmt = $conn->prepare("SELECT *, products.name AS prodname, category.id as catid, category.name AS catname, products.id AS prodid FROM products LEFT JOIN category ON category.id=products.category_id WHERE slug = :slug and products.available = True ");
	    $stmt->execute(['slug' => $slug]);
	    $myproduct = $stmt->fetch();
	}
	catch(PDOException $e){
		echo "There is some problem in connection: " . $e->getMessage();
	}
?>
<?php include 'includes/header.php'; ?>
<body class="hold-transition skin-blue layout-top-nav">
<div class="wrapper">

	<?php include 'includes/navbar.php';?>

	  <div class="content-wrapper">
	    <div class="container">

	      <!-- Main content -->
			<?php 
			if(isset($_SESSION['message'])){
				echo "
				<div class='callout callout-"; echo ($_SESSION['error']) ? 'danger' : 'success'; echo" success danger text-center'>
					<p>".$_SESSION['message']."</p> 
				</div>
				";
				unset($_SESSION['error']);
				unset($_SESSION['message']);
			}
			?>
	      <section class="content">
	        <div class="row">
				<div class="col-sm-1">
	        	</div>
	        	<div class="col-sm-10">
	        		<div class="callout" id="callout" style="display:none">
	        			<button type="button" class="close"><span aria-hidden="true">&times;</span></button>
	        			<span class="message"></span>
	        		</div>
		            <div class="row">
		            	<div class="col-sm-6">
		            		<img src="<?php echo (!empty($myproduct['photo'])) ? 'images/'.$myproduct['photo'] : 'images/noimage.jpg'; ?>" width="100%" class="zoom" data-magnify-src="images/large-<?php echo $myproduct['photo']; ?>">
		            		<br><br>
		            		<form class="form-inline" id="" method='get' action='cart_add.php'>
		            			<div class="form-group">
			            			<div class="input-group col-sm-5">
			            				
			            				<span class="input-group-btn">
			            					<button type="button" id="minus" class="btn btn-default btn-flat btn-lg"><i class="fa fa-minus"></i></button>
			            				</span>
							          	<input type="text" name="quantity" id="quantity" class="form-control input-lg" value="1">
							            <span class="input-group-btn">
							                <button type="button" id="add" class="btn btn-default btn-flat btn-lg"><i class="fa fa-plus"></i>
							                </button>
							            </span>
							            <input type="hidden" value="<?php echo $myproduct['prodid']; ?>" name="id">
										<input type="hidden" value="<?php echo $myproduct['slug']; ?>" name="prodname">
							        </div>
			            			<button type="submit" class="btn btn-primary btn-lg btn-flat"><i class="fa fa-shopping-cart"></i> Add to Cart</button>
			            		</div>
		            		</form>
		            	</div>
		            	<div class="col-sm-6">
		            		<h1 class="page-header"><?php echo $myproduct['prodname']; ?></h1>
		            		<h3><b>&#36; <?php echo number_format($myproduct['price'], 2); ?></b></h3>
		            		<p><b>Category:</b> <a href="category.php?catid=<?php echo $myproduct['catid']; ?>&catname=<?php echo $myproduct['catname']; ?>"><?php echo $myproduct['catname']; ?></a></p>
		            		<p><b>Description:</b></p>
		            		<p><?php echo $myproduct['description']; ?></p>
		            	</div>
		            </div>
		            <br>
				    <div class="fb-comments" data-href="http://localhost/ecommerce/product.php?product=<?php echo $slug; ?>" data-numposts="10" width="100%"></div> 
	        	</div>
	        	<div class="col-sm-1">
	        	</div>
	        </div>
	      </section>
		<section class="content">
	        <div class="row">
				<div class="col-sm-1">
	        </div>
	        <div class="col-sm-10">
				<?php include 'reviews.php'; ?>
			</div>
			<div class="row">
				<div class="col-sm-1">
	        </div>
		</section>
	    </div>
	  </div>
  	<?php $pdo->close(); ?>
  	<?php include 'includes/footer.php'; ?>
</div>

<?php include 'includes/scripts.php'; ?>
<script>
$(function(){
	$('#add').click(function(e){
		e.preventDefault();
		var quantity = $('#quantity').val();
		quantity++;
		$('#quantity').val(quantity);
	});
	$('#minus').click(function(e){
		e.preventDefault();
		var quantity = $('#quantity').val();
		if(quantity > 1){
			quantity--;
		}
		$('#quantity').val(quantity);
	});

});
</script>
</body>
</html>