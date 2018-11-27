--1)
SELECT numprocessosocorro FROM acciona Group BY numprocessosocorro HAVING COUNT(nummeio) >= ALL(SELECT COUNT(nummeio) FROM acciona GROUP BY numprocessosocorro); --works

--2) --doesnt compile
SELECT nomeentidade FROM audita GROUP BY nomeentidade WHERE datahorafim <= '2018-09-23 23:59:00' AND datahorainicio >= '2018-06-21 00:00:00' HAVING COUNT(numprocessosocorro) >= ALL(SELECT COUNT(numprocessosocorro) FROM audita GROUP BY nomeentidade WHERE datahorafim <= '2018-09-23 23:59:00' AND datahorainicio >= '2018-06-21 00:00:00');

--3) -- compiles but wee dont know if it works // misses unique
SELECT numprocessosocorro FROM eventoemergencia NATURAL JOIN audita NATURAL JOIN aciona WHERE idcoordenador = NULL AND moradalocal = 'Oliveira do Hospital' AND instantechamada >= '2018-01-01 00:00:00' AND instantechamada <= '2018-12-31 23:59:00';

--4)
SELECT COUNT(numSegmento) FROM SegmentoVideo NATURAL JOIN Video NATURAL JOIN Vigia
  WHERE duracao > 60, moradaLocal = "Monchique" AND dataHoraFim <= "31/08/2018 23:59" AND dataHoraInicio => "01/08/2018 00:00"

--5)
SELECT numMeio FROM MeioCombate
  WHERE numMeio NOT IN (SELECT numMeio FROM MeioApoio NATURAL JOIN Acciona)

--6)
SELECT nomeEntidade FROM Acciona NATURAL JOIN MeioCombate GROUP BY nomeEntidade
  HAVING SUM(numProcessoSocorro) >= SELECT SUM(numProcessoSocorro) FROM ProcessoSocorro
