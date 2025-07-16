import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

GoRouter router = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
        path: "/",
        builder: (context, state) => const MyHomePage(),
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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Beshence Account Manager"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
