import { Router } from "express";
import authorizationRouter from "./authorization.route.js";
import pokemonRouter from "./pokemon.route.js";

const router = Router();
router.use(authorizationRouter)
router.use(pokemonRouter)
export default router;