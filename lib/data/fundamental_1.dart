import '../models/topic.dart';

const fundamental1Topic = Topic(
  id: 'fundamental-1',
  title: 'Fundamental 1',
  subtitle: 'Arquitectura, desempeño y tipos de un sistema operativo',
  subtopics: [
    Topic(
      id: 'f1-arquitectura',
      title: 'Arquitectura de Solaris',
      blocks: [
        ParagraphBlock(
          'Solaris tiene un modelo de hilos multinivel con cuatro entidades:',
        ),
        BulletListBlock([
          BulletItem(
            'un proceso UNIX normal, con espacio de direcciones, pila y bloque de control.',
            label: 'Proceso:',
          ),
          BulletItem(
            'lo gestiona una biblioteca de hilos y es invisible al núcleo.',
            label: 'Hilo de nivel de usuario (ULT):',
          ),
          BulletItem(
            'enlaza ULT con hilos de núcleo. Cada LWP soporta uno o más ULT y se asocia a un hilo de núcleo.',
            label: 'Proceso ligero (LWP):',
          ),
          BulletItem(
            'la unidad que se planifica en cualquier procesador.',
            label: 'Hilo de núcleo:',
          ),
        ]),
        ImageBlock(
          'assets/images/AF1_img.png',
          caption:
              'Modelo de hilos multinivel de Solaris: hilos de usuario, procesos ligeros (LWP) e hilos de núcleo.',
        ),
        ParagraphBlock(
          'Siempre hay un hilo de núcleo por cada LWP. Además, el núcleo usa hilos propios, sin LWP, para funciones del sistema, y esto reduce la sobrecarga de los cambios de contexto. Una aplicación puede usar un ULT por LWP (como un proceso UNIX clásico), varios ULT sobre un LWP, varios ULT sobre varios LWP, ULT vinculados permanentemente a LWP, o una mezcla de estas.',
        ),
        ParagraphBlock(
          'La estructura de proceso conserva los elementos clásicos de UNIX: IDs, tabla de señales, descriptores de archivos y mapa de memoria. Cambia que el estado del procesador se sustituye por una lista de bloques, uno por LWP. Cada bloque guarda identificador, prioridad, máscara de señales, registros, pila del núcleo y datos de uso de recursos.',
        ),
      ],
    ),
    Topic(
      id: 'f1-desempeno',
      title: 'Desempeño de Solaris',
      blocks: [
        ParagraphBlock(
          'El rendimiento de Solaris descansa en tres decisiones de diseño:',
        ),
        BulletListBlock([
          BulletItem(
            'Los ULT se crean, bloquean y activan sin intervención del núcleo, por lo que son más eficientes que los hilos de núcleo.',
          ),
          BulletItem(
            'Los hilos de núcleo sustituyen a los procesos de núcleo, y eso abarata los intercambios.',
          ),
          BulletItem(
            'Las interrupciones se manejan como hilos de núcleo, y las pruebas con este enfoque mostraron un rendimiento superior al de las estrategias tradicionales de manejo de interrupciones.',
          ),
        ]),
        ParagraphBlock(
          'La planificación, heredada de SVR4, usa 160 niveles de prioridad en tres clases: tiempo real (159-100), núcleo (99-60) y tiempo compartido (59-0). En tiempo compartido, el cuanto va de 100 ms (prioridad 0) a 10 ms (prioridad 59).',
        ),
      ],
    ),
    Topic(
      id: 'f1-clasificacion',
      title: 'Clasificación de Solaris e importancia',
      blocks: [
        ParagraphBlock(
          'Solaris es la versión UNIX de Sun basada en SVR4. Pertenece a la generación de UNIX modernos, que corrigió las limitaciones de los UNIX tradicionales: un solo procesador, un solo sistema de archivos, una sola política de planificación y un núcleo grande y poco modular.',
        ),
        BulletListBlock([
          BulletItem(
            'UNIX moderno, derivado de SVR4.',
            label: 'Por su origen:',
          ),
          BulletItem(
            'multiusuario y multitarea. Da servicio a varios usuarios al mismo tiempo.',
            label: 'Por número de usuarios:',
          ),
          BulletItem(
            'sistema operativo de servidor. Atiende solicitudes a través de una red y permite compartir recursos de hardware y software, como impresión, archivos y páginas web.',
            label: 'Por su categoría:',
          ),
          BulletItem(
            'multihilo, completamente expulsivo y con soporte completo de multiprocesamiento simétrico (SMP).',
            label: 'Por su núcleo:',
          ),
          BulletItem(
            'incluye una clase de tiempo real, con las prioridades más altas del sistema (159 a 100).',
            label: 'Por su planificación:',
          ),
        ]),
        ParagraphBlock(
          'Su importancia radica en que es la implementación UNIX más utilizada y exitosa comercialmente. Además, es el principal ejemplo del modelo de hilos combinado entre nivel de usuario y de núcleo, y un referente de cómo un UNIX moderno aprovecha varios procesadores.',
        ),
      ],
    ),
    Topic(
      id: 'f1-recursos',
      title: 'Función y características en el manejo de recursos',
      blocks: [
        ParagraphBlock(
          'El sistema operativo actúa como administrador de recursos: ordena, controla y distribuye la CPU, la memoria y los dispositivos de entrada y salida entre los programas que compiten por ellos, buscando usarlos de forma eficiente. Solaris administra cada recurso de la siguiente manera:',
        ),
        BulletListBlock([
          BulletItem(
            'usa un modelo de hilos multinivel (hilos de usuario, procesos ligeros e hilos de núcleo) y soporta SMP, donde cada procesador planifica sus propios procesos e hilos. Las interrupciones se convierten en hilos de núcleo con la mayor prioridad, por lo que no hace falta bloquear las interrupciones en todos los procesadores.',
            label: 'Procesador:',
          ),
          BulletItem(
            'reparte 160 niveles de prioridad en tres clases (tiempo real, núcleo y tiempo compartido), con colas de turno circular y puntos de expulsión seguros en el núcleo.',
            label: 'Planificación:',
          ),
          BulletItem(
            'ofrece mutex, semáforos con contador, cerrojos de lectura/escritura y variables de condición, tanto en el núcleo como en la biblioteca de hilos.',
            label: 'Sincronización:',
          ),
          BulletItem(
            'usa memoria virtual paginada bajo demanda. El proceso pageout, un reloj de dos manecillas, libera páginas cuando la memoria libre baja del umbral lotsfree. Para los objetos pequeños del núcleo usa un asignador propio, el buddy perezoso.',
            label: 'Memoria:',
          ),
          BulletItem(
            'organiza los archivos con nodos-i y ofrece una interfaz de nodo virtual (vnode/VFS), que permite que convivan varios sistemas de archivos.',
            label: 'Archivos:',
          ),
        ]),
      ],
    ),
    Topic(
      id: 'f1-comparativo',
      title: 'Cuadro comparativo',
      blocks: [
        TableBlock(
          headers: [
            'Criterio',
            'UNIX tradicional (SVR3, 4.3BSD)',
            'SVR4',
            'Solaris',
            'Linux',
          ],
          rows: [
            [
              'Origen',
              'Línea UNIX de Bell Labs y Berkeley',
              'Desarrollado por AT&T y Sun; combina SVR3, 4.3BSD, Xenix y SunOS',
              'Versión UNIX de Sun basada en SVR4',
              'Variante UNIX de 1991 creada por Linus Torvalds',
            ],
            [
              'Procesadores',
              'Un solo procesador',
              'Sin soporte completo de SMP, que Solaris añade',
              'Soporte completo de SMP',
              'Soporte de SMP: cualquier hilo, incluso del núcleo, se planifica en cualquier procesador',
            ],
            [
              'Núcleo',
              'Grande, poco modular y no expulsivo en modo núcleo',
              'Modular, con puntos de expulsión',
              'Multihilo y completamente expulsivo',
              'Modular y configurable',
            ],
            [
              'Sistema de archivos',
              'Uno solo',
              'Sistema de archivos virtual',
              'Interfaz orientada a objetos (vnode/VFS), con varios sistemas de archivos',
              'Sistema de archivos virtual (VFS), orientado a objetos, que admite múltiples formatos de disco o de red',
            ],
            [
              'Planificación',
              'Una sola política',
              'Tiempo real y clases de planificación',
              'Heredada de SVR4: 160 prioridades en tres clases',
              'Información de planificación en cada tarea (task_struct), con prioridad, para procesos normales y de tiempo real',
            ],
            [
              'Hilos',
              'Un solo hilo por proceso',
              'Núcleo sin soporte multihilo, que Solaris añade',
              'Hilos ULT/LWP/núcleo, interrupciones como hilos y cuatro primitivas de sincronización',
              'Cada proceso se representa con una estructura task_struct',
            ],
            [
              'Licencia y distribución',
              'Licenciado a empresas y universidades',
              'Unificó las variantes anteriores y es la base de Solaris',
              'Implementación comercial de UNIX, la más utilizada y exitosa',
              'Código abierto y gratuito (GPL)',
            ],
          ],
        ),
      ],
    ),
  ],
);