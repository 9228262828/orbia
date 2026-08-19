import 'dart:async';

import 'package:flutter/material.dart';

import '../services/moment_service.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  final MomentService service;

  const SplashScreen({super.key, required this.service});

  @override
  State<SplashScreen> createState() => _S();
}

class _S extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    go();
  }

  Future<void> go() async {
    final start = DateTime.now();
    while (!widget.service.loaded) {
      await Future.delayed(const Duration(milliseconds: 70));
      if (!mounted) return;
    }
    final e = DateTime.now().difference(start);
    if (e < const Duration(milliseconds: 1200))
      await Future.delayed(const Duration(milliseconds: 1200) - e);
    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => HomeScreen(service: widget.service),
        transitionsBuilder: (_, a, __, c) =>
            FadeTransition(opacity: a, child: c),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 112,
            height: 112,
            decoration: BoxDecoration(
              color: const Color(0xFF1D2945),
              borderRadius: BorderRadius.circular(56),
            ),
            child: const Icon(
              Icons.open_with_rounded,
              color: Color(0xFFF27761),
              size: 58,
            ),
          ),
          const SizedBox(height: 22),
          const Text(
            'Orbia',
            style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.w900,
              letterSpacing: -1.8,
              color: Color(0xFF1D2945),
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            'Make every day worth the wait.',
            style: TextStyle(
              color: Color(0xFF77736F),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    ),
  );
}
