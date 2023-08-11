import { db } from "../database/database.conection";

export async function YourPokemons(id){
    const resp = await db.query(`SELECT DISTINCT ON (modelos.id) modelos.nome, modelos.id AS "idPokemon", e.nome AS especie, f.foto, modelos.created_at
    FROM modelos
    JOIN fotos f ON f."idModelo" = modelos.id
    JOIN especies e ON e.id = modelos."idEspecie"
    WHERE "idUsuario" = $1
    ORDER BY modelos.id, modelos.created_at DESC
    LIMIT 3;`,[id]);
    return resp.rows[0];
}