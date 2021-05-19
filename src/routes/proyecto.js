import { Router } from 'express';
const router = Router();

import { obtenerProyectos, nuevoProyecto, borrarProyecto, actualizarProyecto } from '../controllers/proyecto.controller';

router.get('/', obtenerProyectos);
router.post('/',nuevoProyecto);
router.delete('/:idproyecto', borrarProyecto);
router.put('/', actualizarProyecto);


export default router;