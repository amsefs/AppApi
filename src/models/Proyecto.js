import Sequelize from 'sequelize';
import { sequelize } from '../database/database';

const Proyecto = sequelize.define('proyecto',{
    idproyecto:
    {
        type: Sequelize.INTEGER,
        primaryKey: true
    },
    descripcion:{
        type: Sequelize.TEXT
    },
    estaactivo:{
        type: Sequelize.INTEGER
    }
}, {
    timestamps: false,
    //schema: "public",
    tableName: "proyecto"
});


export default Proyecto;