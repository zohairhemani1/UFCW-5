<?php
$ifExist = false;
$allowedExts = array("gif", "jpeg", "jpg", "png");
$temp = explode(".", $_FILES["file"]["name"]);
$extension = end($temp);

	$rand  = (rand(10,100));
	$md5Number = md5($rand) . '.png';
	move_uploaded_file($_FILES["file"]["tmp_name"],
	"upload/" . $md5Number);
    $file  = $md5Number ;
 


?>
