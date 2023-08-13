import { db } from "../database/database.conection.js";

export async function YourPokemons(id){
    const resp = await db.query(`SELECT DISTINCT ON (modelos.id) modelos.nome, modelos.id AS "idPokemon", e.nome AS especie, f.foto, modelos.created_at
    FROM modelos
    JOIN fotos f ON f."idModelo" = modelos.id
    JOIN especies e ON e.id = modelos."idEspecie"
    WHERE "idUsuario" = $1
    ORDER BY modelos.id, modelos.created_at DESC
    LIMIT 3;`,[id]);
    return resp.rows;
}

export async function AllPokemons(){
    const resp = await db.query(`
    SELECT 
        DISTINCT ON (pkmn.id) 
        pkmn.id AS "idPokemon",
        pkmn.nome,
        esp.nome AS especie,
        pic.foto AS foto,
        pkmn.descricao,diaria,
        u.nome AS responsavel,
        u.phone AS contato,
        pkmn.created_at
    FROM modelos AS pkmn 
    JOIN fotos pic ON  pic."idModelo" = pkmn.id
    JOIN especies esp ON esp.id = pkmn."idEspecie"
    JOIN usuario u on u.id = pkmn."idUsuario"
    WHERE pkmn.avaliable = true
    ORDER BY pkmn.id DESC
    LIMIT 8;
`);
return resp.rows;
}

export async function getPokemon(id){
    const resp = await db.query(`
        SELECT
            pkmn.id AS "idPokemon",
            pkmn.nome,
            pkmn.avaliable,
            esp.nome AS especie,
            q.nome AS qualidade,
            pic.foto AS foto,
            pic.comentario AS "comentarioFoto",
            pic."createdAt" AS "dataFoto",
            pkmn.descricao,diaria,
            u.nome AS responsavel,
            u.phone AS telefone,
            u.email AS email,
            u.foto AS "fotoUsuario"
        FROM modelos AS pkmn 
        JOIN fotos pic ON  pic."idModelo" = pkmn.id
        JOIN especies esp ON esp.id = pkmn."idEspecie"
        JOIN usuario u on u.id = pkmn."idUsuario"
        JOIN qualidades q on q.id = pkmn."idQualidade"
        WHERE pkmn.id = $1;`
            ,[id]);
    return resp.rows[0];
}

export async function getAny(search){
    const resp = db.query(`
    SELECT
	pkmn.id AS "idPokemon",
	pkmn.nome,
	esp.nome as especie,
	us.nome as responsavel,
	pkmn.descricao,
	pkmn.diaria ,
	us.phone as contato,
	pic.foto
    FROM modelos AS pkmn
    JOIN especies esp ON esp.id = pkmn."idEspecie"
    JOIN usuario us on us.id = pkmn."idUsuario"
    JOIN fotos pic on pic."idModelo" = pkmn.id
    WHERE pkmn.avaliable = true AND
    (LOWER(pkmn.nome) LIKE $1 OR LOWER(esp.nome) LIKE $1 OR LOWER(us.nome) LIKE $1)
    ORDER BY
	CASE
		WHEN LOWER(pkmn.nome) LIKE $1 THEN 1
		WHEN LOWER(esp.nome) LIKE $1 THEN 2
		WHEN LOWER(us.nome) LIKE $1 THEN 3
		ELSE 4
	END
    LIMIT 20;
    
    `,[`%${search.toLowerCase()}%`]);
    return resp;
}