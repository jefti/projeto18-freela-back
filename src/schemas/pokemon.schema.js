import joi from 'joi';

export const PokemonSchema = joi.object({
    nome: joi.string().required(),
    descricao: joi.string().required(),
    diaria: joi.number().integer().positive().min(1).required(),
    qualidade: joi.number().integer().positive().min(1).required(),
    especie: joi.number().integer().positive().min(1).required(),
    foto: joi.string().uri().trim().pattern(/^https?:\/\/.*\.(png|jpg|jpeg|gif|bmp)$/i).required(),
    dataFoto: joi.date().timestamp().required(),
    comentarioFoto: joi.string().required()
});