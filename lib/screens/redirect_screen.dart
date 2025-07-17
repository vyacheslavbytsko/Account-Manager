import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RedirectScreen extends StatelessWidget {
  const RedirectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.replace('/enroll');
    });

    return Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}