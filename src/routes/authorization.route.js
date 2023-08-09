import { Router } from "express";

const authorizationRouter = Router();
    authorizationRouter.post('/ping', (req, res)=>{
        console.log('ping...');
        res.status(200).send('ping');
    });
export default authorizationRouter;