<html>
    <body>
        <?php

            echo("<form action=\"index.php\"><input type=\"submit\" value=\"Voltar\"></form>");
            echo("<h1>Alterar o meio com nummeio " . $_REQUEST['nummeio'] . " e com nomeentidade " . $_REQUEST['nomeentidade'] . "</h1><br>");
            echo("<form action=\"updateMeio.php\">");
            echo("<input type=\"hidden\" value=\"" . $_REQUEST['table'] . "\" name=\"table\">");
            echo("<input type=\"hidden\" value=\"" . $_REQUEST['nummeio'] . "\" name=\"nummeio\">");
            echo("<input type=\"hidden\" value=\"" . $_REQUEST['nomeentidade'] . "\" name=\"nomeentidade\">");
            echo("<p>Numero do meio: <input value=\"" . $_REQUEST['nummeio'] . "\" name=\"novonummeio\"><p>");
            echo("<p>Nome da entidade: <input value=\"" . $_REQUEST['nomeentidade'] . "\" name=\"novonomeentidade\"></p>");
            echo("<input type=\"submit\" value=\"Alterar\"/>");
            echo("</form>");
        ?>
    </body>
</html>