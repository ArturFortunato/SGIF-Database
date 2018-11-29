<html>
    <body>
        <?php
            include("config.php");

            echo("<form action=\"index.php\"><input type=\"submit\" value=\"Voltar\"></form>");

            $sql = "DELETE FROM " . $_REQUEST['table'] . " WHERE ";
            $arraySplited = split("::", $_REQUEST['row']);

            if ($_REQUEST['table'] == 'locais') {
                $mini_array = split("=", $arraySplited[0]);
                $sql .= $mini_array[0] . "='" . $mini_array[1] . "';";
            }

            else if ($_REQUEST['table'] == 'eventoemergencia') {
                for($i = 0; $i < 5; $i++) {
                    $mini_array = split("=", $arraySplited[$i]);
                    if ($i != 4) {
                        $sql .= $mini_array[0] . "='" . $mini_array[1] . "' AND ";
                    }
                    else {
                        $sql .= $arraySplited[$i];
                    }
                }
                $sql .=  ";";
            }
            else if ($_REQUEST['table'] == 'processosocorro') {
                $sql .= $arraySplited[0] . ";";
            }

            else if ($_REQUEST['table'] == 'meio') {
                $sql .= $arraySplited[0] . " AND ";
                $mini_array = split("=", $arraySplited[1]);
                $sql .= $mini_array[0] . "='" . $mini_array[1] . "' AND ";
                $mini_array = split("=", $arraySplited[2]);
                $sql .= $mini_array[0] . "='" . $mini_array[1] . "';";
            }

            else if ($_REQUEST['table'] == 'entidademeio') {
                $mini_array = split("=", $arraySplited[0]);
                $sql .= $mini_array[0] . "='" . $mini_array[1] . "';";
            }

            //echo($sql);

            try {
                $result = $db->prepare($sql);
                $result->execute();
                echo("<h1>Apagado!!</h1>");
            }
            catch(Exception $e) {
                echo("<h1>Existem dependencias, nao foi apagado!!</h1>");
            }
            $db = null;
        ?>
    </body>
</html>