import joi from "joi";

export const userSchema = joi.object({
    nome:joi.string().trim().required().message('Necessário cadastrar nome'),
    emai:joi.email().trim().required().message('Email invalido.'),
    phone:joi.string().trim().length(11).pattern(/^\d+$/).required().message('Número de telefon inválido'),
    CPF: joi.string().trim().length(11).pattern(/^\d+$/).required().message('CPF inválido.'),
    senha:joi.string().trim().min(3).required().message('Senha muito curta.'),
    foto:joi.string().uri().trim().pattern(/^https?:\/\/.*\.(png|jpg|jpeg|gif|bmp)$/i).required().message('Link da foto de perfil inválido.')
});