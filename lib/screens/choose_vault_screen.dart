import 'package:flutter/material.dart';

import '../misc.dart';

class ChooseVaultScreen extends StatelessWidget {
  const ChooseVaultScreen({super.key});

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
              SizedBox(height: 32),
              Text("Beshence Vault is the brand name of the server where Beshence accounts are stored.\n\nChoose Vault where your account is or will be stored (if it's not created yet):"),
              SizedBox(height: 32,),
              ListTile(
                tileColor: elevatedBackground,
                iconColor: elevatedForeground,
                textColor: elevatedForeground,
                onTap: () => {},
                leading: Icon(Icons.dns),
                trailing: Icon(Icons.arrow_forward),
                title: Text('Beshence Public Vault'),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              SizedBox(height: 12,),
              ListTile(
                tileColor: elevatedBackground,
                iconColor: elevatedForeground,
                textColor: elevatedForeground,
                onTap: () => {},
                leading: Icon(Icons.link),
                trailing: Icon(Icons.arrow_forward),
                title: Text('My own Vault'),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
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
                subtitle: Text("You cannot link new Vault to your account here. You must do it after logging in on Vault where you account is already stored."),
              ),
            ],
          ),
        )
    );
  }
}