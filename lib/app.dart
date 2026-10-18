import 'package:flutter/material.dart';
import 'theme.dart';
import 'data/content.dart';
import 'models/topic.dart';
import 'screens/page_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class SolarisApp extends StatefulWidget {
  const SolarisApp({super.key});

  @override
  State<SolarisApp> createState() => _SolarisAppState();
}

class _SolarisAppState extends State<SolarisApp> {
  Topic _current = appTopics.first;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: const [Locale('es'), Locale('en')],
      title: 'Solaris',
      debugShowCheckedModeBanner: false,
            theme: buildSolarisTheme(),
      home: PageScreen(
        topic: _current,
        onSelect: (topic) => setState(() => _current = topic),
      ),
    );
  }
}