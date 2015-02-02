<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Untitled Document</title>
</head>

<body>

<?php
	
	$news_id = $_GET['news_id'];
	$app_id = $_GET['app_id'];
	include 'headers/connect_to_mysql.php';
	$query = "select * from news WHERE news_id = '{$news_id}' and app_id = '$app_id'";
	$result = mysqli_query($con,$query);
	$row = mysqli_fetch_array($result);
	$description = $row['description'];
	
	echo $description;
	
	
?>

</body>
</html>