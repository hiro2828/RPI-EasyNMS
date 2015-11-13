<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Show MDI Graph </title>
</head>
<body>

<?php
	exec("gnuplot plotmdi-ml.p");
	ob_clean(); // need to clean the buffer to output image.
	$img2 = file_get_contents("./plotmdi-ml.png");
	header ('Content-type: image/png');
        echo $img2;
?>

</body>
</html>
