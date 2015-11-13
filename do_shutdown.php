<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Do Select Preset</title>
</head>
<body>

<h1>Do shutdown raspberrypi</h1>

<?php
	echo "going down...\n";
	echo exec("sudo /sbin/shutdown -h now");
?>

</body>
</html>
