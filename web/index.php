<html>
<body>
<?php
	$user="ist186388";
	$host="db.ist.utl.pt";
	$port=5432;
	$password="12345678";
    $dbname = $user;
    
	$connection = pg_connect("host=$host port=$port user=$user password=$password dbname=$bdname") or die(pg_last_error());
	
	echo("<p>Connected to Postgres on $host as user $user on database $dbname.</p>");
    
    echo("<p>------------------------------Locais------------------------------</p>");
    printTable("locais", true, false);
    echo("<p>-------------------------------Evento Emergencia------------------------------</p>");
    printTable("eventoemergencia", true, false);
    echo("<p>------------------------------Processos de socorro------------------------------</p>");
    printTable("processosocorro", true, false);
    echo("<p>------------------------------Meio------------------------------</p>");
    printTable("meio", true, false);
    echo("<p>------------------------------Entidade Meio------------------------------</p>");
    printTable("entidademeio", true, false);
    echo("<p>------------------------------Meios de combate------------------------------</p>");
    printTable("meiocombate", false, true);
    echo("<p>------------------------------Meio Apoio------------------------------</p>");
    printTable("meioapoio", false, true);
    echo("<p>------------------------------Meio Socorro------------------------------</p>");
    printTable("meiosocorro",false, true);

    $pg_close($connection);

    function printTable($table, $show_add, $show_edit) {
        $sql = "SELECT * FROM " . $table . ";";

        $result = pg_query($sql) or die(pg_last_error());
        
        $i = pg_num_fields($result);

        echo("<table border=\"1\"><tr>");

        for($j = 0; $j < $i; $j++) {
            echo("<td><h3>" . pg_field_name($result, $j) . "</h3></td>");
        }
        echo("</tr>");

        while ($row = pg_fetch_assoc($result)) {
            echo("<tr>");
            for($j = 0; $j < $i; $j++)
            {
                echo("<td>");
                echo($row[pg_field_name($result, $j)]);
                echo("</td>");
            }
            echo("<td><a href=\"deleteFromTable.php\">Apagar</a></td>");
            echo("</tr>");
        }
        if($show_add) {
            echo("<form action=\"addToTable.php\">");
            echo("<input type=\"hidden\" name=\"table\" value=\"$table\">");
            echo("<p>Novo <span name=\"table\">$table: </span><input type=\"text\" name=\"nome\">\t");
            echo("<input type=\"submit\" value=\"Adicionar\"/></p>");
            echo("</form>");
        }
        echo("</table>");
    
        $result = pg_free_result($result) or die('ERROR: ' . pg_last_error());
    }
?>
</body>
</html>
