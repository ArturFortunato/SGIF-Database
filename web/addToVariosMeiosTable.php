<html>
<body>
<?php  

    include("config.php");
    
    $sql = "INSERT INTO " . $_REQUEST['table'] . " VALUES (:nummeio, :nomeentidade);";

    $result = $db->prepare($sql);
    $result->execute([':nummeio' => $_REQUEST['nummeio'], ':nomeentidade' => $_REQUEST['nomeentidade']]);

    $db = null;

    header('Location: index.php');
    die();
?>
</body>
</html>