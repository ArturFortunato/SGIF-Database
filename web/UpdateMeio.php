<html>
    <body>
        <?php

        include("config.php");

        echo("<form action=\"index.php\"><input type=\"submit\" value=\"Voltar\"></form>");
        
        $sql = "UPDATE " . $_REQUEST['table'] . " SET nummeio=" . $_REQUEST['novonummeio'] . ", nomeentidade='" . $_REQUEST['novonomeentidade'] . "' WHERE nummeio =" . $_REQUEST['nummeio'] . " AND nomeentidade='" . $_REQUEST['nomeentidade'] . "';";
        echo($sql);
        try {
            $result = $db->prepare($sql);
            $result->execute();
            echo("<h1>Alteracao efetuada!</h1>");
        }
        catch (Exception $e) {
            echo("<h1>Conflitos com outras entradas na tabela!</h1>");
        }
        $db = null;
        ?>
    </body> 
</html>