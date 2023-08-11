export async function getYourPokemons(req, res){
    try{
        const {user} = res.locals;
        return res.send(user);
    }catch(err){
        return res.status(500).send(err.message);        
    }
}