<html>
<body>
<?php  

    include("config.php");

    echo("<form action=\"index.php\"><input type=\"submit\" value=\"Voltar\"></form>");
    
    $sql = "INSERT INTO eventoemergencia VALUES (:numtelefone, :instantechamada, :nomepessoa, :moradalocal, :numprocessossocorro);";

    try{
    	$result = $db->prepare($sql);
    	$result->execute([':numtelefone' => $_REQUEST['numtelefone'], ':instantechamada' => $_REQUEST['instantechamada'], ':nomepessoa' => $_REQUEST['nomepessoa'], ':moradalocal' => $_REQUEST['moradalocal'], ':numprocessossocorro' => $_REQUEST['numprocessosocorro']]);
        echo("<h1>Adicionado!!</h1>");
    }
    catch(Exception $e){
    	echo("<h1>Something went wrong!!</h1>");
    }
    $db = null;
?>
</body>
</html>