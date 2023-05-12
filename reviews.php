<?php

    $output = '';
	    
    if(isset($myproduct)){
        $output.="<div class='text'>";
        $stmt = $conn->prepare("SELECT * FROM reviews join users on users.id = reviews.user_id WHERE reviews.product_id = :id");
	    $stmt->execute(['id' => $myproduct["prodid"]]);
        foreach ($stmt as $row) {
            $output.="<div id='review'>".$row["firstname"]." ".$row["lastname"]." ";
            for ($i=0; $i < $row["star"]; $i++) { 
                $output.="&#11088";
            }
            $output.="<br>".$row["text"]."</div><br>";        
        }
        $output.="</div>";
        if(isset($_SESSION["user"])){
            $output.="
            <div class='box-header with-border'>
              <a href='#addnew' data-toggle='modal' class='btn btn-primary btn-sm btn-flat'>Write a Review</a>
            </div>

                <script>
                    $(function(){
                    $(document).on('click', '.edit', function(e){
                        e.preventDefault();
                        $('#edit').modal('show');
                        var id = $(this).data('id');
                    });
                    });
            </script>";
        }
    } 
    echo $output;
    include 'review_modal.php';
?>