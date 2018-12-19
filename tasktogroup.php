<ul id="tasklist">
<?php
  $dbServername = "localhost";
  $dbUsername = "root";
  $dbPassword = "";
  $dbName = "Todolist";

  $connect2db= mysqli_connect($dbServername, $dbUsername, $dbPassword, $dbName);


  mysql_select_db($dbName);
  $groupid = $_POST['groupid'];
  $query = "SELECT * FROM Tasks WHERE group_id = $groupid";
  $taskresult = mysqli_query($connect2db, $query);

  $rows=$taskresult -> num_rows;
  for ($j =0; $j < $rows ; ++$j)
  {
    $row =$taskresult->fetch_array(MYSQLI_ASSOC);
?>

  <li>
    <input class = "itemdone" type="checkbox"><?php echo htmlspecialchars($row['taskname']); ?>
    <input type="hidden" class="task_id" value="<?php echo htmlspecialchars($row["id"]); ?>"/>
    <span class="glyphicon glyphicon-trash deleteItem"></span>
  </li>

<?php
}
?>
</ul>
