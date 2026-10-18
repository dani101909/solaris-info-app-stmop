import '../models/topic.dart';

const fundamental4Topic = Topic(
  id: 'fundamental-4',
  title: 'Fundamental 4',
  subtitle: 'Redes, seguridad y sistemas distribuidos',
  subtopics: [
    Topic(
      id: 'f4-distribuido',
      title: '¿Solaris es un sistema distribuido?',
      blocks: [
        ParagraphBlock(
          'Solaris estándar no es un sistema operativo distribuido. La extensión que sí lo es se llama Sun Cluster (Solaris MC): un sistema operativo distribuido construido como un conjunto de extensiones del sistema UNIX Solaris. Ofrece una imagen única, de modo que el cluster se ve como una sola computadora Solaris.',
        ),
        ImageBlock(
          'assets/images/AF4_img.png',
          caption:
              'Arquitectura de un cluster de dos nodos con interconexión privada, discos compartidos y red pública.',
        ),
        BulletListBlock([
          BulletItem(
            'modelo de objetos CORBA/IDL en C++, sobre el núcleo de Solaris casi sin cambios.',
            label: 'Objetos y comunicaciones:',
          ),
          BulletItem(
            'ID único en el cluster y localización transparente. Pueden migrar de nodo, pero todos los hilos de un proceso deben estar en el mismo nodo.',
            label: 'Procesos:',
          ),
          BulletItem(
            'filtro de paquetes. El cluster aparece con una sola IP y balancea las conexiones entrantes entre los nodos.',
            label: 'Redes:',
          ),
          BulletItem(
            'basado en nodo virtual (vnode/VFS) con una capa proxy y caché. Todos los nodos usan la misma ruta para un archivo.',
            label: 'Sistema de archivos global:',
          ),
        ]),
      ],
    ),
    Topic(
      id: 'f4-seguridad',
      title: 'Nivel de seguridad de Solaris',
      blocks: [
        BulletListBlock([
          BulletItem(
            'capa opcional de Oracle Solaris con tecnología de etiquetado seguro. Admite el control de acceso discrecional (DAC) y el control de acceso obligatorio (MAC) basado en etiquetas. Con MAC activo, los flujos de datos se limitan comparando las etiquetas de los procesos que piden acceso con las de los objetos que contienen los datos.',
            label: 'Trusted Extensions:',
          ),
          BulletItem(
            'Oracle Solaris 11 está certificado según el esquema de criterios comunes de Canadá con el nivel de confianza en la evaluación 4 ampliado con corrección de errores (EAL4+). EAL4 es el nivel más alto de evaluación mutuamente reconocido por 26 países según el acuerdo de reconocimiento de criterios comunes (CCRA).',
            label: 'Common Criteria:',
          ),
          BulletItem(
            'la certificación es para el perfil de protección de sistema operativo (OSPP) e incluye los paquetes extendidos de gestión avanzada, identificación y autenticación extendidas, seguridad con etiquetas y virtualización. Trusted Extensions forma parte de ella y cumple el paquete de seguridad con etiquetas.',
            label: 'Perfil de protección:',
          ),
        ]),
      ],
    ),
    Topic(
      id: 'f4-vulnerabilidades',
      title: 'Vulnerabilidades de Solaris',
      blocks: [
        ParagraphBlock(
          'Las vulnerabilidades conocidas se registran con un identificador CVE y se califican con el sistema CVSS, una escala de 0 a 10 que mide su gravedad. Dos casos de Solaris afectan al mecanismo de autenticación, que es la primera barrera del sistema.',
        ),
        HeadingBlock('CVE-2007-0882: omisión de autenticación en telnet'),
        ParagraphBlock(
          'Es una vulnerabilidad de inyección de argumentos en el demonio telnet (in.telnetd). El demonio interpreta mal ciertas secuencias «-f» enviadas por el cliente y las toma como una petición para que el programa login omita la autenticación. Con ello, un atacante remoto inicia sesión en ciertas cuentas, como «bin», sin conocer su contraseña.',
        ),
        BulletListBlock([
          BulletItem(
            'Solaris 10 y 11 (SunOS 5.10 y 5.11).',
            label: 'Versiones afectadas:',
          ),
          BulletItem(
            '12 de febrero de 2007.',
            label: 'Publicación:',
          ),
          BulletItem(
            '10.0 en CVSS 2.0, clasificada como alta.',
            label: 'Gravedad:',
          ),
          BulletItem(
            'se explota desde la red, con complejidad baja y sin autenticación previa. El impacto sobre la confidencialidad, la integridad y la disponibilidad es completo.',
            label: 'Características del ataque:',
          ),
        ]),
        HeadingBlock('CVE-2020-14871: desbordamiento en el módulo PAM'),
        ParagraphBlock(
          'Afecta al módulo de autenticación PAM (Pluggable Authentication Module) y corresponde a una escritura fuera de límites (CWE-787): el programa escribe datos fuera del espacio de memoria reservado. Un atacante sin autenticar y con acceso a la red puede aprovecharla de forma sencilla y tomar el control del sistema. Existen exploits públicos para esta falla.',
        ),
        BulletListBlock([
          BulletItem(
            'Solaris 10 hasta antes de la 11.1. No es explotable en Solaris 11.1 y posteriores.',
            label: 'Versiones afectadas:',
          ),
          BulletItem(
            '21 de octubre de 2020.',
            label: 'Publicación:',
          ),
          BulletItem(
            '10.0 en CVSS 3.1, clasificada como crítica.',
            label: 'Gravedad:',
          ),
          BulletItem(
            'se explota desde la red, con complejidad baja, sin privilegios y sin interacción del usuario. El alcance es modificado, es decir, el daño llega más allá del componente vulnerable, y el impacto sobre la confidencialidad, la integridad y la disponibilidad es alto.',
            label: 'Características del ataque:',
          ),
        ]),
        ParagraphBlock(
          'Ambos casos permiten entrar al sistema sin credenciales válidas, lo que muestra la importancia de aplicar los parches del fabricante y de deshabilitar servicios innecesarios, como telnet.',
        ),
      ],
    ),
  ],
);