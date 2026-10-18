import '../models/topic.dart';

const inicioTopic = Topic(
  id: 'inicio',
  title: 'Inicio',
  blocks: [
    ImageBlock('assets/images/portada.jpg'),
    HeadingBlock('Objetivo'),
    ParagraphBlock(
      'Desarrollar una aplicación móvil enfocada exclusivamente en ser un medio informativo para dispositivos Android. Su propósito es exponer la arquitectura y características de un sistema operativo a través de una herramienta digital que se encuentra en una etapa de construcción evolutiva, refinando su interfaz y optimizando sus apartados actuales progresivamente hasta consolidarse en un producto final robusto y definitivo.',
    ),
    HeadingBlock('Sistema operativo elegido'),
    ParagraphBlock(
      'El sistema operativo analizado en este proyecto es Solaris, la versión UNIX de Sun basada en SVR4. Su elección se debe a que es la implementación UNIX más utilizada y comercialmente más exitosa. Además, representa el principal ejemplo del modelo de hilos combinado entre nivel de usuario y de núcleo.',
    ),
  ],
);