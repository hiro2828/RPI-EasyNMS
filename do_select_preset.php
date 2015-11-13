<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Do Select Preset</title>
</head>
<body>

<h1>Do Select Preset</h1>

<?php
	$arg1 = $_GET['arg1'];
	$preset = "Usr".$arg1;
	$command = "http://192.168.1.100/cgi_command_exec.cgi?{\"SetPresetNo\":{\"user\":\"admin\",\"passwd\":\",%22PresetNo%22:%22".htmlentities($preset)."%22}}";
	echo $command;
	$body = file_get_contents($command);
	echo $body;
?>

</body>
</html>
