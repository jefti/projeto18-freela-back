import { Router } from "express"
import validateToken from "../middlewares/validateToken.middleware.js";
import { getHomeList, getPokemonByAny, getPokemonById, getYourPokemons, getYourPokemonsAllList } from "../controllers/pokemon.controller.js";


const pokemonRouter = Router();
pokemonRouter.get('/yoursPokemons', validateToken, getYourPokemons);
pokemonRouter.get('/allYoursPokemons', validateToken,getYourPokemonsAllList);
pokemonRouter.get('/homeList', getHomeList);
pokemonRouter.get('/getPokemon/:id',getPokemonById);
pokemonRouter.get('/search/:key', getPokemonByAny);
export default pokemonRouter;