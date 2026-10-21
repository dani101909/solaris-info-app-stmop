import '../models/topic.dart';

const quizF1 = <QuizQuestion>[
  QuizQuestion(
    text:
        '¿Qué hilo de Solaris es invisible para el núcleo y lo maneja una biblioteca de hilos?',
    options: [
      'Proceso ligero (LWP)',
      'Hilo de usuario (ULT)',
      'Hilo de núcleo',
      'Proceso',
    ],
    correctIndex: 1,
    explanation:
        'Los hilos de usuario (ULT) los maneja una biblioteca, así que el núcleo no los ve.',
  ),
  QuizQuestion(
    text: '¿Cuántos hilos de núcleo hay por cada proceso ligero (LWP)?',
    options: [
      'Ninguno',
      'Varios',
      'Uno',
      'Depende del usuario',
    ],
    correctIndex: 2,
    explanation: 'Siempre hay un hilo de núcleo por cada LWP.',
  ),
  QuizQuestion(
    text: '¿Qué hilo es la unidad que se planifica en cualquier procesador?',
    options: [
      'Hilo de núcleo',
      'Hilo de usuario (ULT)',
      'Proceso ligero (LWP)',
      'Proceso zombie',
    ],
    correctIndex: 0,
    explanation:
        'El hilo de núcleo es la unidad que se planifica en cualquier procesador.',
  ),
  QuizQuestion(
    text:
        '¿Cuál NO es una decisión de diseño que mejora el rendimiento de Solaris?',
    options: [
      'Los ULT se crean sin intervención del núcleo',
      'Los hilos de núcleo sustituyen a los procesos de núcleo',
      'Las interrupciones se manejan como hilos de núcleo',
      'Las interrupciones se bloquean en todos los procesadores',
    ],
    correctIndex: 3,
    explanation:
        'Solaris no bloquea las interrupciones en todos los procesadores: las convierte en hilos de núcleo.',
  ),
  QuizQuestion(
    text: '¿Cuántos niveles de prioridad usa la planificación de Solaris?',
    options: [
      '10',
      '64',
      '160',
      '255',
    ],
    correctIndex: 2,
    explanation:
        'Son 160 niveles de prioridad, repartidos en tres clases: tiempo real, núcleo y tiempo compartido.',
  ),
  QuizQuestion(
    text:
        '¿Qué clase de planificación tiene las prioridades más altas (159 a 100)?',
    options: [
      'Tiempo compartido',
      'Tiempo real',
      'Núcleo',
      'Zombie',
    ],
    correctIndex: 1,
    explanation: 'La clase de tiempo real usa las prioridades 159 a 100.',
  ),
  QuizQuestion(
    text: '¿De qué tipo de UNIX es Solaris?',
    options: [
      'UNIX moderno basado en SVR4',
      'UNIX tradicional de un solo procesador',
      'Una variante de Linux',
      'Un UNIX sin soporte de hilos',
    ],
    correctIndex: 0,
    explanation:
        'Solaris es la versión UNIX de Sun basada en SVR4, de la generación de UNIX modernos.',
  ),
  QuizQuestion(
    text: '¿Qué añade Solaris a SVR4 en cuanto a procesadores?',
    options: [
      'Solo un procesador',
      'Un núcleo no expulsivo',
      'Una sola política de planificación',
      'Soporte completo de SMP',
    ],
    correctIndex: 3,
    explanation: 'SVR4 no tenía soporte completo de SMP, y Solaris lo añade.',
  ),
];