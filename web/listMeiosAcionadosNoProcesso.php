<html>
<body>
    <?php
        include("config.php");

        echo("<form action=\"index.php\"><input type=\"submit\" value=\"Voltar\"></form>");
        
        $sql = "SELECT nummeio, nomemeio, nomeentidade FROM meio NATURAL JOIN aciona WHERE numprocessosocorro=:numprocessosocorro";

        $result = $db->prepare($sql);
        $result->execute([':numprocessosocorro' => $_REQUEST['numprocessosocorro']]);

        echo("<table border=\"1\">");
        foreach($result as $row) {
            echo("<tr>");
            echo("<td>" . $row[0] . "</td>");
            echo("<td>" . $row[1] . "</td>");
            echo("<td>" . $row[2] . "</td>");
            echo("</tr>");
        }
        echo("</table>");

    ?>
</body>
</html>