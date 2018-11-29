<html>
<body>
<?php  

    include("config.php");

    echo("<form action=\"index.php\"><input type=\"submit\" value=\"Voltar\"></form>");
    
    $sql = "INSERT INTO processosocorro VALUES (:numprocessosocorro);";

    try{
    	$result = $db->prepare($sql);
    	$result->execute([':numprocessosocorro' => $_REQUEST['numprocessosocorro']]);
    }
    catch(Exception $e){
    	echo("<h1>Something went wrong!!</h1>");
    }

    $db = null;
?>
</body>
</html>