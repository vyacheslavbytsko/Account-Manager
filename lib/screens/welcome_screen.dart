import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../misc.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

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
                  "preferences, linked Vaults and services.\n\n"
                  "Let's start:"),
              SizedBox(height: 32,),
              Row(
                children: [
                  Expanded(
                    child: FilledButton.tonal(
                      onPressed: () => context.push("/addAccount/register"),
                      child: Text("Register"),
                    ),
                  ),
                  SizedBox(width: 16,),
                  Expanded(
                    child: FilledButton(
                      onPressed: () => context.push("/addAccount/chooseVault"),
                      child: Text("Log in"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
    );
  }
}