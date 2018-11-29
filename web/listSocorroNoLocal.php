<html>
    <body>
        <?php
            include("config.php");

            echo("<form action=\"index.php\"><input type=\"submit\" value=\"Voltar\"></form>");
            
            $sql = "SELECT nummeio, nomeentidade FROM meiosocorro NATURAL JOIN processosocorro NATURAL JOIN eventoemergencia WHERE moradalocal=:moradalocal";
            //$sql = "SELECT * FROM entidademeio";

            $result = $db->prepare($sql);
            $result->execute([':moradalocal' => $_REQUEST['moradalocal']]);
            
            echo("<table border=\"1\">");
            foreach($result as $row) {
                echo("<tr>");
                echo("<td>" . $row[0] . "</td>");
                echo("<td>" . $row[1] . "</td>");
                echo("</tr>");
            }
            echo("</table>");

        ?>
    </body>
</html>