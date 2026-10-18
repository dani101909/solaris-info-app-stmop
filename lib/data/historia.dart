import '../models/topic.dart';

const historiaTopic = Topic(
  id: 'historia',
  title: 'Historia de Solaris',
  blocks: [
    ParagraphBlock(
      'UNIX nació en los laboratorios Bell y quedó operativo en un PDP-7 en 1970. Sus creadores venían del proyecto MAC del MIT (CTSS y Multics) y reconocieron mayor influencia de CTSS. Dos hitos marcaron su expansión. El primero fue portarlo al PDP-11, lo que mostró que podía servir a cualquier computador. El segundo fue reescribirlo en C, algo inédito porque se creía que un sistema operativo debía escribirse en ensamblador. Tras describirse públicamente en 1974, se licenció a empresas y universidades. La Versión 6 (1976) fue la primera disponible fuera de Bell Labs, y la Versión 7 (1978) es la antecesora de los UNIX modernos. En paralelo surgió BSD en la Universidad de California en Berkeley. En 1982 AT&T unificó sus variantes en System III y después en System V.',
    ),
    ParagraphBlock(
      'Los UNIX tradicionales (SVR3, 4.3BSD) se diseñaron para un solo procesador. No protegían sus estructuras del acceso concurrente, soportaban un solo sistema de archivos y una sola política de planificación, y su núcleo era grande y poco modular. Para unificar las innovaciones dispersas, AT&T y Sun desarrollaron System V Release 4 (SVR4). Combinó SVR3, 4.3BSD, Xenix y SunOS, y aportó tiempo real, clases de planificación, memoria virtual, sistema de archivos virtual y puntos de expulsión en el núcleo.',
    ),
    ParagraphBlock(
      'Solaris es la versión UNIX de Sun basada en SVR4. Añade un núcleo multihilo, completamente expulsivo, con soporte completo de SMP y una interfaz orientada a objetos para los sistemas de archivos.',
    ),
    ImageBlock(
      'assets/images/logo_solaris.png',
      caption: 'Logotipo de Solaris.',
    ),
  ],
);