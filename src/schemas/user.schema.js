import joi from "joi";

export const userSchema = joi.object({
    nome:joi.string().trim().required(),
    email:joi.string().email().trim().required(),
    phone:joi.string().trim().length(11).pattern(/^\d+$/).required(),
    CPF: joi.string().trim().length(11).pattern(/^\d+$/).required(),
    senha:joi.string().trim().min(3).required(),
    foto:joi.string().uri().trim().pattern(/^https?:\/\/.*\.(png|jpg|jpeg|gif|bmp)$/i).required()
});