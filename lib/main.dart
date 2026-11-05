import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/queue_provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => QueueProvider(),
      child: const SmartQueueApp(),
    ),
  );
}

class SmartQueueApp extends StatelessWidget {
  const SmartQueueApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SmartQueue',
      theme: ThemeData(primarySwatch: Colors.indigo, useMaterial3: true),
      home: const HomeScreen(),
    );
  }
}