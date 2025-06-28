import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(ProfilParadiseApp());
}

class ProfilParadiseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profil Paradise',
      home: ProfilePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProfilePage extends StatelessWidget {
  final String name = 'Mashanda Putri Rashya';
  final String bio = 'Semangat Sentosa';
  final String contact = '087874835075';

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Profil Paradise'),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          // Foto Profil
          CircleAvatar(
            radius: 70,
            backgroundImage: AssetImage('assets/fotoaca.jpg'),
          ),
          const SizedBox(height: 20),

          // Nama
          Text(
            name,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),

          // Bio
          const SizedBox(height: 8),
          Text(
            bio,
            style: const TextStyle(
              fontSize: 16,
              fontStyle: FontStyle.italic,
              color: Colors.black54,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 12),

          // Kontak
          Text(
            'Kontak: $contact',
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 24),

          // Ikon Media Sosial
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.camera_alt, color: Colors.purple),
                onPressed: () {
                  _launchURL('https://instagram.com/remzeca');
                },
              ),
              IconButton(
                icon: const Icon(Icons.web, color: Colors.blue),
                onPressed: () {
                  _launchURL('https://flutter.dev');
                },
              ),
              IconButton(
                icon: const Icon(Icons.code, color: Colors.black),
                onPressed: () {
                  _launchURL('https://github.com');
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}