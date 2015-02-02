<?php
	
	include 'headers/connect_to_mysql.php';

	$returnArray = array();
	
	$app_id = $_POST['parameterOne'];
	$query = "SELECT * from `contact` where app_id = '$app_id'";
	$result = mysqli_query($con,$query);
	while($row = mysqli_fetch_assoc($result))
	{
		$returnArray[] = $row;
	}
	
	echo json_encode($returnArray);
	
	
	

?>