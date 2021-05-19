import express, { json } from 'express';
import morgan from 'morgan';

//importar rutas

import proyectoRoutes from './routes/proyecto';
import tareaRoutes from './routes/tarea';

const app = express();

///midlewares
app.use(morgan('dev'));
app.use(json());

//routes
app.use('/api/proyectos',proyectoRoutes);
app.use('/api/tareas',tareaRoutes);

export default app;