<?php
	include 'includes/session.php';

	$conn = $pdo->open();

	

	
	$qty = $_GET['qty'];

	if($qty>=1){

		$id = $_GET['id'];	
		$output = array('error'=>false);
			if(isset($_SESSION['user'])){
				try{
					$stmt = $conn->prepare("UPDATE cart SET quantity=:quantity WHERE id=:id");
					$stmt->execute(['quantity'=>$qty, 'id'=>$id]);
					$output['message'] = 'Updated';
				}
				catch(PDOException $e){
					$output['message'] = $e->getMessage();
					$output['error']=true;
				}
			}
			else{
				foreach($_SESSION['cart'] as $key => $row){
					if($row['productid'] == $id){
						$_SESSION['cart'][$key]['quantity'] = $qty;
						$output['message'] = 'Updated';
					}
				}
			}
			$pdo->close();
			$_SESSION["message"]=$output['message'];
			$_SESSION["error"]=$output['error'];
			
	}
	header("location: cart_view.php");

	

?>