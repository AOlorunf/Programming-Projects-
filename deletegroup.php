<?php
  // Connect to database //
  $dbServername = "localhost";
  $dbUsername = "root";
  $dbPassword = "";
  $dbName = "Todolist";

  $connect2db= mysqli_connect($dbServername, $dbUsername, $dbPassword, $dbName);


  mysql_select_db($dbName);

  // Insert Group Data to Database //
  $groupid = $_POST['groupid'];


  $query = "DELETE FROM Groups WHERE id = '$groupid'";
  $groupresult = mysqli_query($connect2db, $query);
  $numrows = mysqli_affected_rows($connect2db);
  //var_dump($_POST);

  echo 'deleted: ' . $numrows

?>
