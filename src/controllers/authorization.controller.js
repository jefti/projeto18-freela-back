import { checkUser, createUser, getUsersByCPF, getUsersByEmail } from "../repositories/user.repository.js";
import bcrypt from 'bcrypt';
import { v4 as uuid } from 'uuid';  
import {DeleteSession, createSession} from "../repositories/session.repository.js";

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
};

export async function authorizeLogin(req, res){
    try{
        const usuario = (await checkUser(req.body));    
        if(usuario.rowCount === 0) return res.status(404).send('Usuario e/ou senha inválidos');
        const teste = bcrypt.compareSync(req.body.senha,usuario.rows[0].senha); 
        if(!teste) return res.status(404).send('Usuario e/ou senha inválidos'); 
        delete usuario.rows[0].senha;
        const token = uuid();
        await createSession(token, usuario.rows[0].id);
        return res.status(200).send({token});
    }catch(err){
        return res.status(500).send(err.message);
    }
}

export async function authorizeLogout(req,res){
    try{
        const usuario = res.locals.user;
        delete res.locals.user;
        await DeleteSession(usuario.token);
        res.sendStatus(204);
    }catch(err){
        return res.status(500).send(err.message);
    }
}