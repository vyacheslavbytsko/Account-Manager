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
      builder: (context, state) => const RedirectPage(),
    ),
    GoRoute(
        path: "/login",
        builder: (context, state) => const LoginPage(),
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
          ColorScheme lightColorScheme = lightDynamic?.harmonized() ??
              ColorScheme.fromSeed(seedColor: Colors.green);
          ColorScheme darkColorScheme = darkDynamic?.harmonized() ??
              ColorScheme.fromSeed(
                  seedColor: Colors.green, brightness: Brightness.dark);
          return MaterialApp.router(
            routerConfig: router,
            title: 'Beshence Account Manager',
            theme: ThemeData(
                colorScheme: lightColorScheme,
                appBarTheme: AppBarTheme(backgroundColor: lightColorScheme.surface)),
            darkTheme: ThemeData(colorScheme: darkColorScheme,
                appBarTheme: AppBarTheme(backgroundColor: darkColorScheme.surface)),
            themeMode: ThemeMode.system,
          );
        });
  }
}

class RedirectPage extends StatelessWidget {
  const RedirectPage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.replace('/login');
    });

    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }

}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Beshence Account Manager"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.beenhere_outlined, size: 48,),
            SizedBox(height: 16,),
            Text('Log in to your\nBeshence account', style: Theme.of(context).textTheme.titleLarge, textAlign: TextAlign.center,),
          ],
        ),
      ),
    );
  }
}
