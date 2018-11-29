<html>
<body>
<?php  

    include("config.php");
    
    $sql = "INSERT INTO processosocorro VALUES (:numprocessosocorro);";

    $result = $db->prepare($sql);
    $result->execute([':numprocessosocorro' => $_REQUEST['numprocessosocorro']]);

    $db = null;

    header('Location: index.php');
    die();
?>
</body>
</html>