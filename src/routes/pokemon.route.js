import { Router } from "express"
import validateToken from "../middlewares/validateToken.middleware.js";
import { getYourPokemons } from "../controllers/pokemon.controller.js";


const pokemonRouter = Router();
pokemonRouter.get('/yoursPokemons', validateToken, getYourPokemons);
export default pokemonRouter;