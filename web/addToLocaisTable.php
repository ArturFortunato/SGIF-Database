<html>
<body>
<?php  

    include("config.php");
    
    $sql = "INSERT INTO locais VALUES (:moradalocal);";

    $result = $db->prepare($sql);
    $result->execute([':moradalocal' => $_REQUEST['nome']]);

    $db = null;

    header('Location: index.php');
    die();
?>
</body>
</html>