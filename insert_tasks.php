<?php
  // Connect to database //
  $dbServername = "localhost";
  $dbUsername = "root";
  $dbPassword = "";
  $dbName = "Todolist";

  $connect2db= mysqli_connect($dbServername, $dbUsername, $dbPassword, $dbName);


  mysql_select_db($dbName);

  // Insert Task list Data to Database //
  $taskname= $_POST['taskname'];
  $group_id= $_POST['groupid'];
  $query = "INSERT INTO Tasks (taskname, Group_id)
    VALUES ('$taskname','$group_id')
    ";
  $taskresult = mysqli_query($connect2db, $query);
  $taskid = mysqli_insert_id($connect2db);
  echo $taskid;

?>
