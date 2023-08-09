import { Router } from "express";
import validateSchema from "../middlewares/validateSchema.middleware.js";
import { userSchema } from "../schemas/user.schema.js";
import { registerUser } from "../controllers/authorization.controller.js";

const authorizationRouter = Router();
    authorizationRouter.post('/ping', (req, res)=>{
        console.log('ping...');
        res.status(200).send('ping');
    });
    authorizationRouter.post('/registro', validateSchema(userSchema),registerUser );
    authorizationRouter
export default authorizationRouter;