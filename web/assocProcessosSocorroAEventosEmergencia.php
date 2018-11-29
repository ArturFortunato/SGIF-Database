<html>
    <body>
        <?php
            include("config.php");

            echo("<form action=\"index.php\"><input type=\"submit\" value=\"Voltar\"></form>");
            
           // echo("Vou associar o processo " . $_REQUEST['numprocessosocorro'] . "ao evento de emergencia" . $_REQUEST['telefone'] . $_REQUEST['instantechamada']);

            try{
                $sql = "INSERT INTO eventoemergencia VALUES ('" . $_REQUEST['telefone'] . "', '" . $_REQUEST['instantechamada'] . "', '" . $_REQUEST['pessoa'] . "', '". $_REQUEST['morada'] . "', "  . $_REQUEST['numprocessosocorro'] . ");";
                echo($sql);
                $result = $db->prepare($sql);
                $result -> execute();
                echo("<h1>Complete!!</h1>");
            }
            catch(Exception $e){
                echo("<h1>$e</h1>");
            }
            echo("<p>asdasdasd</p>");
        ?>
    </body>
</html>