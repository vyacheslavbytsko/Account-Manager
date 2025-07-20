import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../misc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<StatefulWidget> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController _usernameController;
  bool _inputEnabled = true;
  late String vaultAddress;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  void _createAccount({bool skip = false}) async {
    setState(() {
      _inputEnabled = false;
    });
    String text = _usernameController.text;
    try {
      if(text == "" && !skip) {
        if(context.mounted) {
          await showDialog<void>(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Uh-oh!'),
                content: Text('Username is empty.'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      _createAccount(skip: true);
                    },
                    child: const Text('Skip'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Choose username'),
                  ),
                ],
              );
            },
          );
        }
      }
      String id = await AccountManager.createAccount();
      if(context.mounted) context.replace("/");
    } on Exception catch(exception) {
      if(context.mounted) {
        await showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Uh-oh!'),
            content: Text('There was an error.\n\n$exception'),
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
      );
      }
    } finally {
      setState(() {
        _inputEnabled = true;
      });
    }
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Icon(Icons.account_circle_outlined, size: 48),
              SizedBox(height: 32),
              Text(
                "Choose username",
                style: Theme.of(context).textTheme.headlineLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 32,),
              Text("You can change it later."),
              SizedBox(height: 32,),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      enabled: _inputEnabled,
                      controller: _usernameController,
                      onSubmitted: false ? (_) => _createAccount() : null,
                      decoration: InputDecoration(hint: Text("Username")),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32,),
              Row(
                children: [
                  Expanded(
                    child: FilledButton.tonal(
                      onPressed: () => _createAccount(skip: true),
                      child: Text("Skip for now"),
                    ),
                  ),
                  SizedBox(width: 16,),
                  Expanded(
                    child: FilledButton(
                      onPressed: null /*() => createAccount()*/,
                      child: Text("Continue"),
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