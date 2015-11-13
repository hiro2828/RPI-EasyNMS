<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Collecting MDI Stats </title>
</head>
<body>

<?php
	print "Starting...";
	echo exec("sudo ./sta_collection.sh ./data/output.csv > /dev/null &");
?>

</body>
</html>
