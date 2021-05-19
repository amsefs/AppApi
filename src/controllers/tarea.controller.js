import Tarea from '../models/Tarea';
import Proyecto from '../models/Proyecto';

export async function obtenerTareas(req, res){

    try{

        const tareas = await Tarea.findAll({
            atributes:['idtarea','idproyecto','descripcion','estaactivo'],
            where:{
                estaactivo:1
            },                    
            include:[
                {
                    model: Proyecto,                  
                },
            ],
            order: [
                ['descripcion', 'ASC'],                        
            ],
        });
        res.json({
            data:tareas
        })

    }catch(error){
        console.log(error);
        res.json({
            data:{},
            message:'Error: consulta no procesada'
        })

    }

}