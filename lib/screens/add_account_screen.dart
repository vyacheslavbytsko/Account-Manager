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
              Text("You can either create new account or log in to existing one:"),
              SizedBox(height: 32,),
              Row(
                children: [
                  Expanded(
                    child: FilledButton.tonal(
                      onPressed: () => context.push("/addAccount/register"),
                      child: Text("Register"),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: FilledButton(
                      onPressed: () => context.push("/addAccount/chooseVault"),
                      child: Text("Log in"),
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