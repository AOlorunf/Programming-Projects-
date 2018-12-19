<?php
  // Connect to database //
  $dbServername = "localhost";
  $dbUsername = "root";
  $dbPassword = "";
  $dbName = "Todolist";

  $connect2db= mysqli_connect($dbServername, $dbUsername, $dbPassword, $dbName);


  mysql_select_db($dbName);

  // Insert Task list Data to Database //
  $groupname = $_POST['groupname'];
  $groupdescription = $_POST['groupdescription'];

  $query = "INSERT INTO Groups (Groupname, `Desc`)
    VALUES ('$groupname', '$groupdescription')
    ";
  $taskresult = mysqli_query($connect2db, $query);
  $groupid = mysqli_insert_id($connect2db);

  echo $groupid;
  //var_dump($_POST);

?>
