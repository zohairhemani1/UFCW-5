<?php
	
	include 'headers/connect_to_mysql.php';
	$app_id = $_POST['parameterOne'];
	$query = "select * from stayConected WHERE app_id = '$app_id'";
	$result = mysqli_query($con,$query);
	$returnArray = array();
	
	while($row = mysqli_fetch_assoc($result))
	{
		$returnArray[] = $row;
	}
	echo json_encode($returnArray);
	
?>