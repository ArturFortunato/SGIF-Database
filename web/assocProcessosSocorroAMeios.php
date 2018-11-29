<html>
    <body>
        <?php
            include("config.php");
            echo("<form action=\"index.php\"><input type=\"submit\" value=\"Voltar\"></form>");

            echo("Vou associar o processo " . $_REQUEST['numprocessosocorro'] . " ao meio: nummeio->" . $_REQUEST['nummeio'] . "\tnomeentidade->" . $_REQUEST['nomeentidade']);

            try {
                $sql = "INSERT INTO aciona VALUES (" . $_REQUEST['nummeio'] . ", '" . $_REQUEST['nomeentidade'] . "', "  . $_REQUEST['numprocessosocorro'] . ");";
                echo($sql);
                $result = $db->prepare($sql);
                $result->execute();
                echo("<h1>Complete!!</h1>");
            }
            catch (Exception $e) {
                echo("<h1>Something went wrong!!</h1>");
            }
            echo("<p>asdasdasd</p>");
        ?>
    </body>
</html>