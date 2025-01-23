import 'package:flutter/material.dart';
import '../screens/design_screen.dart';
import '../screens/list_screen.dart';
import '../screens/forms_screen.dart';
import '../screens/images_screen.dart';
import '../screens/navigation_screen.dart';
import '../screens/animation_screen.dart';
import '../screens/effects_screen.dart';
import '../screens/networking_screen.dart';
import '../screens/databaseexmple.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.lightBlue[50], // Fondo del menú
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent,
                ),
                child: Center(
                  child: Text(
                    'Menu',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.design_services, color: Colors.blue),
                title: Text('Go to Design Section'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DesignScreen()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.list, color: Colors.green),
                title: Text('Go to List Section'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ListScreen()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.edit, color: Colors.orange),
                title: Text('Go to Forms Section'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FormsScreen()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.image, color: Colors.purple),
                title: Text('Go to Images Section'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ImagesScreen()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.navigation, color: Colors.red),
                title: Text('Go to Navigation Section'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NavigationScreen()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.animation, color: Colors.green),
                title: Text('Go to Animation Section'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AnimationScreen()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.animation, color: Colors.green),
                title: Text('Go to Effects Section'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EffectsScreen()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.network_check, color: Colors.orange),
                title: Text('Go to Networking Section'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => QRGeneratorScreen()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.storage, color: Colors.green),
                title: Text('Go to Database Section'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TicketGeneratorScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Builder(
          builder: (BuildContext innerContext) {
            return ElevatedButton(
              onPressed: () {
                Scaffold.of(innerContext).openDrawer(); // Abre el Drawer
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.menu),
                  SizedBox(width: 8),
                  Text('Open Menu'),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
