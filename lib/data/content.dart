import '../models/topic.dart';
import 'inicio.dart';
import 'introduccion.dart';
import 'fundamental_1.dart';
import 'fundamental_2.dart';
import 'fundamental_3.dart';
import 'fundamental_4.dart';
import 'historia.dart';
import 'conclusion.dart';
import 'referencias.dart';

const _pending = [ParagraphBlock('Contenido pendiente.')];

const List<Topic> appTopics = [
  inicioTopic,
  introduccionTopic,
  historiaTopic,
  fundamental1Topic,
  fundamental2Topic,
  fundamental3Topic,
  fundamental4Topic,
  Topic(id: 'pdf-1', title: 'Actividad Fundamental 1', pdfAsset: 'assets/pdfs/af_1.pdf'),
  Topic(id: 'pdf-2', title: 'Actividad Fundamental 2', pdfAsset: 'assets/pdfs/af_2.pdf'),
  Topic(id: 'pdf-3', title: 'Actividad Fundamental 3', pdfAsset: 'assets/pdfs/af_3.pdf'),
  Topic(id: 'pdf-4', title: 'Actividad Fundamental 4', pdfAsset: 'assets/pdfs/af_4.pdf'),
  conclusionTopic,
  Topic(id: 'conclusiones', title: 'Conclusiones', blocks: _pending),
  referenciasTopic,
];