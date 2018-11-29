<?php

$tablename;  //Receive table name
$arguments;  //Receive arguments to update (Array)
$primary;    //Receive primary keys to identify the row

$sql_op = "UPDATE " . $tablename . " SET nummeio = " . $arguments[0] . " , nomeentidade = " . $arguments[1] .
          "WHERE nummeio = " . $primary[0] . " AND nomeentidade = " . $primary[1] . ";";

$result = pg_query($sql_op) or die(pg_last_error());


/*    Sintaxe a seguir

UPDATE $tablename
SET nummeio = "$arguments[0]", nomeentidade = "$arguments[1]"
WHERE nummeio = "$primary[0]" AND nomeentidade = "$primary[1]";*/

?>
