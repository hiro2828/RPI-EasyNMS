<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Show Thumbnail Image </title>
</head>
<body>

<?php
	exec("rm -f ./test/*.jpg");
	exec("sudo ./test/ffthumb.sh");
	ob_clean(); // need to clean the buffer to output image.
	$img = file_get_contents("http://192.168.1.200/test/Iout05.jpg");
	header ('Content-type: image/jpg');
	echo $img;
?>

</body>
</html>
