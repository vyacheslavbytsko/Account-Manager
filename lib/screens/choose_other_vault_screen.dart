import 'package:flutter/material.dart';

import '../misc.dart';

class ChooseOtherVaultScreen extends StatelessWidget {
  const ChooseOtherVaultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final elevatedStyle = ElevatedButton.styleFrom();
    final colorScheme = Theme.of(context).colorScheme;
    final elevatedBackground = elevatedStyle.backgroundColor?.resolve({}) ?? colorScheme.primary;
    final elevatedForeground = elevatedStyle.foregroundColor?.resolve({}) ?? colorScheme.onPrimary;

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
            "Debug: This page lets user choose Vault where they want to register or log in.",
            style: TextStyle(color: Colors.red),),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Icon(Icons.dns_outlined, size: 48),
              SizedBox(height: 32),
              Text(
                "Choose Vault",
                style: Theme.of(context).textTheme.headlineLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 32,),
              Text("Write down the address of the Vault:"),
              SizedBox(height: 32,),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(hint: Text("Vault address")),
                    ),
                  ),
                  SizedBox(width: 16,),
                  IconButton(onPressed: () => {}, icon: Icon(Icons.arrow_forward))
                ],
              ),
              SizedBox(height: 32,),
              ListTile(
                contentPadding: EdgeInsetsGeometry.zero,
                titleAlignment: ListTileTitleAlignment.titleHeight,
                leading: Icon(Icons.info_outline),
                subtitle: Text("If you have an account which utilizes several Vaults, you can choose either of them — the information about your account is shared among all of your Vaults."),
              ),
              ListTile(
                contentPadding: EdgeInsetsGeometry.zero,
                titleAlignment: ListTileTitleAlignment.titleHeight,
                leading: Icon(Icons.info_outline),
                subtitle: Text("You cannot link new Vault to your account here. You must do it after logging in on Vault where your account is already stored."),
              ),
            ],
          ),
        )
    );
  }
}