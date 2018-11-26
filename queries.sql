#1)
SELECT numProcessoSocorro FROM Acciona Group BY numProcessoSocorro
  HAVING COUNT(numMeio) >= ALL(SELECT COUNT(numMeio) FROM Acciona GROUP BY numProcessoSocorro)

#2)
SELECT nomeEntidade FROM Audita GROUP BY nomeEntidade
  WHERE dataHoraFim <= "23/09/2018 23:59" AND dataHoraInicio >= "21/06/2018 00:00"
  HAVING COUNT(numProcessoSocorro) >= ALL(SELECT COUNT(numProcessoSocorro) FROM Audita GROUP BY nomeEntidade WHERE dataHoraFim <= "23/09/2018 23:59" AND dataHoraInicio >= "21/06/2018 00:00")

#3)
SELECT UNIQUE numProcessoSocorro FROM EventoEmergencia NATURAL JOIN Audita NATURAL JOIN Acciona
  WHERE idCoordenador = NULL AND instanteChamada >= "01/01/2018 00:00" AND instanteChamada <= "31/12/2018 23:59"

#4)
SELECT COUNT(numSegmento) FROM SegmentoVideo NATURAL JOIN Video NATURAL JOIN Vigia
  WHERE duracao > 60, moradaLocal = "Monchique" AND dataHoraFim <= "31/08/2018 23:59" AND dataHoraInicio => "01/08/2018 00:00"

#5)
SELECT numMeio FROM MeioCombate
  WHERE numMeio NOT IN (SELECT numMeio FROM MeioApoio NATURAL JOIN Acciona)

#6)
SELECT nomeEntidade FROM Acciona NATURAL JOIN MeioCombate GROUP BY nomeEntidade
  HAVING SUM(numProcessoSocorro) >= SELECT SUM(numProcessoSocorro) FROM ProcessoSocorro
