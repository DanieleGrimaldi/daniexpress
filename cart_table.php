<?php
	$conn = $pdo->open();

	$output = '';

	if(isset($_SESSION['user'])){
		try{
			$total = 0;
			$stmt = $conn->prepare("SELECT *, products.id as prodid, cart.id AS cartid FROM cart LEFT JOIN products ON products.id=cart.product_id WHERE user_id=:user");
			$stmt->execute(['user'=>$user['id']]);
			foreach($stmt as $row){
				$image = (!empty($row['photo'])) ? 'images/'.$row['photo'] : 'images/noimage.jpg';
				$subtotal = $row['price']*$row['quantity'];
				$total += $subtotal;
				$output .= "
					<tr>
						<td><a href='cart_delete.php?cartid=".$row['cartid']."' ><button type='button' class='btn btn-danger btn-flat'><i class='fa fa-remove'></i></button></a></td>
						<td><img src='".$image."' width='30px' height='30px'></td>
						<td><a href='product.php?product=".$row['slug']."'>".$row['name']."</a></td>
						<td>&#36; ".number_format($row['price'], 2)."</td>
						<td class='input-group'>
							<span class='input-group-btn'>
								<a href='cart_update.php?id=".$row['cartid']."&qty=".($row['quantity']-1)."'><button type='button' id='minus' class='btn btn-default btn-flat'><i class='fa fa-minus'></i></button></a>
            				</span>
            				<input type='text' class='form-control' value='".$row['quantity']."' id='qty_".$row['cartid']."'>
				            <span class='input-group-btn'>
								<a href='cart_update.php?id=".$row['cartid']."&qty=".($row['quantity']+1)."'><button type='button' id='add' class='btn btn-default btn-flat add' data-id='".$row['cartid']."'><i class='fa fa-plus'></i>
				                </button></a>
				            </span>
						</td>
						<td>&#36; ".number_format($subtotal, 2)."</td>
					</tr>
				";
			}
			$output .= "
				<tr>
					<td colspan='5' align='right'><b>Total</b></td>
					<td><b>&#36; ".number_format($total, 2)."</b></td>
				<tr>
			";

		}
		catch(PDOException $e){
			$output .= $e->getMessage();
		}

	}
	else{
		if(count($_SESSION['cart']) != 0){
			$total = 0;
			foreach($_SESSION['cart'] as $row){
				$stmt = $conn->prepare("SELECT *, products.name AS prodname, category.name AS catname FROM products LEFT JOIN category ON category.id=products.category_id WHERE products.id=:id");
				$stmt->execute(['id'=>$row['productid']]);
				$product = $stmt->fetch();
				$image = (!empty($product['photo'])) ? 'images/'.$product['photo'] : 'images/noimage.jpg';
				$subtotal = $product['price']*$row['quantity'];
				$total += $subtotal;
				$output .= "
					<tr>
                    <td><a href='cart_delete.php?cartid=".$row['productid']."' ><button type='button' class='btn btn-danger btn-flat'><i class='fa fa-remove'></i></button></a></td>
						<td><img src='".$image."' width='30px' height='30px'></td>
						<td><a href='product.php?product=".$product['slug']."'>".$product['name']."</a></td>
						<td>&#36; ".number_format($product['price'], 2)."</td>
						<td class='input-group'>
							<span class='input-group-btn'>
								<a href='cart_update.php?id=".$row['productid']."&qty=".($row['quantity']-1)."'><button type='button' id='minus' class='btn btn-default btn-flat minus' data-id='".$row['productid']."'><i class='fa fa-minus'></i></button>
            				</a></span>
            				<input type='text' class='form-control' value='".$row['quantity']."' id='qty_".$row['productid']."'>
				            <span class='input-group-btn'>
							<a href='cart_update.php?id=".$row['productid']."&qty=".($row['quantity']+1)."'><button type='button' id='add' class='btn btn-default btn-flat add' data-id='".$row['productid']."'><i class='fa fa-plus'></i>
				                </button></a>
				            </span>
						</td>
						<td>&#36; ".number_format($subtotal, 2)."</td>
					</tr>
				";
				
			}

			$output .= "
				<tr>
					<td colspan='5' align='right'><b>Total</b></td>
					<td><b>&#36; ".number_format($total, 2)."</b></td>
				<tr>
			";
		}

		else{
			$output .= "
				<tr>
					<td colspan='6' align='center'>Shopping cart empty</td>
				<tr>
			";
		}
		
	}

	$pdo->close();
	echo $output;

?>

