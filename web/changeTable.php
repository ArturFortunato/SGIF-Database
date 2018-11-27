<html>
<body>
<?php
    $user="ist186388";
	$host="db.ist.utl.pt";
	$port=5432;
	$password="12345678";
    $dbname = $user;

    $connection = pg_connect("host=$host port=$port user=$user password=$password dbname=$bdname") or die(pg_last_error());

    //if($REQUEST['add'])
    echo("<p>Caralho!</p>");

    $pg_close($connection);
?>
</body>
</html>