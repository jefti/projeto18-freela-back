import { db } from "../database/database.conection.js";

export async function CreateFoto(link,comentario,idModelo){
    await db.query(`
    INSERT INTO fotos (foto, comentario, "createdAt", "idModelo") 
    VALUES (
        $1,
        $2,
        CURRENT_TIMESTAMP,
        $3
        );`,[link,comentario,idModelo]);
}