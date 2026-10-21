import '../models/topic.dart';

const quizF2 = <QuizQuestion>[
  QuizQuestion(
    text: '¿Qué es un proceso?',
    options: [
      'Una sola instrucción del programa',
      'Un programa en ejecución con su estado y recursos',
      'Un tipo de memoria',
      'Un hilo de núcleo',
    ],
    correctIndex: 1,
    explanation:
        'Un proceso es un programa en ejecución, junto con su estado y los recursos que necesita.',
  ),
  QuizQuestion(
    text: '¿Qué comparten los hilos de un mismo proceso?',
    options: [
      'La pila',
      'El contador de programa',
      'Los registros',
      'El espacio de direcciones y los recursos',
    ],
    correctIndex: 3,
    explanation:
        'Cada hilo tiene su propia pila, registros y contador de programa. Comparten el espacio de direcciones y los recursos.',
  ),
  QuizQuestion(
    text: '¿Cómo actúa el proceso ligero (LWP) sobre los hilos de usuario?',
    options: [
      'Como un procesador virtual',
      'Como un disco',
      'Como una interrupción',
      'Como un semáforo',
    ],
    correctIndex: 0,
    explanation:
        'El LWP actúa como un procesador virtual sobre el que se multiplexan los hilos de usuario.',
  ),
  QuizQuestion(
    text: '¿Cuál de estos NO es un estado de un proceso?',
    options: [
      'Listo en memoria',
      'Dormido en swap',
      'Zombie',
      'Ejecutando en swap',
    ],
    correctIndex: 3,
    explanation:
        'Existen "listo en swap" y "dormido en swap", pero no "ejecutando en swap".',
  ),
  QuizQuestion(
    text: '¿Con qué función se crean los procesos?',
    options: [
      'fork()',
      'thr_yield()',
      'init()',
      'swap()',
    ],
    correctIndex: 0,
    explanation: 'Los procesos se crean con fork().',
  ),
  QuizQuestion(
    text: '¿Qué valor devuelve fork() al proceso hijo?',
    options: [
      'El ID del padre',
      'El ID del hijo',
      '0',
      '-1',
    ],
    correctIndex: 2,
    explanation: 'fork() devuelve el ID del hijo al padre y un 0 al hijo.',
  ),
  QuizQuestion(
    text: '¿Qué permiten los cerrojos de lectura/escritura?',
    options: [
      'Un solo lector y varios escritores',
      'Varios lectores a la vez o un único escritor',
      'Solo un hilo a la vez',
      'Esperar un tiempo fijo',
    ],
    correctIndex: 1,
    explanation: 'Permiten varios lectores a la vez o un único escritor.',
  ),
  QuizQuestion(
    text: '¿Qué problema evita el SMP frente a la arquitectura maestro/esclavo?',
    options: [
      'Que haya varios procesadores',
      'Que se use memoria compartida',
      'Que se planifiquen hilos',
      'El cuello de botella y el punto único de fallo',
    ],
    correctIndex: 3,
    explanation:
        'En el SMP cualquier procesador puede ejecutar el núcleo, lo que elimina el cuello de botella y el punto único de fallo.',
  ),
];