import 'package:biometric_app/local_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool auth = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BiometricApp'),
        centerTitle: true,
      ),
      floatingActionButton: auth == true
          ? null
          : FloatingActionButton(
              onPressed: () async {
                final authen = await LocalAuth.authenticate();
                setState(() {
                  auth = authen;
                });
              },
              child: const Icon(Icons.fingerprint),
            ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!auth)
              const Icon(
                Icons.warning,
                size: 60,
              ),
            if (auth) const Icon(Icons.check_circle, size: 60),
            if (auth)
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      auth = false;
                    });
                  },
                  child: const Text('Remove Auth'))
          ],
        ),
      ),
    );
  }
}
