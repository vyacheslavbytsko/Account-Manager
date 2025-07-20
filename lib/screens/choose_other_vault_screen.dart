import 'package:flutter/material.dart';

import '../misc.dart';

class ChooseOtherVaultScreen extends StatefulWidget {
  const ChooseOtherVaultScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ChooseOtherVaultScreenState();
}

class _ChooseOtherVaultScreenState extends State<ChooseOtherVaultScreen> {
  late TextEditingController _controller;
  bool _textFieldEnabled = true;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void parseVault() async {
    setState(() {
      _textFieldEnabled = false;
    });
    var vaultUrl = _controller.text;
    /*await showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Thanks!'),
          content: Text('You typed "$vaultUrl", which has length ${vaultUrl.characters.length}.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );*/
    setState(() {
      _textFieldEnabled = true;
    });
  }

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
            "Debug: This page lets user choose other Vault where they want to register or log in.",
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
                      enabled: _textFieldEnabled,
                      controller: _controller,
                      onSubmitted: _textFieldEnabled ? (_) => parseVault() : null,
                      decoration: InputDecoration(hint: Text("Vault address")),
                    ),
                  ),
                  SizedBox(width: 16,),
                  IconButton(onPressed: _textFieldEnabled ? () => parseVault() : null, icon: Icon(Icons.arrow_forward))
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