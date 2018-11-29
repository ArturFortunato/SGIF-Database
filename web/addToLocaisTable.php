<html>
<body>
<?php  

    include("config.php");

    echo("<form action=\"index.php\"><input type=\"submit\" value=\"Voltar\"></form>");
    
    $sql = "INSERT INTO locais VALUES (:moradalocal);";

    try{
    	$result = $db->prepare($sql);
        $result->execute([':moradalocal' => $_REQUEST['nome']]);
        echo("<h1>Adicionado!!</h1>");
    }
    catch(Exception $e){
		 echo("<h1>Something went wrong!!</h1>");
	}
    $db = null;
?>
</body>
</html>