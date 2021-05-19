import { Router } from 'express';
const router = Router();

import { obtenerTareas } from '../controllers/tarea.controller';

router.get('/',obtenerTareas);

export default router;