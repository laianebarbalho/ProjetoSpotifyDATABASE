/*
Gere os seguintes relatórios: */


/* 1. Liste as músicas que possuem a letra "z" no título.*/

SELECT * FROM cancao WHERE titulo LIKE '%Z%';

/* 2. Liste as músicas que têm a letra "a" como segundo caractere e a letra "s" como último caractere.*/

SELECT * FROM cancao WHERE titulo LIKE '_a%s';

/* 3. Mostre a lista de reprodução que contém mais músicas, renomeando as colunas, colocando em maiúscula a primeira letra, os acentos correspondentes e adicionando os espaços entre as palavras.*/
desc playlist;
SELECT idPlaylist AS IDPlaylist,titulo AS Título, qtdcancoes AS 'Quantidade de Canções' FROM playlist
ORDER BY qtdcancoes desc
LIMIT 1;

/* 4. Em outro momento, obtenha uma lista com os 5 usuários mais jovens, a partir dos próximos 10 registros.*/

SELECT * FROM usuario
ORDER BY Data_nac DESC
LIMIT 5
OFFSET 10;

/* 5. Liste as 5 músicas com mais reproduções, em ordem decrescente.*/

SELECT * FROM cancao
ORDER BY qtdreproducao DESC
LIMIT 5;

/* 6. Gere um relatório de todos os álbuns em ordem alfabética.*/

SELECT * FROM album
ORDER BY titulo;

/* 7. Liste todos os álbuns que não possuem imagem, organizados em ordem alfabética.*/

SELECT * FROM album WHERE imagemcapa IS NULL;

select * from album where (IFNULL(imagemcapa,'') = '');

/* 8. Insira um novo usuário com os seguintes dados (leve em consideração os relacionamentos): nomeusuario: novousuariodespotify@gmail.com; Nome e sobrenome: Elmer Santos; password: S4321m; Data de nacimiento: 15/11/1991;
Sexo: Masculino; Código Postal: 55684789; País: Brasil*/

INSERT INTO usuario(idUsuario, NomeUsuario, NomeCompleto, Data_nac, Sexo, Cod, senha, Pais_idPais, IdTipoUsuario) 
VALUES(20, 'novousuariodespotify@gmail.com', 'Elmer Santos', '1991-11-15', 'M', '55684789','S4321m', 9, NULL);

/* 9. Exclua todas as músicas do gênero "pop" da tabela generoxcancao.*/

DELETE FROM generoxcancao WHERE idGenero = 9;

/* 10. Edite todos os artistas que não possuem uma imagem carregada e carregue para eles o texto "Imagem em falta" na coluna de imagens.*/

UPDATE artista set imagem = 'imagem em falta' where imagem IS NULL;

/*or*/

update artista set imagem = 'imagem em falta' where (IFNULL(imagem,'') = '');