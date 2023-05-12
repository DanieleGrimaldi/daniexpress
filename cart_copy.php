<?php
include 'includes/session.php';

if(isset($_SESSION["cart"])){
    foreach($_SESSION['cart'] as $key => $row){
        $id=$row['productid'];
        $quantity=$row['quantity'];
        
        unset($_SESSION['cart'][$key]);
        header("location:cart_add.php?id=".$id."&quantity=".$quantity);
        
        die();
    }

}
header("location:index.php");

?>