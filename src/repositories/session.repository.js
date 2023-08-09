import { db } from "../database/database.conection.js";

export async function createSession(token, idUsuario){
    await db.query(`INSERT INTO sessao (token, idusuario) VALUES($1,$2);`,[token, idUsuario]);
    return true;
}