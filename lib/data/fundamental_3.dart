import '../models/topic.dart';

const fundamental3Topic = Topic(
  id: 'fundamental-3',
  title: 'Fundamental 3',
  subtitle: 'Almacenaje, memoria y archivos',
  subtopics: [
    Topic(
      id: 'f3-memoria',
      title: 'Gestión de memoria en Solaris',
      blocks: [
        ParagraphBlock(
          'Solaris usa memoria virtual paginada y tiene dos esquemas de memoria separados: el sistema de paginación, para los procesos de usuario y los buffers de disco, y el asignador de memoria del núcleo, porque la paginación es poco apropiada para los objetos pequeños del núcleo.',
        ),
        ImageBlock(
          'assets/images/AF3_img.png',
          caption:
              'Memoria virtual: el mapa de memoria relaciona las páginas virtuales con la memoria física y el disco.',
        ),
        BulletListBlock([
          BulletItem(
            'tabla de páginas (por proceso), descriptor de bloques de disco (copia de la página en disco), tabla de marcos de página (usada por el reemplazo) y tabla de uso de swap (una por dispositivo de intercambio).',
            label: 'Estructuras de datos:',
          ),
          BulletItem(
            'edad, referenciada, modificada, válida, protegida y copy on write, que retrasa la copia de una página compartida hasta que un proceso escribe en ella.',
            label: 'Campos de página:',
          ),
          BulletItem(
            'reloj de dos manecillas. La delantera pone el bit de referencia en 0 y la trasera pasa después: si el bit sigue en 0, la página va a la lista de expulsables. La tasa de recorrido va de slowscan a fastscan según la memoria libre esté entre lotsfree y minfree, y también se ajusta la separación entre manecillas. Con poca memoria libre, las manecillas giran más rápido.',
            label: 'Reemplazo de páginas:',
          ),
          BulletItem(
            'variante del sistema buddy llamada buddy perezoso (adoptada por SVR4), que pospone la reagrupación de bloques libres hasta que sea necesaria para reducir el costo de dividir y reagrupar.',
            label: 'Asignador del núcleo:',
          ),
        ]),
      ],
    ),
    Topic(
      id: 'f3-importancia',
      title: 'Importancia de la administración de la memoria',
      blocks: [
        ParagraphBlock(
          'En multiprogramación, la memoria principal se comparte entre varios procesos. Si hay pocos procesos en memoria, es probable que todos esperen operaciones de entrada y salida y que el procesador quede ocioso. Por eso, el sistema operativo debe controlar de forma ordenada la asignación de la memoria para mantener varios procesos activos y aprovechar el procesador.',
        ),
        ParagraphBlock(
          'La gestión de memoria debe cumplir cinco requisitos:',
        ),
        BulletListBlock([
          BulletItem(
            'un proceso puede salir a disco y volver a una zona distinta de la memoria, por lo que las referencias del programa se traducen a direcciones físicas en tiempo de ejecución.',
            label: 'Reubicación:',
          ),
          BulletItem(
            'ningún proceso debe leer ni escribir en la memoria de otro sin permiso. El procesador verifica cada referencia mientras se ejecuta la instrucción.',
            label: 'Protección:',
          ),
          BulletItem(
            'varios procesos pueden acceder a la misma zona de memoria, por ejemplo a una sola copia de un programa, sin comprometer la protección.',
            label: 'Compartición:',
          ),
          BulletItem(
            'los programas se construyen en módulos, algunos de solo lectura y otros con datos modificables, aunque la memoria sea una secuencia lineal de bytes.',
            label: 'Organización lógica:',
          ),
          BulletItem(
            'el movimiento de información entre memoria principal y secundaria lo organiza el sistema, no cada programador.',
            label: 'Organización física:',
          ),
        ]),
        ParagraphBlock(
          'La memoria virtual permite que cada proceso actúe como si tuviera memoria ilimitada y que muchos procesos compartan una memoria principal pequeña. El control de carga, es decir, cuántos procesos residen en memoria a la vez, es decisivo para el desempeño: con demasiados procesos, el sistema pasa más tiempo moviendo páginas que ejecutándolas.',
        ),
      ],
    ),
    Topic(
      id: 'f3-problemas',
      title: 'Problemas frecuentes en la administración de la memoria',
      blocks: [
        ParagraphBlock(
          'Las distintas formas de administrar la memoria generan problemas conocidos:',
        ),
        BulletListBlock([
          BulletItem(
            'espacio desperdiciado dentro de una partición o página, cuando un proceso necesita menos de lo asignado. La paginación la reduce, porque solo afecta a la última página.',
            label: 'Fragmentación interna:',
          ),
          BulletItem(
            'huecos pequeños dispersos entre procesos. Aunque la memoria libre sume lo suficiente, puede no haber un espacio continuo para un proceso nuevo. Se atiende con compactación, que es costosa, o con paginación.',
            label: 'Fragmentación externa:',
          ),
          BulletItem(
            'elegir dónde colocar cada proceso. Las estrategias first-fit, best-fit y next-fit aprovechan los huecos de distinta manera; best-fit, por ejemplo, deja muchos huecos pequeños difíciles de reutilizar.',
            label: 'Ubicación de procesos:',
          ),
          BulletItem(
            'con memoria virtual, el acceso a una página que no está en memoria produce un fallo de página y obliga a cargarla desde el almacenamiento secundario.',
            label: 'Fallos de página:',
          ),
          BulletItem(
            'con demasiados procesos y conjuntos residentes insuficientes, los fallos de página aumentan y el procesador pasa la mayor parte del tiempo trayendo y enviando páginas. Se evita controlando cuántos procesos residen en memoria según su conjunto de trabajo.',
            label: 'Trasiego (thrashing):',
          ),
        ]),
        HeadingBlock('Problemas más comunes en Solaris'),
        BulletListBlock([
          BulletItem(
            'Solaris vigila la memoria libre con los umbrales lotsfree, desfree y minfree. Cuando baja de lotsfree, se activa el proceso pageout, y sus manecillas giran más rápido mientras menos memoria libre haya, desde la tasa slowscan hasta fastscan.',
            label: 'Poca memoria libre:',
          ),
          BulletItem(
            'si la memoria libre se mantiene por debajo de desfree durante unos treinta segundos, liberar páginas ya no basta. El sistema descarga procesos completos al área de intercambio para reducir el número de procesos en memoria.',
            label: 'Trasiego y descarga de procesos:',
          ),
          BulletItem(
            'las páginas compartidas llevan el campo copy on write, que retrasa su copia hasta que un proceso escribe en ellas, y evita duplicar memoria sin necesidad.',
            label: 'Páginas compartidas:',
          ),
          BulletItem(
            'la paginación es poco apropiada para los objetos pequeños del núcleo, por lo que Solaris usa el buddy perezoso. Este pospone la reagrupación de bloques libres hasta que sea necesaria y reduce así el costo de dividir y reagrupar.',
            label: 'Objetos pequeños del núcleo:',
          ),
        ]),
      ],
    ),
    Topic(
      id: 'f3-archivos',
      title: 'Almacenamiento y sistema de archivos en Solaris',
      blocks: [
        ParagraphBlock(
          'Por su herencia de UNIX, Solaris organiza los archivos con nodos-i (inodes). Esta estructura mantiene el control y los metadatos del archivo separados de su nombre, lo que permite crear varios enlaces que apuntan a los mismos datos.',
        ),
        BulletListBlock([
          BulletItem(
            'arquitecturas clásicas como el Fast File System dividen las particiones en grupos de cilindros, lo que reduce los tiempos de búsqueda física de los cabezales en discos magnéticos.',
            label: 'Almacenamiento en disco:',
          ),
          BulletItem(
            'la interfaz de nodo virtual (vnode/VFS) permite que convivan varios sistemas de archivos en el mismo sistema.',
            label: 'Varios sistemas de archivos:',
          ),
        ]),
      ],
    ),
  ],
);