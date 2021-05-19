import Proyecto from '../models/Proyecto';

export async function obtenerProyectos(req, res){

    try{

        const proyectos = await Proyecto.findAll({
            atributes:['idproyecto','descripcion','estaactivo'],
            where:{
                estaactivo:1
            },
            order: [
                ['descripcion', 'ASC'],                        
            ],
        });
        res.json({
            data:proyectos
        })

    }catch(error){
        console.log(error);
        res.json({
            data:{},
            message:'Error: consulta no procesada'
        })

    }

}


export async function nuevoProyecto(req, res){
    const{descripcion, estaactivo} = req.body;
    try{

        const nuevoProy = await Proyecto.create({
            descripcion,estaactivo
        },{
            fields:['descripcion','estaactivo']
        });

        if(nuevoProy){
            res.json({
                message: 'El proyecto fue registrado correctamente',
                data: nuevoProy
            })
        }
        else
        {
            res.status(500).json({
                message:'El proyecto no pudo registrarse'
            })
        }

    }catch(error){
        console.log(error);
        res.json({
            data:{},
            message:'Error: consulta no procesada'
        })

    }
}

export async function borrarProyecto(req, res){
    const {idproyecto} = req.params;
    const borrarproy = await Proyecto.destroy({
        where:{
            idproyecto : idproyecto
        }
    });

    res.json({
        message:'Se elimino el Proyecto .',
        count: borrarproy
    })

}

export async function actualizarProyecto(req, res){
    const{idproyecto,descripcion} = req.body;
    console.log(idproyecto);
    console.log(descripcion);

    try{

        const actualizarProy = await Proyecto.update({
            descripcion:descripcion
        },{
            where:{idproyecto:idproyecto}
        });

        if(actualizarProy){
            res.json({
                message: 'El proyecto se actualizo correctamente',
                data: actualizarProy
            })
        }
        else
        {
            res.status(500).json({
                message:'El proyecto no se pudo  actualizar'
            })
        }

    }catch(error){
        console.log(error);
        res.json({
            data:{},
            message:'Error: consulta no procesada'
        })

    }



}