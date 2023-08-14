import { Router } from "express"
import validateToken from "../middlewares/validateToken.middleware.js";
import { CreatePokemon, getHomeList, getPokemonByAny, getPokemonById, getYourPokemons, getYourPokemonsAllList, setDisponivel } from "../controllers/pokemon.controller.js";
import validateSchema from "../middlewares/validateSchema.middleware.js";
import { PokemonSchema } from "../schemas/pokemon.schema.js";


const pokemonRouter = Router();
pokemonRouter.get('/yoursPokemons', validateToken, getYourPokemons);
pokemonRouter.get('/allYoursPokemons', validateToken,getYourPokemonsAllList);
pokemonRouter.get('/homeList', getHomeList);
pokemonRouter.get('/getPokemon/:id',getPokemonById);
pokemonRouter.get('/search/:key', getPokemonByAny);
pokemonRouter.put('/setAvaliable/:id/:value', validateToken, setDisponivel);
pokemonRouter.post('/pokemon',validateToken,validateSchema(PokemonSchema),CreatePokemon);
export default pokemonRouter;