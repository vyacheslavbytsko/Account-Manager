import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

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

