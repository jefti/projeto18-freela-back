import { Router } from "express";
import validateSchema from "../middlewares/validateSchema.middleware.js";
import { userSchema } from "../schemas/user.schema.js";
import { authorizeLogin, registerUser } from "../controllers/authorization.controller.js";
import { loginSchema } from "../schemas/login.schema.js";

const authorizationRouter = Router();
    authorizationRouter.post('/ping', (req, res)=>{
        console.log('ping...');
        res.status(200).send('ping');
    });
    authorizationRouter.post('/registro', validateSchema(userSchema),registerUser );
    authorizationRouter.post('/login', validateSchema(loginSchema),authorizeLogin);
export default authorizationRouter;