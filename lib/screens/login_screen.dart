import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../misc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;
  bool _inputEnabled = true;
  late String vaultAddress;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    //_passwordController.dispose();
    super.dispose();
  }

  void parseVault() async {
    setState(() {
      _inputEnabled = false;
    });
    String text = _usernameController.text;

    try {
      /*final dio = Dio();
      dio.interceptors.add(SchemeInterceptor());

      Response response;
      dynamic data;
      response = await dio.get('$text/.well-known/beshence/vault');
      data = response.data;

      String apiBaseUrl = data["api"]["base_url"] != null &&
          data["api"]["base_url"].runtimeType == String
          ? data["base_url"]
          : text;

      String apiPath = data["api"]["path"];

      if (!(data["api"]["versions"] as List).contains("v1.0")) throw Exception("This Vault doesn't support API v1.0. Check if Manager and Vault are updated.");

      response = await dio.get('$apiBaseUrl$apiPath/v1.0/ping');
      data = response.data;

      if(data["ping"] != "pong") throw Exception("This is not a Beshence Vault.");*/
    } on Exception catch(exception) {
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
    } finally {
      setState(() {
        _inputEnabled = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print(GoRouterState.of(context).uri.queryParameters);
    if(!GoRouterState.of(context).uri.queryParameters.containsKey("vault")) throw Exception("No Vault address provided");
    vaultAddress = GoRouterState.of(context).uri.queryParameters["vault"] as String;
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
                "Log in",
                style: Theme.of(context).textTheme.headlineLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 32,),
              Text("To use this Vault, introduce yourself."),
              SizedBox(height: 32,),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      enabled: _inputEnabled,
                      controller: _usernameController,
                      onSubmitted: _inputEnabled ? (_) => parseVault() : null,
                      decoration: InputDecoration(hint: Text("Vault address")),
                    ),
                  ),
                  SizedBox(width: 16,),
                  IconButton(onPressed: _inputEnabled ? () => parseVault() : null, icon: Icon(Icons.arrow_forward))
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