import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../misc.dart';

class AddAccountScreen extends StatelessWidget {
  const AddAccountScreen({super.key});

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
            "Debug: This internal page lets user choose where to go - register/log in or go home. It is unexpected for user to see this page.",
            style: TextStyle(color: Colors.red),),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Icon(Icons.person_add_alt_outlined, size: 48),
              SizedBox(height: 32),
              Text(
                "Add account",
                style: Theme.of(context).textTheme.headlineLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 32),
              Text("To add account to the Manager, you need to choose Vault and then register/log in."),
              SizedBox(height: 32),
              Row(
                children: [
                  Expanded(
                    child: FilledButton(
                      onPressed: () => context.push("/addAccount/chooseVault"),
                      child: Text("Choose Vault"),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32,),
              Text("Or you can go to the main screen."),
              SizedBox(height: 32,),
              Row(
                children: [
                  Expanded(
                    child: FilledButton.tonal(
                      onPressed: () => context.replace("/"),
                      child: Text("Go home"),
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