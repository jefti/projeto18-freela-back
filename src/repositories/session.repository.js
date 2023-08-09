import { db } from "../database/database.conection.js";

export async function createSession(token, idUsuario){
    await db.query(`INSERT INTO sessao (token, idusuario) VALUES($1,$2);`,[token, idUsuario]);
    return true;
}

export async function SearchToken(token){
    const resp = await db.query(`SELECT 
    u.id,nome,phone,email,foto , 
    s.id AS id_Sessao, s.token 
    FROM usuario AS u
    JOIN sessao s ON u.id = s.idusuario
    WHERE s.token = $1;`, [token]);
    return resp;
}

export async function DeleteSession(token){
    const resp = await db.query(`DELETE FROM sessao WHERE token = $1;`, [token]);
    return resp;
}