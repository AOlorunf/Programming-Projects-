<?php
  // Connect to database //
  $dbServername = "localhost";
  $dbUsername = "root";
  $dbPassword = "";
  $dbName = "Todolist";

  $connect2db= mysqli_connect($dbServername, $dbUsername, $dbPassword, $dbName);


  mysql_select_db($dbName);

  // Insert Task list Data to Database //
  $query = "SELECT * FROM Tasks";
  $taskresult = mysqli_query($connect2db, $query);

  $rows=$taskresult -> num_rows;
  for ($j =0; $j < $rows ; ++$j)
  {
    $row =$taskresult->fetch_array(MYSQLI_ASSOC);
    echo 'Task ID: ' .htmlspecialchars($row['id']) .'<br>';
    echo 'Task Names: ' .htmlspecialchars($row['taskname']) . '<br>';
  }


  //var_dump($_POST);

?>
