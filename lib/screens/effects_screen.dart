import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EffectsScreen extends StatelessWidget {
  const EffectsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Effects',
          style: GoogleFonts.nunito(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildCustomButton(
            context,
            title: 'Download Button',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DownloadButtonExample(),
                ),
              );
            },
          ),
          _buildCustomButton(
            context,
            title: 'Nested Navigation Flow',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NestedNavigationExample(),
                ),
              );
            },
          ),
          _buildCustomButton(
            context,
            title: 'Shimmer Loading Effect',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ShimmerEffectExample(),
                ),
              );
            },
          ),
          _buildCustomButton(
            context,
            title: 'Staggered Menu Animation',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const StaggeredMenuExample(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCustomButton(
    BuildContext context, {
    required String title,
    required VoidCallback onPressed,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
          ),
          backgroundColor: Colors.blueAccent,
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: GoogleFonts.nunito(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

// Download Button Example
class DownloadButtonExample extends StatelessWidget {
  const DownloadButtonExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Download Button', style: GoogleFonts.nunito()),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.lightBlue,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          ),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Downloading...')),
            );
          },
          child: Text(
            'Download',
            style: GoogleFonts.nunito(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

// Nested Navigation Example
class NestedNavigationExample extends StatelessWidget {
  const NestedNavigationExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nested Navigation', style: GoogleFonts.nunito()),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.lightBlue),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SecondPage()),
            );
          },
          child: Text('Go to Second Page', style: GoogleFonts.nunito()),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page', style: GoogleFonts.nunito()),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.lightBlue),
          onPressed: () => Navigator.pop(context),
          child: Text('Go Back', style: GoogleFonts.nunito()),
        ),
      ),
    );
  }
}

// Shimmer Effect Example
class ShimmerEffectExample extends StatelessWidget {
  const ShimmerEffectExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shimmer Effect', style: GoogleFonts.nunito()),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Text(
          'Shimmer Effect Placeholder',
          style: GoogleFonts.nunito(fontSize: 16, color: Colors.blueGrey),
        ),
      ),
    );
  }
}

// Staggered Menu Example
class StaggeredMenuExample extends StatelessWidget {
  const StaggeredMenuExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Staggered Menu Animation', style: GoogleFonts.nunito()),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Text(
          'Staggered Menu Animation Placeholder',
          style: GoogleFonts.nunito(fontSize: 16, color: Colors.blueGrey),
        ),
      ),
    );
  }
}
