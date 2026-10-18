import '../models/topic.dart';

const introduccionTopic = Topic(
  id: 'introduccion',
  title: 'Introducción',
  blocks: [
    ParagraphBlock(
      'UNIX surgió en los laboratorios Bell a inicios de la década de 1970 y dio origen a numerosas variantes que más tarde se unificaron en SVR4, la base sobre la que Sun construyó Solaris.',
    ),
    ParagraphBlock(
      'Esta aplicación recopila la investigación técnica sobre Solaris en un recorrido que parte de su historia y continúa con cuatro fundamentales: arquitectura y desempeño; multitarea y control de concurrencia; almacenaje, memoria y archivos; y redes, seguridad y sistemas distribuidos. Incluye además un cuadro comparativo entre UNIX tradicional, SVR4, Solaris y Linux, y cuatro documentos PDF con las actividades de cada fundamental.',
    ),
    ParagraphBlock(
      'El propósito es ofrecer una consulta ordenada y ágil de estos temas. Al estar todo el contenido incluido en la propia aplicación, puede consultarse en cualquier momento sin conexión a internet.',
    ),
  ],
);