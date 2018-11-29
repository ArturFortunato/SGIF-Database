<html>
<body>
<?php  

    include("config.php");
    
    $sql = "INSERT INTO meio VALUES (:nummeio, :nomemeio, :nomeentidade);";

    $result = $db->prepare($sql);
    $result->execute([':nummeio' => $_REQUEST['nummeio'], ':nomemeio' => $_REQUEST['nomemeio'], ':nomeentidade' => $_REQUEST['nomeentidade']]);

    $db = null;

    header('Location: index.php');
    die();
?>
</body>
</html>