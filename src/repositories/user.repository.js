import { db } from "../database/database.conection.js";

export async function getUsersByEmail(email){
    const result = await db.query(`SELECT * FROM usuario WHERE email = $1;`,[email]);
    return result;
}

export async function getUsersByCPF(cpf){
    const result = await db.query(`SELECT * FROM usuario WHERE cpf = $1;`,[cpf]);
    return result;
}

export async function createUser(body){
    const {nome,phone, CPF,email,senha, foto} = body;
    const result = await db.query(`INSERT INTO usuario 
    (nome, phone, cpf, email, senha,foto) 
    VALUES 
    ($1,$2,$3,$4,$5,%6)`
    ,[nome,phone, CPF,email,senha, foto]);
    return result;
}