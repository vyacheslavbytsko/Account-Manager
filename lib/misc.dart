import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

bool isPortrait(BuildContext context) {
  return MediaQuery.orientationOf(context) == Orientation.portrait;
}

bool isLandscape(BuildContext context) {
  return MediaQuery.orientationOf(context) == Orientation.landscape;
}

class CenteredWidget extends StatelessWidget {
  final Widget child;

  const CenteredWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight - 32),
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
                child: child,
              ),
              Expanded(child: SizedBox.shrink()),
            ],
          ),
        ),
      ),
    );
  }
}

class SchemeInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final url = options.path;

    if (!url.startsWith('http://') && !url.startsWith('https://')) {
      options.path = 'http://$url';
    }

    super.onRequest(options, handler);
  }
}

Dio get dio {
  final dio = Dio();
  dio.interceptors.add(SchemeInterceptor());
  return dio;
}

class AccountManager {
  static Future<List<String>> get accounts async {
    SharedPreferencesAsync prefs = SharedPreferencesAsync();

    List<String> accounts = await prefs.getStringList("accounts") ?? [];
    return accounts;
  }

  static Future<String?> get activeAccount async {
    SharedPreferencesAsync prefs = SharedPreferencesAsync();

    List<String> accounts = await prefs.getStringList("accounts") ?? [];
    String? activeAccount = await prefs.getString("activeAccount");
    if(activeAccount == null) return null;
    if(!accounts.contains(activeAccount)) return null;
    return activeAccount;
  }

  static Future<String> createAccount({bool newActive = true}) async {
    SharedPreferencesAsync prefs = SharedPreferencesAsync();

    String id = Uuid().v4();

    List<String> accounts = await prefs.getStringList("accounts") ?? [];
    accounts.add(id);
    await prefs.setStringList("accounts", accounts);

    if(newActive) {
      await prefs.setString("activeAccount", id);
    }

    return id;
  }
}

