<?php
	include 'includes/session.php';
	if(isset($_POST['rating']) and isset($_GET["proid"]) and isset($_POST['text'])){

		$conn = $pdo->open();

		try{
			$stmt = $conn->prepare("INSERT INTO reviews (star,product_id,text,user_id) VALUES (:star,:product_id,:text,:user_id)");
			$stmt->execute(['star'=>$_POST['rating'],'product_id'=>$_GET["proid"],'text'=>$_POST['text'],'user_id'=>$_SESSION['user']]);
			$_SESSION['success'] = 'review added successfully';
		}
		catch(PDOException $e){
				$_SESSION['error'] = $e->getMessage();
		}

		$pdo->close();
	}
	else{
		$_SESSION['error'] = 'Fill up review form first';
	}

	header('location: product.php?product='.$_GET["product"]);

?>