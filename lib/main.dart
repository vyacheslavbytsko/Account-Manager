import 'package:beshence_account_manager/misc.dart';
import 'package:beshence_account_manager/screens/choose_other_vault_screen.dart';
import 'package:beshence_account_manager/screens/choose_vault_screen.dart';
import 'package:beshence_account_manager/screens/add_account_screen.dart';
import 'package:beshence_account_manager/screens/login_screen.dart';
import 'package:beshence_account_manager/screens/register_screen.dart';
import 'package:beshence_account_manager/screens/welcome_screen.dart';
import 'package:beshence_account_manager/screens/main_screen.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  GoRouter.optionURLReflectsImperativeAPIs = true;
  runApp(const MyApp());
}

GoRouter router = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const MainScreen(),
      redirect: (context, state) async {
          if((await AccountManager.activeAccount) == null) {
            if((await AccountManager.accounts).isEmpty) {
              return "/welcome";
            } else {
              return "/chooseAccount";
            }
          }
          return "/home";
      },
    ),
    GoRoute(
      path: "/welcome",
      builder: (context, state) => const WelcomeScreen(),
    ),
    GoRoute(
        path: "/addAccount",
        builder: (context, state) => AddAccountScreen(),
        routes: [
          GoRoute(
            path: "/chooseVault",
            builder: (context, state) => const ChooseVaultScreen(),
          ),
          GoRoute(
            path: "/chooseOtherVault",
            builder: (context, state) => const ChooseOtherVaultScreen(),
          ),
          GoRoute(
            path: "/register",
            builder: (context, state) => const RegisterScreen(),
          ),
          GoRoute(
            path: "/login",
            builder: (context, state) => const LoginScreen(),
          ),
        ]
    )
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        ColorScheme lightColorScheme =
            lightDynamic?.harmonized() ??
            ColorScheme.fromSeed(seedColor: Colors.green);
        ColorScheme darkColorScheme =
            darkDynamic?.harmonized() ??
            ColorScheme.fromSeed(
              seedColor: Colors.green,
              brightness: Brightness.dark,
            );
        return MaterialApp.router(
          routerConfig: router,
          title: 'Beshence Account Manager',
          theme: ThemeData(
            colorScheme: lightColorScheme,
            appBarTheme: AppBarTheme(backgroundColor: lightColorScheme.surface),
            bottomAppBarTheme: BottomAppBarTheme(color: lightColorScheme.surface),
          ),
          darkTheme: ThemeData(
            colorScheme: darkColorScheme,
            appBarTheme: AppBarTheme(backgroundColor: darkColorScheme.surface),
            bottomAppBarTheme: BottomAppBarTheme(color: darkColorScheme.surface),
          ),
          themeMode: ThemeMode.system,
        );
      },
    );
  }
}