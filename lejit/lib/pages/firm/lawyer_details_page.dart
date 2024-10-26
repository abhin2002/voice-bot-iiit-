import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Profile Section

          // Details Section
          Expanded(
            child: Container(
              color: Colors.grey[100],
              child: ListView(

                // padding: const EdgeInsets.all(20.0),
                children: [
                  Container(
            
                    color: Colors.blue,
                    width: double.infinity,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 30.0),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 100,
                            backgroundImage: NetworkImage(
                              'https://www.gravatar.com/avatar/2c7d99fe281ecd3bcd65ab915bac6dd5?s=150', // Replace with your image URL
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Steve Richards',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            '+1 (503) 254377',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'steve123@email.com',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ProfileOptionCard(
                    icon: Icons.person_outline,
                    title: 'Personal Details',
                    subtitle: 'Name, Location, Phone Number',
                    onTap: () {
                      // Add action here
                    },
                  ),
                  ProfileOptionCard(
                    icon: Icons.work_outline,
                    title: 'Professional Details',
                    subtitle: 'View, Edit and Add Professional Details',
                    onTap: () {
                      // Add action here
                    },
                  ),
                  ProfileOptionCard(
                    icon: Icons.calendar_today_outlined,
                    title: 'Appointments',
                    subtitle: 'View, Edit and Add Appointments',
                    onTap: () {
                      // Add action here
                    },
                  ),
                  ProfileOptionCard(
                    icon: Icons.folder_outlined,
                    title: 'Case Details',
                    subtitle: 'View, Edit and Add Cases',
                    onTap: () {
                      // Add action here
                    },
                  ),
                  ProfileOptionCard(
                    icon: Icons.group_outlined,
                    title: 'Team Members',
                    subtitle: 'View, Edit and Add Team Members',
                    onTap: () {
                      // Add action here
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileOptionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  ProfileOptionCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 2.0,
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: ListTile(
          leading: Icon(
            icon,
            color: Colors.blue,
            size: 30,
          ),
          title: Text(title),
          subtitle: Text(subtitle),
          trailing: const Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}
