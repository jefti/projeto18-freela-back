import { Router } from "express"
import validateToken from "../middlewares/validateToken.middleware.js";
import { getHomeList, getYourPokemons } from "../controllers/pokemon.controller.js";


const pokemonRouter = Router();
pokemonRouter.get('/yoursPokemons', validateToken, getYourPokemons);
pokemonRouter.get('/homeList', getHomeList);
export default pokemonRouter;