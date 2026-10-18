import '../models/topic.dart';

const conclusionTopic = Topic(
  id: 'conclusion',
  title: 'Conclusión',
  blocks: [
    ParagraphBlock(
      'En conclusión, Solaris se consolida como un sistema operativo robusto y representativo de los sistemas UNIX modernos. Su diseño superó las limitaciones de los sistemas tradicionales al incorporar un núcleo multihilo, completamente expulsivo y con soporte íntegro para multiprocesamiento simétrico (SMP), y es reconocido como la implementación comercial de UNIX más utilizada y exitosa.',
    ),
    ParagraphBlock(
      'La arquitectura del sistema destaca por su modelo de hilos multinivel, el cual combina hilos a nivel de usuario, procesos ligeros (LWP) e hilos de núcleo para optimizar el paralelismo, el desempeño y reducir la sobrecarga del sistema. Además, su gestión de recursos es altamente eficiente gracias al uso de memoria virtual paginada, un asignador de memoria del núcleo especializado (basado en el sistema buddy perezoso) y una interfaz de nodo virtual que permite la convivencia de múltiples sistemas de archivos.',
    ),
    ParagraphBlock(
      'Solaris también demuestra una gran capacidad de adaptación al extenderse hacia entornos distribuidos mediante extensiones como Sun Cluster, que permiten que un conjunto de nodos se visualice y opere como una imagen única. Finalmente, en el ámbito de la seguridad, Oracle Solaris 11, junto con Trusted Extensions, forma parte de una certificación Common Criteria de nivel EAL4+. A pesar de su solidez, los dos casos documentados de vulnerabilidades en mecanismos de autenticación ilustran la importancia de aplicar parches y deshabilitar servicios innecesarios.',
    ),
  ],
);