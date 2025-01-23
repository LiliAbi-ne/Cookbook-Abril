import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Asegúrate de agregar google_fonts al pubspec.yaml

class AnimationScreen extends StatelessWidget {
  const AnimationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // Número de actividades
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Animation Examples',
            style: GoogleFonts.nunito(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          backgroundColor: Colors.lightBlue,
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Colors.white,
            tabs: const [
              Tab(text: 'Page Transition'),
              Tab(text: 'Physics Simulation'),
              Tab(text: 'Animate Container'),
              Tab(text: 'Fade In/Out'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            AnimatePageTransitionExample(),
            AnimatePhysicsSimulationExample(),
            AnimateContainerExample(),
            FadeInOutExample(),
          ],
        ),
      ),
    );
  }
}

// Example 1: Animate a Page Route Transition
class AnimatePageTransitionExample extends StatelessWidget {
  const AnimatePageTransitionExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.lightBlue,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: () {
          Navigator.of(context).push(
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const PageTransitionExample(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(1.0, 0.0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                );
              },
            ),
          );
        },
        child: Text(
          'Animate Page Transition',
          style: GoogleFonts.nunito(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class PageTransitionExample extends StatelessWidget {
  const PageTransitionExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Page Transition',
          style: GoogleFonts.nunito(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.lightBlue,
      ),
      body: Center(
        child: Text(
          'Page Transition Complete',
          style: GoogleFonts.nunito(fontSize: 18, color: Colors.blueGrey),
        ),
      ),
    );
  }
}

// Example 2: Animate a Widget using Physics Simulation
class AnimatePhysicsSimulationExample extends StatefulWidget {
  const AnimatePhysicsSimulationExample({super.key});

  @override
  _AnimatePhysicsSimulationExampleState createState() =>
      _AnimatePhysicsSimulationExampleState();
}

class _AnimatePhysicsSimulationExampleState
    extends State<AnimatePhysicsSimulationExample>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.bounceOut),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Center(
        child: Text(
          'Bouncing Animation!',
          style: GoogleFonts.nunito(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent,
          ),
        ),
      ),
    );
  }
}

// Example 3: Animate the Properties of a Container
class AnimateContainerExample extends StatefulWidget {
  const AnimateContainerExample({super.key});

  @override
  _AnimateContainerExampleState createState() =>
      _AnimateContainerExampleState();
}

class _AnimateContainerExampleState extends State<AnimateContainerExample> {
  double _width = 100;
  double _height = 100;
  Color _color = Colors.blue;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedContainer(
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            color: _color,
            borderRadius: _borderRadius,
          ),
          duration: const Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            final random = Random();
            _width = random.nextInt(200).toDouble() + 50;
            _height = random.nextInt(200).toDouble() + 50;
            _color = Color.fromRGBO(
              random.nextInt(256),
              random.nextInt(256),
              random.nextInt(256),
              1,
            );
            _borderRadius =
                BorderRadius.circular(random.nextInt(100).toDouble());
          });
        },
        backgroundColor: Colors.lightBlue,
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}

// Example 4: Fade a Widget In and Out
class FadeInOutExample extends StatefulWidget {
  const FadeInOutExample({super.key});

  @override
  _FadeInOutExampleState createState() => _FadeInOutExampleState();
}

class _FadeInOutExampleState extends State<FadeInOutExample> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedOpacity(
            opacity: _visible ? 1.0 : 0.0,
            duration: const Duration(seconds: 1),
            child: Text(
              'Fade In and Out',
              style: GoogleFonts.nunito(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.lightBlue,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
            onPressed: () {
              setState(() {
                _visible = !_visible;
              });
            },
            child: Text(
              'Toggle Fade',
              style:
                  GoogleFonts.nunito(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
