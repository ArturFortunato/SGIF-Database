<html>
<body>
<?php  

    include("config.php");
    
    $sql = "INSERT INTO eventoemergencia VALUES (:numtelefone, :instantechamada, :nomepessoa, :moradalocal, :numprocessossocorro);";

    $result = $db->prepare($sql);
    $result->execute([':numtelefone' => $_REQUEST['numtelefone'], ':instantechamada' => $_REQUEST['instantechamada'], ':nomepessoa' => $_REQUEST['nomepessoa'], ':moradalocal' => $_REQUEST['moradalocal'], ':numprocessossocorro' => $_REQUEST['numprocessosocorro']]);

    $db = null;

    header('Location: index.php');
    die();
?>
</body>
</html>