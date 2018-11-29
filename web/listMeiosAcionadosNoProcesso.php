<html>
<body>
    <?php
        include("config.php");

        $sql = "SELECT nummeio, nomemeio, nomeentidade FROM meio NATURAL JOIN aciona WHERE numprocessosocorro=:numprocessosocorro";

        $result = $db->prepare($sql);
        $result->execute([':numprocessosocorro' => $_REQUEST['numprocessosocorro']]);


        echo("Funcionara quando o outro funcione");
    ?>
</body>
</html>