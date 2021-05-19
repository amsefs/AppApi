import Sequelize from 'sequelize';
import { sequelize } from '../database/database';

import Proyecto from '../models/Proyecto';


const Tarea = sequelize.define('tarea',{
    idtarea:
    {
        type: Sequelize.INTEGER,
        primaryKey: true
    },
    idproyecto:{
        type: Sequelize.INTEGER
    },
    descripcion:{
        type: Sequelize.TEXT
    },       
    estaactivo:{
        type: Sequelize.BOOLEAN
    }
}, {
    timestamps: false,
    //schema: "public",
    tableName: "tarea"
});

Proyecto.hasMany(Tarea,{foreignKey: 'idproyecto'})
Tarea.belongsTo(Proyecto,{foreignKey: 'idproyecto'})



export default Tarea;