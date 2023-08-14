import { CreateEspecie, SearchEspecie } from "../repositories/especies.repository.js";
import { CreateFoto } from "../repositories/fotos.repository.js";
import { AllPokemons, AllYourPokemons, SetAvaliable, YourPokemons, createModelo, getAny, getPokemon } from "../repositories/modelos.repository.js";

export async function getYourPokemons(req, res){
    try{
        const {user} = res.locals;
        const lista = await YourPokemons(user.id);
        return res.send(lista);
    }catch(err){
        return res.status(500).send(err.message);        
    }
};

export async function getYourPokemonsAllList(req,res){
    try{
        const {user} = res.locals;
        const lista = await AllYourPokemons(user.id);
        return res.send(lista);
    }catch(err){
        return res.status(500).send(err.message);        
    }
}

export async function getHomeList(req, res){
try{
    const lista = await AllPokemons();
    return res.send(lista);
}catch(err){
    return res.status(500).send(err.message);        
}
}

export async function getPokemonById(req,res){
try{
    const {id} = req.params;
    const resp = await getPokemon(id);
    if(!resp) return res.status(404).send('Não encontrado.');
    return res.send(resp);
}catch(err){
    return res.status(500).send(err.message);        
}
}

export async function getPokemonByAny(req,res){
try{
    const{key} = req.params;
    const lista = await getAny(key);
    return res.send(lista.rows);
}catch(err){
    return res.status(500).send(err.message);        
}
}

export async function setDisponivel(req, res){
    try{
        const {user} = res.locals;
        const {id,value} = req.params;
        await SetAvaliable(value, id, user.id);
        return res.sendStatus(200);
    }catch(err){
        return res.status(500).send(err.message);        
    }
};

export async function CreatePokemon(req,res){
    try{
        const {user} = res.locals;
        const {nome,descricao,diaria,especie,foto,comentarioFoto} = req.body;
        let objEspecie = await SearchEspecie(especie);
        if(objEspecie.length === 0 ) objEspecie = await CreateEspecie(especie);
        const idEspecie = objEspecie[0].id;
        const objModelo = await createModelo(nome,descricao,diaria,user.id,idEspecie);
        const idModelo = objModelo[0].id;
        await CreateFoto(foto,comentarioFoto,idModelo);
        return (res.send(objModelo));
    }catch(err){
        return res.status(500).send(err.message);        
    }
}