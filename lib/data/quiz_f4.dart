import '../models/topic.dart';

const quizF4 = <QuizQuestion>[
  QuizQuestion(
    text:
        '¿Cómo se llama la extensión de Solaris que es un sistema distribuido?',
    options: [
      'Sun Cluster (Solaris MC)',
      'Trusted Extensions',
      'PAM',
      'telnet',
    ],
    correctIndex: 0,
    explanation:
        'Solaris estándar no es distribuido. La extensión distribuida es Sun Cluster (Solaris MC).',
  ),
  QuizQuestion(
    text: 'En Sun Cluster, ¿dónde deben estar todos los hilos de un proceso?',
    options: [
      'En nodos distintos',
      'En cualquier nodo',
      'En el mismo nodo',
      'En el disco compartido',
    ],
    correctIndex: 2,
    explanation: 'Todos los hilos de un proceso deben estar en el mismo nodo.',
  ),
  QuizQuestion(
    text: '¿Qué es Trusted Extensions?',
    options: [
      'Un tipo de red',
      'Un virus',
      'Un sistema de archivos',
      'Una capa opcional de seguridad con etiquetas',
    ],
    correctIndex: 3,
    explanation:
        'Es una capa opcional de Oracle Solaris con etiquetado seguro, que admite control de acceso DAC y MAC.',
  ),
  QuizQuestion(
    text:
        '¿Con qué nivel de Common Criteria obtuvo certificación Oracle Solaris 11?',
    options: [
      'EAL1',
      'EAL4+',
      'EAL7',
      'No obtuvo certificación',
    ],
    correctIndex: 1,
    explanation: 'Obtuvo la certificación con el nivel EAL4+.',
  ),
  QuizQuestion(
    text: '¿Qué servicio afecta la vulnerabilidad CVE-2007-0882?',
    options: [
      'PAM',
      'El cluster',
      'telnet',
      'El sistema de archivos',
    ],
    correctIndex: 2,
    explanation:
        'Afecta al demonio telnet (in.telnetd) y permite omitir la autenticación.',
  ),
  QuizQuestion(
    text: '¿Qué módulo afecta la vulnerabilidad CVE-2020-14871?',
    options: [
      'PAM (módulo de autenticación)',
      'telnet',
      'vnode/VFS',
      'pageout',
    ],
    correctIndex: 0,
    explanation:
        'Afecta al módulo de autenticación PAM, con una escritura fuera de límites (CWE-787).',
  ),
  QuizQuestion(
    text:
        '¿Qué escala usa CVSS para medir la gravedad de una vulnerabilidad?',
    options: [
      'De 1 a 5',
      'De 0 a 100',
      'De A a F',
      'De 0 a 10',
    ],
    correctIndex: 3,
    explanation: 'CVSS es una escala de 0 a 10.',
  ),
  QuizQuestion(
    text: '¿Qué conviene hacer para protegerse de estas vulnerabilidades?',
    options: [
      'Ignorar las actualizaciones',
      'Aplicar parches y deshabilitar servicios innecesarios, como telnet',
      'Dejar telnet activo',
      'Quitar las contraseñas',
    ],
    correctIndex: 1,
    explanation:
        'Hay que aplicar los parches del fabricante y deshabilitar servicios innecesarios, como telnet.',
  ),
];