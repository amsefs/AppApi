import Sequelize from 'sequelize';

export const sequelize = new Sequelize(
    'bdproyecto',
    'postgres',
    '123456',{
        host: 'localhost',
        port: '5432', 
        dialect: 'postgres',
        pool: {
            max: 5,
            min: 0,
            require: 30000,
            idle: 10000
        },
        logging: false
    }
);
