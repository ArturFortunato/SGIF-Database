<html>
    <body>
        <?php
            include("config.php");

            echo("<form action=\"index.php\"><input type=\"submit\" value=\"Voltar\"></form>");
            
            try{
                $sql = "INSERT INTO eventoemergencia VALUES ('" . $_REQUEST['telefone'] . "', '" . $_REQUEST['instantechamada'] . "', '" . $_REQUEST['pessoa'] . "', '". $_REQUEST['morada'] . "', "  . $_REQUEST['numprocessosocorro'] . ");";
                $result = $db->prepare($sql);
                $result -> execute();
                echo("<h1>Complete!!</h1>");
            }
            catch(Exception $e){
                echo("<h1>Something went wrong!!</h1>");
            }
            $db = null;
        ?>
    </body>
</html>