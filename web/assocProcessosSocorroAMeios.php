<html>
    <body>
        <?php
            echo("<form action=\"index.php\"><input type=\"submit\" value=\"Voltar\"></form>");

            echo("Vou associar o processo " . $_REQUEST['numprocessosocorro'] . " ao meio: nummeio->" . $_REQUEST['nummeio'] . "\tnomeentidade->" . $_REQUEST['nomeentidade']);
        ?>
    </body>
</html>