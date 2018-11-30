--1) 
SELECT numprocessosocorro FROM aciona 
	Group BY numprocessosocorro HAVING COUNT(nummeio) >= ALL(SELECT COUNT(nummeio) 
		FROM aciona GROUP BY numprocessosocorro); 

--2 
SELECT nomeentidade FROM eventoemergencia NATURAL JOIN aciona
  WHERE instantechamada <= '2018-09-23 23:59:59' AND instantechamada >= '2018-06-21 00:00:00'
  GROUP BY nomeentidade HAVING COUNT(numprocessosocorro) >= ALL
  (SELECT COUNT(numprocessosocorro) FROM eventoemergencia NATURAL JOIN aciona
  	WHERE instantechamada <= '2018-09-23 23:59:59' AND instantechamada >= '2018-06-21 00:00:00'
  	GROUP BY nomeentidade);

--3) 
SELECT numprocessosocorro 
FROM eventoemergencia 
NATURAL JOIN aciona 
WHERE moradalocal = 'Oliveira do Hospital' AND instantechamada >= '2018-01-01 00:00:00' AND instantechamada <= '2018-12-31 23:59:00'
AND numprocessosocorro NOT IN(SELECT numprocessosocorro FROM audita);

--4) 
SELECT COUNT(numsegmento) FROM segmentovideo 
NATURAL JOIN video NATURAL JOIN vigia 
WHERE duracao > 60 AND moradalocal = 'Monchique' AND datahorafim <= '2018-08-31 23:59' AND datahorainicio >= '2018-08-01 00:00';

--5)
SELECT nummeio, nomeentidade FROM meiocombate EXCEPT(SELECT nummeio, nomeentidade FROM alocado GROUP BY nummeio, nomeentidade);

--6)  
--1) 
SELECT numprocessosocorro FROM aciona 
	Group BY numprocessosocorro HAVING COUNT(nummeio) >= ALL(SELECT COUNT(nummeio) 
		FROM aciona GROUP BY numprocessosocorro); 

--2 
SELECT nomeentidade FROM eventoemergencia NATURAL JOIN aciona
  WHERE instantechamada <= '2018-09-23 23:59:59' AND instantechamada >= '2018-06-21 00:00:00'
  GROUP BY nomeentidade HAVING COUNT(numprocessosocorro) >= ALL
  (SELECT COUNT(numprocessosocorro) FROM eventoemergencia NATURAL JOIN aciona
  	WHERE instantechamada <= '2018-09-23 23:59:59' AND instantechamada >= '2018-06-21 00:00:00'
  	GROUP BY nomeentidade);

--3) 
SELECT numprocessosocorro 
FROM eventoemergencia 
NATURAL JOIN aciona 
WHERE moradalocal = 'Oliveira do Hospital' AND instantechamada >= '2018-01-01 00:00:00' AND instantechamada <= '2018-12-31 23:59:00'
AND numprocessosocorro NOT IN(SELECT numprocessosocorro FROM audita);

--4) 
SELECT COUNT(numsegmento) FROM segmentovideo 
NATURAL JOIN video NATURAL JOIN vigia 
WHERE duracao > 60 AND moradalocal = 'Monchique' AND datahorafim <= '2018-08-31 23:59' AND datahorainicio >= '2018-08-01 00:00';

--5)
SELECT nummeio, nomeentidade FROM meiocombate EXCEPT(SELECT nummeio, nomeentidade FROM alocado GROUP BY nummeio, nomeentidade);

--6)  
SELECT nomeentidade FROM aciona NATURAL JOIN meiocombate meios_acc WHERE NOT EXISTS(SELECT numprocessosocorro FROM aciona EXCEPT SELECT numprocessosocorro FROM aciona filter WHERE meios_acc.nomeentidade = filter.nomeentidade) GROUP BY nomeentidade;