<html>
<body>
<?php  

    include("config.php");

    echo("<form action=\"index.php\"><input type=\"submit\" value=\"Voltar\"></form>");
    
    $sql = "INSERT INTO meio VALUES (:nummeio, :nomemeio, :nomeentidade);";

    try{
    	$result = $db->prepare($sql);
    	$result->execute([':nummeio' => $_REQUEST['nummeio'], ':nomemeio' => $_REQUEST['nomemeio'], ':nomeentidade' => $_REQUEST['nomeentidade']]);
    }
    catch(Exception $e){
    	echo("<h1>Something went wrong!!</h1>");
    }

    $db = null;
?>
</body>
</html>