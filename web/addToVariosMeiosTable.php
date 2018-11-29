<html>
<body>
<?php  

    include("config.php");

    echo("<form action=\"index.php\"><input type=\"submit\" value=\"Voltar\"></form>");
    
    $sql = "INSERT INTO " . $_REQUEST['table'] . " VALUES (:nummeio, :nomeentidade);";
    try{
    	$result = $db->prepare($sql);
        $result->execute([':nummeio' => $_REQUEST['nummeio'], ':nomeentidade' => $_REQUEST['nomeentidade']]);
        echo("<h1>Adicionado!!</h1>");
    }
    catch(Exception $e){
    	echo("<h1>Something went wrong!!</h1>");
    }

    $db = null;

?>
</body>
</html>