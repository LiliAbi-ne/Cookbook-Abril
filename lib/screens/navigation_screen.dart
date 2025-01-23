import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 8, // Número de actividades
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Navigation Examples',
            style:
                GoogleFonts.nunito(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          backgroundColor: Colors.blueAccent,
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'Animate Widget'),
              Tab(text: 'Navigate Back'),
              Tab(text: 'Named Routes'),
              Tab(text: 'Pass Arguments'),
              Tab(text: 'App Links Android'),
              Tab(text: 'Universal Links iOS'),
              Tab(text: 'Return Data'),
              Tab(text: 'Send Data'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            AnimateWidgetAcrossScreensExample(),
            NavigateToNewScreenAndBackExample(),
            NavigateWithNamedRoutesExample(),
            PassArgumentsToNamedRouteExample(),
            AppLinksAndroidExample(),
            UniversalLinksIOSExample(),
            ReturnDataFromScreenExample(),
            SendDataToNewScreenExample(),
          ],
        ),
      ),
    );
  }
}

// Activity 1: Animate a widget across screens
class AnimateWidgetAcrossScreensExample extends StatelessWidget {
  const AnimateWidgetAcrossScreensExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.lightBlue,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        ),
        onPressed: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const SecondScreen(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                const begin = Offset(1.0, 0.0);
                const end = Offset.zero;
                const curve = Curves.easeInOut;

                var tween = Tween(begin: begin, end: end)
                    .chain(CurveTween(curve: curve));
                var offsetAnimation = animation.drive(tween);

                return SlideTransition(
                  position: offsetAnimation,
                  child: child,
                );
              },
            ),
          );
        },
        child: Text(
          'Animate to Screen',
          style: GoogleFonts.nunito(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen', style: GoogleFonts.nunito()),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Text(
          'This is the second screen!',
          style: GoogleFonts.nunito(fontSize: 18, color: Colors.blueGrey),
        ),
      ),
    );
  }
}

// Activity 2: Navigate to a new screen and back
class NavigateToNewScreenAndBackExample extends StatelessWidget {
  const NavigateToNewScreenAndBackExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.lightBlue,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SecondScreen()),
          );
        },
        child: Text(
          'Navigate to New Screen',
          style: GoogleFonts.nunito(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

// Activity 3: Navigate with named routes
class NavigateWithNamedRoutesExample extends StatelessWidget {
  const NavigateWithNamedRoutesExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.lightBlue,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/second');
        },
        child: Text(
          'Navigate with Named Route',
          style: GoogleFonts.nunito(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

// Activity 4: Pass arguments to a named route
class PassArgumentsToNamedRouteExample extends StatelessWidget {
  const PassArgumentsToNamedRouteExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.lightBlue,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        ),
        onPressed: () {
          Navigator.pushNamed(
            context,
            '/second',
            arguments: 'Hello from First Screen!',
          );
        },
        child: Text(
          'Pass Arguments to Named Route',
          style: GoogleFonts.nunito(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

// Activity 5: Set up app links for Android
class AppLinksAndroidExample extends StatelessWidget {
  const AppLinksAndroidExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'App Links for Android example not implemented yet.',
        style: GoogleFonts.nunito(fontSize: 16, color: Colors.blueGrey),
        textAlign: TextAlign.center,
      ),
    );
  }
}

// Activity 6: Set up universal links for iOS
class UniversalLinksIOSExample extends StatelessWidget {
  const UniversalLinksIOSExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Universal Links for iOS example not implemented yet.',
        style: GoogleFonts.nunito(fontSize: 16, color: Colors.blueGrey),
        textAlign: TextAlign.center,
      ),
    );
  }
}

// Activity 7: Return data from a screen
class ReturnDataFromScreenExample extends StatelessWidget {
  const ReturnDataFromScreenExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.lightBlue,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        ),
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SecondScreen()),
          );
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Returned data: $result')),
          );
        },
        child: Text(
          'Return Data from Screen',
          style: GoogleFonts.nunito(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

// Activity 8: Send data to a new screen
class SendDataToNewScreenExample extends StatelessWidget {
  const SendDataToNewScreenExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.lightBlue,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SecondScreen(),
              settings:
                  const RouteSettings(arguments: 'Data from First Screen'),
            ),
          );
        },
        child: Text(
          'Send Data to New Screen',
          style: GoogleFonts.nunito(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
