<!doctype html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap CSS -->
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" rel="stylesheet">
  <link href="css/custom.css" rel="stylesheet">
  <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" rel="stylesheet">
  <title>To-Do App</title>

  <!--Google Font -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700" rel="stylesheet">

</head>



<body>
  <!-- Header -->
  <header>
    <div class="container">
      <div class="row">
        <div class="col-md-8">
          <div class="pull-left"></div>
          <h1 class="header-title">To-Do App</h1>
          <div class="pull-right"></div>
          <a href="#" class="btn btn-success show-newgroup-modal">Create New Group</a>
        </div>
      </div>
    </div>
  </header>

  <!-- Main Container -->
  <div class="container">
    <div class="row">
      <div class="col-md-8 col-md-offset-2">
        <div class="panel panel-default">
          <ul class="list-group">
            <li class="list-group-item" style=display:none; id="template">
              <h4 class="list-group-item-heading"><span class="badge"></span></h4>
              <p class="list-group-item-text"></p>
              <input type="hidden" name='groupvalue' class='group-hidden' value='-1'>
              <div class="buttons">
                <a href="#" class="btn btn-info show-task-modal bin-xs" title="Manage Tasks">
                  <i class="glyphicon glyphicon-ok"></i>
                </a>
                <a href="#" class="btn btn-danger bin-xs delete-tasks" id="xbutton" title="Delete Group">
                  <i class="glyphicon glyphicon-remove"></i>
                </a>
              </div>
            </li>
            <?php
            $dbServername = "localhost";
            $dbUsername = "root";
            $dbPassword = "";
            $dbName = "Todolist";

            $connect2db= mysqli_connect($dbServername, $dbUsername, $dbPassword, $dbName);


            mysql_select_db($dbName);
            $query = "SELECT * FROM Groups";
            $groupresult = mysqli_query($connect2db, $query);
            $numrows = mysqli_num_rows($groupresult);
            for ($i = 0; $i < $numrows; $i++) {
              $row =$groupresult->fetch_array(MYSQLI_ASSOC);

              ?>
              <li class="list-group-item" id="<?php echo "group_".htmlspecialchars($row["id"]) ?>">
                <h4 class="list-group-item-heading"><?php echo htmlspecialchars($row["Groupname"]) ?></h4>
                <p class="list-group-item-text"><?php echo htmlspecialchars($row["Desc"]) ?></p>
                <input type="hidden" name='groupvalue' class='group-hidden' value='<?php echo $row["id"] ?>'>
                <div class="buttons">
                  <a href="#" class="btn btn-info show-task-modal bin-xs" title="Manage Tasks">
                    <i class="glyphicon glyphicon-ok"></i>
                  </a>
                  <a href="#" class="btn btn-danger bin-xs delete-tasks xbutton" title="Delete Group">
                    <i class="glyphicon glyphicon-remove"></i>
                  </a>
                </div>
              </li>
              <?php
            }
             ?>
          </ul>
        </div>
      </div>
    </div>
  </div>


      <!--Modal for Groups-->
      <div class="modal" id="newgroup-modal" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-lg" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
              <h5 class="modal-title">Please add a Group</h5>
            </div>
            <div class="modal-body">
              <form action="index.php" method="post">
                <div class="form-group">
                  <label for="" class="control-label">Group Name</label>
                  <input type="text" class="form-control-input-lg" name="group">
                </div>
                <div class="form-group">
                  <label for="" class="control-label">Details</label>
                  <textarea rows="2" class="form-control"></textarea>
                </div>
              </form>
              <div class="modal-footer">
                <button type="button" id="modal-save" class="btn btn-primary">Create!</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Modal for Tasks-->
      <div class="modal" id="task-modal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
              <h5 class="modal-title">Please add a Task for <strong>#Group Name</strong></h5>
            </div>
            <form action="insert_tasks.php" method="post">
              <input type="hidden" name="groupid" class="group_id" value="-1">
            <div class="modal-body">
                <input type="text" id="addtolist" placeholder="Enter a task." name= "task"/>
                <button id="add" class='btn btn-success'> Add </button>
              </div>
            </form>
              <div class="modal-footer">

              </div>
            </div>
          </div>
        </div>

  <!-- Optional JavaScript -->

  <!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
  <script src="js/app.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

</body>

</html>
