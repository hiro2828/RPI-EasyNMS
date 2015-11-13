<html>
<head><title>Get Version</title></head>
<body>


<?php

$hostid = "http://192.168.1.100/"; // This is default address for MV5000 FE

$input_data = $_GET['text1'];
# print('returned value:'.$input_data.'<br>');
# print('returned type:'.gettype($input_data).'<br>');

switch($input_data) {
	case '2':
		$cgireq = "cgi_command_exec.cgi?{%22GetStatus%22:{%22user%22:%22admin%22,%22passwd%22:%22%22}}";
		break;
	case '3':
		$cgireq = "cgi_command_exec.cgi?{%22GetOutputParam%22:{%22user%22:%22admin%22,%22passwd%22:%22%22}}";
		break;
	case '4':
		$cgireq = "cgi_command_exec.cgi?{%22GetPresetNo%22:{%22user%22:%22admin%22,%22passwd%22:%22%22}}";
		break;
	case '1':
	default:
		$cgireq = "cgi_command_exec.cgi?{%22GetVersion%22:{%22user%22:%22admin%22,%22passwd%22:%22%22}}";
		break;
}

# print('return:'.$cgireq.'<br>');

require './jsonformat.php';

$getversion = new getVersion();
$httpreq = $hostid . $cgireq;
# print('httpreq:'.$httpreq . '<br>');
$getversion->setJson($httpreq);

?>


</body>
</html>

