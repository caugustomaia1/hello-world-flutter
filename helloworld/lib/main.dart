import 'package:flutter/material.dart';
import 'dart:io' as io;
import 'package:helloworld/app_form.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:helloworld/l10n/generated/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'),
        Locale('pt'),
      ],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _closeApp() {
    io.exit(0);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 212, 192, 13),
        title: Text(l10n.onboardingLoginAppBarTitle),
        actions: [TextButton(onPressed: _closeApp, child: Text("X"))],
      ),
      body: Padding(padding: const EdgeInsets.all(16.0), child: AppForm()),
    );
  }
}
