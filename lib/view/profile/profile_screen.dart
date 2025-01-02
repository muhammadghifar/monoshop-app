import 'package:flutter/material.dart';
import 'package:submission/component/button/elevated_button.dart';
import 'package:submission/component/button/outlined_button.dart';
import 'package:submission/component/text/text_component.dart';
import 'package:submission/view/auth/auth_screen.dart';
import 'package:submission/component/divider/divider_component.dart';

class ProfileScreen extends StatelessWidget {
  final String username;
  final String email;
  final String fullname;

  const ProfileScreen({
    super.key,
    this.username = 'johndoe',
    this.email = 'youremail@email.com',
    this.fullname = 'John Doe',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 72,
                backgroundColor: Colors.black,
                child: Icon(
                  Icons.person,
                  size: 100,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 12),
              heading3(fullname),
              Text(email),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16),
                width: double.infinity,
                // color: Colors.red,
                // height: 800,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Full Name",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600)),
                    Text(fullname, style: const TextStyle(fontSize: 16)),
                    dividerComponent(),
                    const Text("Username",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600)),
                    Text(username, style: const TextStyle(fontSize: 16)),
                    dividerComponent(),
                    const Text("Email",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600)),
                    Text(email, style: const TextStyle(fontSize: 16)),
                    dividerComponent(),
                    const Text("Phone Number",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600)),
                    const Text('081234567890', style: TextStyle(fontSize: 16)),
                    dividerComponent(),
                  ],
                ),
              ),
              OutlinedButtonComponent(onPressed: () {}, text: "Edit Profile"),
              ElevatedButtonComponent(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const AuthScreen()),
                  );
                },
                text: "Logout",
                // child: const Text('Logout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
