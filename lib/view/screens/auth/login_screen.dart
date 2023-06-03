import 'package:contactapp/view/widgets/navigation_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextField(
              decoration: InputDecoration(
                hintText: 'Username',
                filled: true,
                fillColor: Color.fromARGB(255, 20, 21, 31),
              ),
            ),
            const SizedBox(height: 16.0),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
                filled: true,
                fillColor: Color.fromARGB(255, 20, 21, 31),
              ),
            ),
            const SizedBox(height: 24.0),
            ButtonTheme(
              minWidth: 200.0, // Set the minimum width of the button
              height: 50.0, // Set the height of the button
              child: ElevatedButton(
                onPressed: () {
                  // Perform login action
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Navigation()));
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(10.0), // Set the button shape
                  ),
                  textStyle: const TextStyle(
                    color: Colors.red, // Set the text color of the button
                  ),
                ),
                child: const Text('Login'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
