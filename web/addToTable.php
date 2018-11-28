<html>
<body>
<?php
    $user="ist186388";
	$host="db.ist.utl.pt";
	$port=5432;
	$password="12345678";
    $dbname = $user;

    $connection = pg_connect("host=$host port=$port user=$user password=$password dbname=$bdname") or die(pg_last_error());

    echo($_REQUEST['nome']);
    //echo($_REQUEST['table']);
    echo("<p>Caralho!</p>");
    $pg_close($connection);

    //header('Location: index.php'); --> volta à pagina original
?>
</body>
</html>