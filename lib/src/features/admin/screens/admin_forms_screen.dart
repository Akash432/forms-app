import 'package:flutter/material.dart';

class AdminFormsScreen extends StatelessWidget {
  const AdminFormsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Forms'),
      ),
      body: const Center(
        child: Text('This is where admins will manage forms.'),
      ),
    );
  }
}
