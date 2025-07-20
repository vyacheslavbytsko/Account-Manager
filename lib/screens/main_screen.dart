import 'package:beshence_account_manager/misc.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: FutureBuilder(
                future: AccountManager.activeAccount,
                builder: (context, snapshot) {
                  if(snapshot.hasData) {
                    return Text(snapshot.data ?? "no id which is weird");
                  }
                  return CircularProgressIndicator();
                },
            )
        )
    );
  }
}