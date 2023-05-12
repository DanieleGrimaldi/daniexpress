<?php include 'includes/session.php'; ?>
<?php include 'includes/header.php'; ?>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <?php include 'includes/menubar.php'; ?>

  <!-- Content Wrapper. Contains page content -->

  <div class="content-wrapper">
    <section class="content-header">
      <h1>
        Users
      </h1>
    </section>
    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-body">
              <table id="example1" class="table table-bordered">
                <thead>
                  <th>Photo</th>
                  <th>Email</th>
                  <th>Name</th>
                  <th>Date Added</th>
                  <th>Status</th>
                </thead>
                <tbody>
                  <?php
                    $conn = $pdo->open();

                    try{
                      $stmt = $conn->prepare("SELECT * FROM users WHERE type=:type");
                      $stmt->execute(['type'=>0]);
                      foreach($stmt as $row){
                        $image = (!empty($row['photo'])) ? '../images/'.$row['photo'] : '../images/profile.jpg';
                        $status = ($row['active']) ? '<span class="label label-success">active</span>' : '<span class="label label-danger">not active</span>';
                        echo "
                          <tr>
                            <td>
                              <img src='".$image."' height='30px' width='30px'>
                            </td>
                            <td>".$row['email']."</td>
                            <td>".$row['firstname'].' '.$row['lastname']."</td>
                            
                            <td>".date('M d, Y', strtotime($row['created_on']))."</td>
                            <td>
                              <a href='user_active.php?id=".$row['id']."&status=".(bool)!$row['active']."'>
                                ".$status."
                              </a>
                            </td>
                          </tr>
                        ";
                      }
                    }
                    catch(PDOException $e){
                      echo $e->getMessage();
                    }

                    $pdo->close();
                  ?>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </section>
     
  </div>


</div>
<!-- ./wrapper -->

</body>
</html>
