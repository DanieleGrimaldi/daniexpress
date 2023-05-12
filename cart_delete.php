<?php
	include 'includes/session.php';

	$conn = $pdo->open();

	$output = array('error'=>false);
	$id = $_GET['cartid'];

	if(isset($_SESSION['user'])){
		try{
			$stmt = $conn->prepare("DELETE FROM cart WHERE id=:id");
			$stmt->execute(['id'=>$id]);
			$output['message'] = 'Deleted';
			
		}
		catch(PDOException $e){
			$output['message'] = $e->getMessage();
			$output['error'] = true;
		}
	}
	else{
		foreach($_SESSION['cart'] as $key => $row){
			if($row['productid'] == $id){
				unset($_SESSION['cart'][$key]);
				$output['message'] = 'Deleted';
			}
		}
	}

	$pdo->close();
	$_SESSION["message"]=$output['message'];
	$_SESSION["error"]=$output['error'];
	header("location: cart_view.php");


?>