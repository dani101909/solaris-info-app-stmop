import '../models/topic.dart';
import 'quiz_f2.dart';

const fundamental2Topic = Topic(
  id: 'fundamental-2',
  title: 'Fundamental 2',
  subtitle: 'Multitarea y control de concurrencia',
  subtopics: [
    Topic(
      id: 'f2-procesos-hilos',
      title: 'Procesos e hilos en Solaris',
      blocks: [
        ParagraphBlock(
          'Un proceso es un programa en ejecución. No es solo el código, sino también su estado y los recursos que necesita: procesador, memoria, archivos y dispositivos de entrada y salida. Un hilo es una unidad de ejecución que vive dentro de un proceso. Cada hilo tiene su propio contador de programa, sus registros y su pila, y comparte con los demás hilos del proceso el espacio de direcciones y los recursos.',
        ),
        ParagraphBlock(
          'El proceso aporta el entorno y los recursos, y los hilos son los flujos de ejecución que ocurren dentro de él. Esta separación permite que una aplicación realice varias actividades al mismo tiempo y, en equipos con varios procesadores, que se ejecuten en paralelo de verdad. A cambio, el sistema y las aplicaciones deben controlar bien el acceso a los recursos compartidos.',
        ),
        ParagraphBlock(
          'Solaris organiza esta idea en cuatro entidades: el proceso, los hilos de nivel de usuario (ULT), los procesos ligeros (LWP) y los hilos de núcleo. Como el núcleo no interviene en la gestión de los ULT, crearlos y eliminarlos es rápido. El LWP actúa como un procesador virtual sobre el que se multiplexan los ULT, y cada LWP está enlazado a un hilo de núcleo, que es la entidad que el sistema reconoce, planifica y despacha en el hardware. Así, el programador puede crear muchos ULT sin sobrecargar el equipo, porque el núcleo solo administra los hilos de núcleo activos.',
        ),
        ParagraphBlock(
          'La aplicación elige cuántos LWP asigna a sus ULT, y con eso define su grado de paralelismo. Pocos ULT sobre un LWP son eficientes para lógica concurrente sin paralelismo real, como una interfaz con varias ventanas. Varios LWP permiten que, si un hilo se bloquea en E/S, los demás sigan ejecutando. Un ULT por LWP es ideal para cálculo paralelo, y la mezcla sirve en tiempo real. Un hilo no vinculado puede estar ejecutable, activo, durmiendo o detenido, y solo tiene LWP asignado cuando está activo.',
        ),
      ],
    ),
    Topic(
      id: 'f2-control-procesos',
      title: 'Control y gestión de procesos',
      blocks: [
        ParagraphBlock(
          'Solaris hereda la gestión de procesos de UNIX SVR4. Existen dos modos de ejecución (usuario y núcleo) y dos tipos de proceso (de sistema y de usuario). Cada proceso pasa por nueve estados:',
        ),
        BulletListBlock([
          BulletItem('ejecutando en usuario'),
          BulletItem('ejecutando en núcleo'),
          BulletItem('listo en memoria'),
          BulletItem('dormido en memoria'),
          BulletItem('listo en swap'),
          BulletItem('dormido en swap'),
          BulletItem('expulsado'),
          BulletItem('creado'),
          BulletItem('zombie'),
        ]),
        ParagraphBlock(
          'La expulsión solo ocurre al volver de modo núcleo a modo usuario. El proceso 0 es el swapper y lanza el proceso 1 (init), antecesor de todos los demás. La imagen de proceso tiene tres contextos: de usuario (texto, datos, pila, memoria compartida), de registros y de sistema (tabla de procesos, área U, tabla de regiones y pila del núcleo). Los procesos se crean con fork(). El núcleo reserva una entrada en la tabla de procesos, asigna un ID único y copia la imagen del padre, salvo las regiones compartidas. Después marca al hijo como listo y devuelve su ID al padre y un 0 al hijo.',
        ),
      ],
    ),
    Topic(
      id: 'f2-gestion-hilos',
      title: 'Gestión de hilos en Solaris',
      blocks: [
        ParagraphBlock(
          'Un ULT activo puede abandonar su LWP por cuatro causas: sincronización, suspensión, expulsión por un hilo de mayor prioridad, o cesión voluntaria con thr_yield(). Cuando esto ocurre, la biblioteca de hilos asigna el LWP libre a otro hilo ejecutable.',
        ),
        ParagraphBlock(
          'Las interrupciones se convierten en hilos de núcleo. Bloquear interrupciones para proteger datos compartidos es costoso, sobre todo en multiprocesadores. Por eso cada interrupción corre en un hilo propio, con identificador, prioridad, contexto y pila, y la máxima prioridad entre los hilos de núcleo. El hilo interrumpido queda inmovilizado y conserva su contexto. El hilo de interrupción se sincroniza con las mismas primitivas de exclusión mutua que el resto del núcleo.',
        ),
        ParagraphBlock(
          'Para sincronizar hilos, Solaris ofrece cuatro mecanismos, disponibles en el núcleo y en la biblioteca de hilos:',
        ),
        BulletListBlock([
          BulletItem(
            'solo un hilo accede al recurso, y quien lo adquiere es quien lo libera. Por defecto espera de forma activa (cerrojo cíclico), con una opción de espera bloqueante.',
            label: 'Mutex:',
          ),
          BulletItem(
            'decrementan y bloquean, o incrementan y despiertan.',
            label: 'Semáforos con contador:',
          ),
          BulletItem(
            'permiten varios lectores a la vez o un único escritor.',
            label: 'Cerrojos de lectura/escritura:',
          ),
          BulletItem(
            'esperan una condición, siempre junto a un mutex.',
            label: 'Variables de condición:',
          ),
        ]),
        ParagraphBlock(
          'Ni el núcleo ni la biblioteca imponen su uso. El programador es responsable de proteger los datos y de evitar interbloqueos.',
        ),
      ],
    ),
    Topic(
      id: 'f2-smp',
      title: 'Multiprocesamiento simétrico (SMP)',
      blocks: [
        ParagraphBlock(
          'En un SMP, varios procesadores comparten memoria principal y E/S. El núcleo puede ejecutar en cualquiera de ellos y cada procesador planifica sus propios procesos e hilos. Esto elimina el cuello de botella y el punto único de fallo de la arquitectura maestro/esclavo. A cambio, el sistema debe evitar que dos procesadores tomen el mismo proceso y debe sincronizar el acceso a los recursos.',
        ),
        ImageBlock(
          'assets/images/AF2_img.png',
          caption:
              'Sistema de multiprocesamiento simétrico (SMP): varios procesadores con caché propia comparten la memoria principal y la E/S a través del bus del sistema.',
        ),
        ParagraphBlock('Los requisitos de diseño son:'),
        BulletListBlock([
          BulletItem('rutinas de núcleo reentrantes'),
          BulletItem('planificación sin conflictos'),
          BulletItem('sincronización eficaz'),
          BulletItem('gestión de memoria coordinada'),
          BulletItem('tolerancia a fallos de procesador'),
        ]),
        ParagraphBlock(
          'Solaris cumple este modelo. Sus LWP se planifican de forma independiente y corren en paralelo en varios procesadores. Sus hilos de interrupción y sus primitivas de sincronización están diseñados para ese entorno.',
        ),
      ],
    ),
    Topic(
      id: 'f2-examen',
      title: 'Examen de repaso',
      quiz: quizF2,
    ),
  ],
);