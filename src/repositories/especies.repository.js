import { db } from "../database/database.conection.js";

export async function SearchEspecie(especie){
    const resp = await db.query(`SELECT * FROM especies WHERE nome = LOWER($1)`,[especie]);
    return resp.rows;
}

export async function CreateEspecie(especie){
    const id = await db.query('INSERT INTO especies (nome) VALUES (LOWER($1)) RETURNING id;',[especie]);
    return id.rows;
}