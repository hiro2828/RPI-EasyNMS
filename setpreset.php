<html>
<head><title>Set Preset</title></head>
<body>


<?php

$hostid = "http://192.168.1.100/"; // This is default address for MV5000 FE

$input_data = $_GET['text1'];
# print('returned value:'.$input_data.'<br>');
# print('returned type:'.gettype($input_data).'<br>');

switch($input_data) {
	case 'S':
		$cgireq = "cgi_command_exec.cgi?{%22SetPresetNo%22:{%22user%22:%22admin%22,%22passwd%22:%22%22,%22PresetNo%22:%22Sys1%22}}";
		break;
	case '1':
	case '2':
	case '3':
	case '4':
	case '5':
	case '6':
	case '7':
	case '8':
		$cgireq = "cgi_command_exec.cgi?{%22SetPresetNo%22:{%22user%22:%22admin%22,%22passwd%22:%22%22,%22PresetNo%22:%22Usr" . $input_data . "%22}}";
		break;
	default:
		print('invalid request:'.$input_data . '<br>');
		return;
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

