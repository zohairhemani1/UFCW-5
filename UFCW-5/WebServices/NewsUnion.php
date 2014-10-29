<?php
	
	include 'headers/connect_to_mysql.php';
	include 'headers/jsonPretty.php';
	$returnArray = array();
	
	$query = "SELECT * from news";
	$result = mysqli_query($con,$query);
	while($row = mysqli_fetch_assoc($result))
	{
		$row = clean($row);
		$returnArray[] = $row;
	}
	
	echo json_encode($returnArray);
	
function clean($string) {
   $string = preg_replace('/[^A-Za-z0-9."\'\-]<>/', ' ', $string); // Removes special chars.
   return preg_replace('/-+/', '-', $string); // Replaces multiple hyphens with single one.
}
	
?>