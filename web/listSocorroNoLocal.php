<html>
    <body>
        <?php
            include("config.php");

            //$sql = "SELECT nummeio, nomeentidade FROM meiosocorro NATURAL JOIN processosocorro NATURAL JOIN eventoemergencia WHERE moradalocal=:moradalocal";
            $sql = "SELECT * FROM entidademeio";

            $result = $db->prepare($sql);
            $result->execute();//[':moradalocal' => $_REQUEST['moradalocal']]);
            
            $rows = array();
            echo("<table border=\"1\">");
            while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
                echo("<tr>");
                for($i = 0; $i < sizeof($row); $i++) {
                    echo("<td>" . $row[$i] . "</td>"); //Row[i] por alguma razao e um array tambem
                }
                echo("</tr>");
                $rows[] = $row;
            }
            echo("</table>");

            echo("Banana");
            echo($rows[1][0]);
            echo("banana final");
        ?>
    </body>
</html>