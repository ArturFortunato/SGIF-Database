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
    
    echo("<p>------------------------------Socorros nos Local N------------------------------</p>");
    echo(getForm("listSocorroEmLocalN")); 
    echo("<p>------------------------------Meios acionados no processo N------------------------------</p>");  
    echo(getForm("listMeiosAcionadosNoProcessoN"));      
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
    printTable("meiocombate", true, true);
    echo("<p>------------------------------Meio Apoio------------------------------</p>");
    printTable("meioapoio", true, true);
    echo("<p>------------------------------Meio Socorro------------------------------</p>");
    printTable("meiosocorro",true, true);

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
            $ar = "";
            for($j = 0; $j < $i; $j++) {
                echo("<td>");
                echo($row[pg_field_name($result, $j)]);
                echo("</td>");
            }
            for($k = 0; $k < $i; $k++) {
                $ar .= pg_field_name($result, $k) . "=" . $row[pg_field_name($result, $k)] . "::";
            }
            
            echo("<td><a href=\"deleteFromTable.php?row={$ar}&table=$table\">Apagar</a></td>");
            echo("</tr>");
        }
        if($show_add) {
            echo(getForm($table));
        }
        echo("</table>");
    
        $result = pg_free_result($result) or die('ERROR: ' . pg_last_error());
    }

    function getForm($table) {
        if ($table == 'locais') {
            return "<form action=\"addToLocaisTable.php\">
                        <input type=\"hidden\" name=\"table\" value=\"$table\">
                        <p>Novo local:
                            <input type=\"text\" name=\"nome\">\t
                            <input type=\"submit\" value=\"Adicionar\"/>
                        </p>
                    </form>";
        }
        else if ($table == 'eventoemergencia') {
            return "<form action=\"addToEventoEmergenciaTable.php\">
                        <p>Novo Evento emergencia</p>
                        <input type=\"hidden\" name=\"table\" value=\"$table\">

                        <p>Telefone
                            <input type=\"text\" name=\"numtelefone\">\t
                        </p>
                        <p>Instante do inicio da chamada
                            <input type=\"text\" name=\"instantechamada\">\t
                        </p>
                        <p>Nome da pessoa
                            <input type=\"text\" name=\"nomepessoa\">\t
                        </p>
                        <p>Morada
                            <input type=\"text\" name=\"moradalocal\">\t
                        </p>
                        <p>Processo socorro
                            <input type=\"text\" name=\"numprocessosocorro\">\t
                        </p>
                        <p>
                            <input type=\"submit\" value=\"Adicionar\"/>
                        </p>
                    </form>";
        }
        else if ($table == 'processosocorro') {
            return "<form action=\"addToProcessoSocorroTable.php\">
                        <input type=\"hidden\" name=\"table\" value=\"$table\">
                        <p>Novo Processo de Socorro:
                            <input type=\"text\" name=\"numprocessosocorro\">\t
                            <input type=\"submit\" value=\"Adicionar\"/>
                        </p>
                    </form>";
        }
        else if ($table == 'meio') {
            return "<form action=\"addToMeioTable.php\">
                        <p>Novo Meio</p>
                        <input type=\"hidden\" name=\"table\" value=\"$table\">

                        <p>Numero do meio
                            <input type=\"text\" name=\"nummeio\">\t
                        </p>
                        <p>Nome do meio
                            <input type=\"text\" name=\"nomemeio\">\t
                        </p>
                        <p>Nome da entidade
                            <input type=\"text\" name=\"nomeentidade\">\t
                        </p>
                        <p>
                            <input type=\"submit\" value=\"Adicionar\"/>
                        </p>
                    </form>";
        }
        else if ($table == 'entidademeio') {
            return "<form action=\"addToEntidadeTable.php\">
                        <p>Novo Meio</p>
                        <input type=\"hidden\" name=\"table\" value=\"$table\">
                        <p>Nome da entidade
                            <input type=\"text\" name=\"nomeentidade\">\t
                        </p>
                        <p>
                            <input type=\"submit\" value=\"Adicionar\"/>
                        </p>
                    </form>";        
        }
        else if ($table == 'meiocombate') {
            return "<form action=\"addToVariosMeiosTable.php\">
                        <p>Novo Meio de combate</p>
                        <input type=\"hidden\" name=\"table\" value=\"$table\">
                        <p>Numero do meio
                            <input type=\"text\" name=\"nummeio\">\t
                        </p>
                        <p>Nome da entidade
                            <input type=\"text\" name=\"nomeentidade\">\t
                        </p>
                        <p>
                            <input type=\"submit\" value=\"Adicionar\"/>
                        </p>
                    </form>";        
        }
        else if ($table == 'meioapoio') {
            return "<form action=\"addToVariosMeiosTable.php\">
                        <p>Novo Meio de combate</p>
                        <input type=\"hidden\" name=\"table\" value=\"$table\">
                        <p>Numero do meio
                            <input type=\"text\" name=\"nummeio\">\t
                        </p>
                        <p>Nome da entidade
                            <input type=\"text\" name=\"nomeentidade\">\t
                        </p>
                        <p>
                            <input type=\"submit\" value=\"Adicionar\"/>
                        </p>
                    </form>";               
        }
        else if ($table == 'meiosocorro') {
            return "<form action=\"addToVariosMeiosTable.php\">
                        <p>Novo Meio de combate</p>
                        <input type=\"hidden\" name=\"table\" value=\"$table\">
                        <p>Numero do meio
                            <input type=\"text\" name=\"nummeio\">\t
                        </p>
                        <p>Nome da entidade
                            <input type=\"text\" name=\"nomeentidade\">\t
                        </p>
                        <p>
                            <input type=\"submit\" value=\"Adicionar\"/>
                        </p>
                    </form>";              
        }
        else if ($table == "listSocorroEmLocalN") {
            return  "<form action=\"listSocorroNoLocal.php\">
                        <p>Listar os meios de socorro acionados em processos de socorro originados em 
                            <input type=\"text\" name=\"moradalocal\">\t
                            <input type=\"submit\" value=\"Listar\"/>
                        </p>
                    </form>";
        }
        else if ($table == "listMeiosAcionadosNoProcessoN") {
            return  "<form action=\"listMeiosAcionadosNoProcesso.php\">
                        <p>Listar os Meios acionados no processo
                        <input type=\"text\" name=\"numprocessosocorro\">\t
                            <input type=\"submit\" value=\"Listar\"/>
                        </p>
                    </form>";
        }
    }
?>
</body>
</html>
