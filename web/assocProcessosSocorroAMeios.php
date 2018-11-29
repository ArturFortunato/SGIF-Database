<html>
    <body>
        <?php
            include("config.php");
            echo("<form action=\"index.php\"><input type=\"submit\" value=\"Voltar\"></form>");

            try {
                $sql = "INSERT INTO aciona VALUES (" . $_REQUEST['nummeio'] . ", '" . $_REQUEST['nomeentidade'] . "', "  . $_REQUEST['numprocessosocorro'] . ");";
                $result = $db->prepare($sql);
                $result->execute();
                echo("<h1>Adicionado!!</h1>");
            }
            catch (Exception $e) {
                echo("<h1>Something went wrong!!</h1>");
            }
        ?>
    </body>
</html>