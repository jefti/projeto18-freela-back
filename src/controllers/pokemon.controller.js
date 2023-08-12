import { AllPokemons, YourPokemons, getPokemon } from "../repositories/modelos.repository.js";

export async function getYourPokemons(req, res){
    try{
        const {user} = res.locals;
        const lista = await YourPokemons(user.id);
        return res.send(lista);
    }catch(err){
        return res.status(500).send(err.message);        
    }
};

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