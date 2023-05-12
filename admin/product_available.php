<?php 
    include 'includes/session.php';

    if(isset($_GET["id"]) and isset($_GET["status"])){
        $id=$_GET["id"];
        $status=$_GET["status"];
        $conn = $pdo->open();
        try{
			$stmt = $conn->prepare("UPDATE products SET available=:available WHERE id=:id");
			$stmt->execute(['available'=>$status, 'id'=>$id]);

			$_SESSION['success'] = 'successfully';
		}
		catch(PDOException $e){
			$_SESSION['error'] = $e->getMessage();;
		}
    }
    header("location:products.php");
?>