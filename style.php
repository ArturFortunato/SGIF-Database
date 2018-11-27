<!--<link href="style.php">			no ficheiro principal(head) -->

<?php
header("Content-type: text/css");

$font_family = 'Arial, Helvetica, sans-serif';
$font_size = '1.2em';
$border = '1px solid black';
$padding = '10px';
$text_align = 'left';

?>

table{
	border: <?=border?>;
	opacity: 0.8;
	font-size: <?=font_size?>;
	font-family: <?=font_family?>;
}

th, td{
	padding: <?=padding?>;
	text-align: <?=text_align?>;
}
