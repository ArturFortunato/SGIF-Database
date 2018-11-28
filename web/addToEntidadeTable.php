<html>
<body>
<?php  

    include("config.php");
    
    $sql = "INSERT INTO entidademeio VALUES (:nomeentidade);";

    $result = $db->prepare($sql);
    $result->execute([':nomeentidade' => $_REQUEST['nomeentidade']]);

    $db = null;

    header('Location: index.php');
    die();
?>
</body>
</html>