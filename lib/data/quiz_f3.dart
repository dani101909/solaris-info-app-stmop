import '../models/topic.dart';

const quizF3 = <QuizQuestion>[
  QuizQuestion(
    text: '¿Qué tipo de memoria usa Solaris?',
    options: [
      'Memoria sin paginación',
      'Memoria solo física',
      'Memoria en cinta',
      'Memoria virtual paginada',
    ],
    correctIndex: 3,
    explanation: 'Solaris usa memoria virtual paginada.',
  ),
  QuizQuestion(
    text: '¿Para qué sirve copy on write?',
    options: [
      'Para borrar páginas',
      'Para retrasar la copia de una página compartida hasta que alguien escribe en ella',
      'Para guardar páginas en disco',
      'Para bloquear una página',
    ],
    correctIndex: 1,
    explanation:
        'Copy on write evita duplicar memoria sin necesidad: la copia se hace solo cuando un proceso escribe.',
  ),
  QuizQuestion(
    text: '¿Qué algoritmo de reemplazo de páginas usa Solaris?',
    options: [
      'Reloj de dos manecillas',
      'Primero en llegar, primero en salir',
      'Aleatorio',
      'Buddy perezoso',
    ],
    correctIndex: 0,
    explanation:
        'Usa un reloj de dos manecillas. El buddy perezoso es el asignador del núcleo, no el reemplazo de páginas.',
  ),
  QuizQuestion(
    text: '¿Qué asignador usa Solaris para los objetos pequeños del núcleo?',
    options: [
      'Reloj de dos manecillas',
      'First-fit',
      'Buddy perezoso',
      'Fast File System',
    ],
    correctIndex: 2,
    explanation:
        'Usa el buddy perezoso, que pospone la reagrupación de bloques libres.',
  ),
  QuizQuestion(
    text:
        '¿Qué requisito de la memoria evita que un proceso lea la memoria de otro sin permiso?',
    options: [
      'Reubicación',
      'Protección',
      'Compartición',
      'Organización física',
    ],
    correctIndex: 1,
    explanation:
        'Es la protección: ningún proceso debe leer ni escribir en la memoria de otro sin permiso.',
  ),
  QuizQuestion(
    text:
        '¿Cuál es el tipo de fragmentación que ocurre dentro de una página o partición?',
    options: [
      'Externa',
      'Lógica',
      'Virtual',
      'Interna',
    ],
    correctIndex: 3,
    explanation:
        'La fragmentación interna es el espacio desperdiciado dentro de una partición o página.',
  ),
  QuizQuestion(
    text: '¿Qué estrategia de ubicación deja muchos huecos pequeños?',
    options: [
      'First-fit',
      'Next-fit',
      'Best-fit',
      'Ninguna',
    ],
    correctIndex: 2,
    explanation: 'Best-fit deja muchos huecos pequeños difíciles de reutilizar.',
  ),
  QuizQuestion(
    text: '¿Qué estructura de los archivos separa los metadatos del nombre?',
    options: [
      'Nodo-i (inode)',
      'Grupo de cilindros',
      'Tabla de swap',
      'Hilo de núcleo',
    ],
    correctIndex: 0,
    explanation:
        'Los nodos-i separan el control y los metadatos del archivo de su nombre.',
  ),
];