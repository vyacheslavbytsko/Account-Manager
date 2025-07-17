import 'package:beshence_account_manager/screens/enroll_screen.dart';
import 'package:beshence_account_manager/screens/redirect_screen.dart';
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
    GoRoute(path: "/", builder: (context, state) => const RedirectScreen()),
    GoRoute(
      path: "/enroll",
      builder: (context, state) => const EnrollScreen(),
      routes: [
        /*GoRoute(
            path: 'note/:noteId',
            builder: (BuildContext context, GoRouterState state) {
              return NoteScreen(note: notesBox.getNote(state.pathParameters["noteId"]!)!);
            },
          ),
          GoRoute(
              path: "settings",
              builder: (BuildContext context, GoRouterState state) {
                return SettingsScreen();
              }
          )*/
      ],
    ),
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
            bottomAppBarTheme: BottomAppBarTheme(color: Colors.transparent),
          ),
          darkTheme: ThemeData(
            colorScheme: darkColorScheme,
            appBarTheme: AppBarTheme(backgroundColor: darkColorScheme.surface),
            bottomAppBarTheme: BottomAppBarTheme(color: Colors.transparent),
          ),
          themeMode: ThemeMode.system,
        );
      },
    );
  }
}