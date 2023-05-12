<?php 
    include 'includes/session.php';

    if(isset($_GET["id"]) and isset($_GET["status"])){
        $id=$_GET["id"];
        $status=$_GET["status"];
        $conn = $pdo->open();
        try{
			$stmt = $conn->prepare("UPDATE users SET active=:active WHERE id=:id");
			$stmt->execute(['active'=>$status, 'id'=>$id]);

			$_SESSION['success'] = 'successfully';
		}
		catch(PDOException $e){
			$_SESSION['error'] = $e->getMessage();;
		}
    }
    header("location:users.php");
?>