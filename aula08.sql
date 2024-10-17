-- APELIDOS 

-- falaha de ambiguidade, pois há duas colunas com o mesmo nome
-- entre as tabelas
SELECT nome 
FROM Pokemons p, Tipos t;

-- utilizando apelidos para facilitar
SELECT p.nome
FROM Pokemons p, Tipos t;

-- quando não utilizamos apelidos é necessário mencionar  nome da tabela
SELECT Pokemons.nome
FROM Pokemons, Tipos;

-- definindo apelidos nas colunas quando as mesmas tem o mesmo nome
SELECT p.nome, t.nome
FROM Pokemons p, Tipos t;

-- exemplo de definção de apelidos em colunas
SELECT p.nome nome_pokemon, t.nome tipo
FROM Pokemons p, Tipos t;


-- JUNÇÃO 

-- equi join
SELECT p.nome nome_pokemon, t.nome tipo
FROM Pokemons p, Tipos t
WHERE t.tipoid = p.tipoid;

-- inner join
SELECT p.nome nome_pokemon, t.nome tipo
FROM Pokemons p, Tipos t
WHERE t.tipoid = p.tipoid AND t.nome='Fogo';

SELECT p.nome nome_pokemon, t.nome tipo
FROM Pokemons p INNER JOIN Tipos t ON t.tipoid = p.tipoid
WHERE t.nome='Fogo';


-- LEFT JOIN
SELECT p.nome nome_pokemon, t.nome tipo
FROM Pokemons p LEFT JOIN Tipos t ON t.tipoid = p.tipoid;

-- RIGHT JOIN
SELECT p.nome nome_pokemon, t.nome tipo
FROM Pokemons p RIGHT JOIN Tipos t ON t.tipoid = p.tipoid;

-- LEFT EXCLUDING JOIN
SELECT p.nome nome_pokemon, t.nome tipo
FROM Pokemons p LEFT JOIN Tipos t ON t.tipoid = p.tipoid
WHERE T.tipoid is null;

-- RIGHT EXCLUDING JOIN
SELECT p.nome nome_pokemon, t.nome tipo
FROM Pokemons p RIGHT JOIN Tipos t ON t.tipoid = p.tipoid
WHERE P.tipoid IS NULL;

-- FULL JOIN
SELECT p.nome nome_pokemon, t.nome tipo
FROM Pokemons p FULL JOIN Tipos t ON t.tipoid = p.tipoid;


-- OU
-- o unnion é utilizado para juntar duas ou mais consultas
-- o full join é LEFT JOIN + RIGHT JOIN
SELECT p.nome nome_pokemon, t.nome tipo
FROM Pokemons p LEFT JOIN Tipos t ON t.tipoid = p.tipoid
union
SELECT p.nome nome_pokemon, t.nome tipo
FROM Pokemons p RIGHT JOIN Tipos t ON t.tipoid = p.tipoid;

-- OUTER JOIN OU EXCLUDING JOIN
-- o OUTER join é LEFT EXCLUDING JOIN + RIGHT EXCLUDING JOIN
SELECT p.nome nome_pokemon, t.nome tipo
FROM Pokemons p LEFT JOIN Tipos t ON t.tipoid = p.tipoid
WHERE T.tipoid is null
union
SELECT p.nome nome_pokemon, t.nome tipo
FROM Pokemons p RIGHT JOIN Tipos t ON t.tipoid = p.tipoid
WHERE P.tipoid IS NULL;


-- CROSS JOIN
SELECT p.nome nome_pokemon, t.nome tipo
FROM Pokemons p, Tipos t;


-- SELF JOIN
SELECT p1.pokemonid, p1.nome nome_pokemon, p2.pokemonid, p2.nome nome_pokemon
FROM Pokemons p1 INNER JOIN Pokemons p2 ON p1.tipoid = p2.tipoid
WHERE p1.pokemonid < p2.pokemonid;
