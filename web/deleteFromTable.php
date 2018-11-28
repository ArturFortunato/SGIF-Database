<html>
    <body>
        <?php
            include("config.php");

            //echo("   ---   " . $_REQUEST['table']);
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
                //Tem dependentes, nao funciona, query certa
                $sql .= $arraySplited[0] . ";";
            }
            else if ($_REQUEST['table'] == 'meio') {
                //Tem dependentes, nao funciona, query certa
                $sql .= $arraySplited[0] . " AND ";
                $mini_array = split("=", $arraySplited[1]);
                $sql .= $mini_array[0] . "='" . $mini_array[1] . "' AND ";
                $mini_array = split("=", $arraySplited[2]);
                $sql .= $mini_array[0] . "='" . $mini_array[1] . "';";
            }
            else if ($_REQUEST['table'] == 'entidademeio') {
                //Tem dependentes, nao funciona, query certa
                $mini_array = split("=", $arraySplited[0]);
                $sql .= $mini_array[0] . "='" . $mini_array[1] . "';";
            }

            echo($sql);
            $result = $db->prepare($sql);
            $result->execute();

            $db = null;

            header('Location: index.php');
            die();
        ?>
    </body>
</html>