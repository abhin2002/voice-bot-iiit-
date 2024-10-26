import 'package:flutter/material.dart';
import 'package:lejit/firm/lawyer_details_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Lawyers',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Appointments',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              color: Colors.blue,
              width: double.infinity,
              child: Column(
                children: [
                  // Add padding
                  SizedBox(height: 40),

                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('https://www.gravatar.com/avatar/2c7d99fe281ecd3bcd65ab915bac6dd5?s=150'), // Replace with your image asset
                  ),
                  SizedBox(height: 10),
                  Text(
                    'John Phyllis',
                    style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '+1 (503) 254366 | emma123@email.com',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.monetization_on, color: Colors.orange),
                        SizedBox(width: 5),
                        Text(
                          '2000 points',
                          style: TextStyle(color: Colors.orange),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  ProfileMenuItem(
                    icon: Icons.person_outline,
                    title: 'Personal Details',
                    subtitle: 'Name, Location, Phone Number',
                    // Add navigation logic here
                    OnClick: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProfilePage()),
                      );
                    },
                  ),
                  ProfileMenuItem(
                    icon: Icons.folder_open,
                    title: 'My Cases',
                    subtitle: 'Lorem ipsum dolor sit amets',
                  ),
                  ProfileMenuItem(
                    icon: Icons.document_scanner,
                    title: 'Documents',
                    subtitle: 'View, Edit and download case documents',
                  ),
                  ProfileMenuItem(
                    icon: Icons.calendar_today,
                    title: 'Hearing Schedules',
                    subtitle: 'Lorem ipsum dolor sit ameter',
                  ),
                  ProfileMenuItem(
                    icon: Icons.card_giftcard,
                    title: 'Refer & Earn Program',
                    subtitle: 'Refer friends & earn points as a reward',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  ProfileMenuItem({required this.icon, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue, size: 30),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: () {
          // Add your navigation logic here
        },
      ),
    );
  }
}
