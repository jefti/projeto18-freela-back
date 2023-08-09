import { SearchToken } from "../repositories/session.repository.js";

export default async function validateToken(req, res, next){
    try{
        const {authorization} = req.headers;
        const token = authorization?.replace("Bearer ","");
        if(!token) return res.status(401).send('Necessário token de validação.');
        const usuario = (await SearchToken(token));
        if(usuario.rowCount === 0) res.sendStatus(404);
        res.locals.user= usuario.rows[0];
        next();
    }catch(err){
        res.status(500).send(err.message);
    }
}