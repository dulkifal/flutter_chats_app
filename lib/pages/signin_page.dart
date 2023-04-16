import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../util/authentication_service.dart';

class SignInPage extends StatelessWidget {
  final TextEditingController emaitControtIer = TextEditingController();
  final TextEditingController passwordControtIer = TextEditingController();

  SignInPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Sign In',
              style: TextStyle(fontSize: 32),
            ),
            const SizedBox(height: 8),
            const Text(
              'Please sign in to continue',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 32),
            TextField(
              controller: emaitControtIer,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
                hintText: 'Email',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: passwordControtIer,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
                hintText: 'Password',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                context.read<AuthenticationService>().signIn(
                      email: emaitControtIer.text.trim(),
                      password: passwordControtIer.text.trim(),
                    );
              },
              child: const Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}
