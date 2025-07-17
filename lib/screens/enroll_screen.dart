import 'package:flutter/material.dart';

import '../misc.dart';

class EnrollScreen extends StatelessWidget {
  const EnrollScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Beshence Account Manager")),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            children: [
              TextButton(onPressed: () => {}, child: Text("Choose language")),
              Expanded(child: SizedBox.shrink()),
              TextButton(onPressed: () => {}, child: Text("Help")),
              TextButton(onPressed: () => {}, child: Text("About us")),
            ],
          ),
        ),
        body: CenteredWidget(
          debugChild: Text(
            "Debug: This page shows up when there are "
                "no account records in browser storage.",
            style: TextStyle(color: Colors.red),),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Icon(Icons.waving_hand_outlined, size: 48),
              SizedBox(height: 32),
              Text(
                "Hello!",
                style: Theme.of(context).textTheme.headlineLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 32),
              Text("Beshence Account Manager is the place "
                  "where you can manage your Beshence accounts, "
                  "preferences, connected servers and services.\n\n"
                  "We in Beshence do not have access to your "
                  "accounts managed here — all info is saved "
                  "in your browser.\n\nLet's start:"),
              SizedBox(height: 32,),
              Row(
                children: [
                  Expanded(
                    child: FilledButton.tonal(
                      onPressed: () => {},
                      child: Text("Register"),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: FilledButton(
                      onPressed: () => {},
                      child: Text("Log in"),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32,)
            ],
          ),
        )
    );
  }
}