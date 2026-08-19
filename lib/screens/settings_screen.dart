import 'package:flutter/material.dart';

import '../services/moment_service.dart';

class SettingsScreen extends StatelessWidget {
  final MomentService service;

  const SettingsScreen({super.key, required this.service});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text(
        'Settings',
        style: TextStyle(fontWeight: FontWeight.w900),
      ),
    ),
    body: ListView(
      padding: const EdgeInsets.all(18),
      children: [
        Container(
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            color: const Color(0xFF1D2945),
            borderRadius: BorderRadius.circular(30),
          ),
          child: const Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Color(0xFFF27761),
                child: Icon(Icons.open_with_rounded, color: Colors.white, size: 31),
              ),
              SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Orbia',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      'Make every day worth the wait.',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),
        _Tile(
          Icons.event_available_outlined,
          'Moments',
          '${service.moments.length} total moments',
        ),
        _Tile(
          Icons.favorite_border_rounded,
          'Favorites',
          '${service.favorites.length} favorite moments',
        ),
        _Tile(
          Icons.save_outlined,
          'Saved',
          '${service.saved.length} saved moments',
        ),
        const SizedBox(height: 16),
        const _Tile(
          Icons.privacy_tip_outlined,
          'Privacy Policy',
          'Offline-first core experience',
        ),
        const _Tile(
          Icons.description_outlined,
          'Terms & Conditions',
          'Terms for using Orbia',
        ),
        const _Tile(Icons.info_outline_rounded, 'Version', '1.0.0'),
      ],
    ),
  );
}

class _Tile extends StatelessWidget {
  final IconData icon;
  final String title, subtitle;

  const _Tile(this.icon, this.title, this.subtitle);

  @override
  Widget build(BuildContext context) => Card(
    elevation: 0,
    color: Colors.white,
    child: ListTile(
      leading: Icon(icon, color: const Color(0xFF1D2945)),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w800)),
      subtitle: Text(subtitle),
    ),
  );
}
