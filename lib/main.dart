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
    GoRoute(path: "/", builder: (context, state) => const RedirectPage()),
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

class RedirectPage extends StatelessWidget {
  const RedirectPage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.replace('/login');
    });

    return Scaffold(body: Center(child: CircularProgressIndicator()));
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
      appBar: AppBar(title: Text("Beshence Account Manager")),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            TextButton(onPressed: () => {}, child: Text("Choose language")),
            Expanded(child: SizedBox.shrink()),
            TextButton(onPressed: () => {}, child: Text("Help")),
            TextButton(onPressed: () => {}, child: Text("About us")),
            TextButton(onPressed: () => {}, child: Text("Source code")),
          ],
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Row(
              crossAxisAlignment: isLandscape(context)
                  ? CrossAxisAlignment.center
                  : CrossAxisAlignment.start,
              children: [
                Expanded(child: SizedBox.shrink()),
                SizedBox(
                  width: isLandscape(context)
                      ? 384
                      : (constraints.maxWidth - 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Icon(Icons.account_circle_outlined, size: 48),
                      SizedBox(height: 24),
                      Text(
                        "Sign in",
                        style: Theme.of(context).textTheme.headlineLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      /*RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(text: 'Sign in', style: Theme.of(context).textTheme.headlineLarge),
                          ],
                        ),
                      ),*/
                      SizedBox(height: 32),
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Server address',
                        ),
                      ),
                      SizedBox(height: 16),
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Username',
                        ),
                      ),
                      SizedBox(height: 16),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                        ),
                      ),
                      SizedBox(height: 32),
                      Row(
                        children: [
                          TextButton(
                            onPressed: () => {},
                            child: Text("Register"),
                          ),
                          Expanded(child: SizedBox.shrink()),
                          SizedBox(width: 16),
                          TextButton(
                            onPressed: () => {},
                            child: Text("Forgot password"),
                          ),
                          SizedBox(width: 16),
                          FilledButton(
                            onPressed: () => {},
                            child: Text("Continue"),
                          ),
                        ],
                      ),
                      SizedBox(height: 32),
                    ],
                  ),
                ),
                Expanded(child: SizedBox.shrink()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

bool isPortrait(BuildContext context) {
  return MediaQuery.orientationOf(context) == Orientation.portrait;
}

bool isLandscape(BuildContext context) {
  return MediaQuery.orientationOf(context) == Orientation.landscape;
}
