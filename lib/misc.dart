import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

bool isPortrait(BuildContext context) {
  return MediaQuery.orientationOf(context) == Orientation.portrait;
}

bool isLandscape(BuildContext context) {
  return MediaQuery.orientationOf(context) == Orientation.landscape;
}

class CenteredWidget extends StatelessWidget {
  final Widget child;
  final Widget? debugChild;

  const CenteredWidget({super.key, required this.child, this.debugChild});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Stack(
        children: [
          SingleChildScrollView(
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
          if(kDebugMode) Padding(
            padding: const EdgeInsets.all(16.0),
            child: debugChild,
          ),
        ],
      ),
    );
  }
}