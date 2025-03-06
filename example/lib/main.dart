import 'package:flutter/material.dart';
import 'package:screen_lock_checker/screen_lock_checker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool? _screenLockEnabled;
  bool _initialized = false;
  final _screenLockCheckerPlugin = ScreenLockChecker();

  @override
  void initState() {
    super.initState();
    _screenLockCheckerPlugin.isScreenLockEnabled().then((result) {
      if (mounted) {
        setState(() {
          _initialized = true;
          _screenLockEnabled = result;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('ScreenLockChecker example app'),
        ),
        body: Center(
            child: _initialized
                ? Text('Screen lock enabled: $_screenLockEnabled\n')
                : const CircularProgressIndicator()),
      ),
    );
  }
}
