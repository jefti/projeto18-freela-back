import { createUser, getUsersByCPF, getUsersByEmail } from "../repositories/user.repository.js";
import bcrypt from 'bcrypt';

export async function registerUser(req, res){
    try{
        const {nome,phone, CPF,email,senha, foto} = req.body;
        const testeEmail = (await getUsersByEmail(req.body.email)).rows[0];
        if(testeEmail) return res.status(409).send('email já cadastrado!');
        const testeCPF = (await getUsersByCPF(req.body.CPF)).rows[0];
        if(testeCPF) return res.status(409).send('CPF já cadastrado!');
        const senhaCriptografada = bcrypt.hashSync(senha, 10);
        const cadastro = await createUser({nome,phone,CPF,email, senha:senhaCriptografada, foto});
        return res.sendStatus(201);
    }catch(err){
        return res.status(500).send(err.message);
    }
}