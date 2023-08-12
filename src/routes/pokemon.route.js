import { Router } from "express"
import validateToken from "../middlewares/validateToken.middleware.js";
import { getHomeList, getPokemonById, getYourPokemons } from "../controllers/pokemon.controller.js";


const pokemonRouter = Router();
pokemonRouter.get('/yoursPokemons', validateToken, getYourPokemons);
pokemonRouter.get('/homeList', getHomeList);
pokemonRouter.get('/getPokemon/:id',getPokemonById);
export default pokemonRouter;