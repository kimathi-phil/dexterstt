import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/features.dart';

class AppRouter {
  const AppRouter._();

  static const signIn = 'login';
  static const home = 'home';
  static const todoDetail = 'todoDetail';

  static final GoRouter router = GoRouter(
    debugLogDiagnostics: kDebugMode,
    routes: [
      GoRoute(
        name: home,
        path: '/home',
        pageBuilder: (context, state) {
          final url = state.uri.toString();
          print(url);

          int startIndex = url.indexOf('uid=') + 4;
          int endIndex = url.indexOf('&', startIndex);
          if (endIndex == -1) endIndex = url.length;
          String uid = url.substring(startIndex, endIndex);
          print(uid);

          return MaterialPage(
            key: state.pageKey,
            child: TranscriptsScreen(path: uid),
          );
        },
      ),
    ],
    initialLocation: '/home',
    errorPageBuilder: (context, state) => MaterialPage(
      key: state.pageKey,
      child: ErrorScreen(error: state.error),
    ),
  );
}

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key, this.error});
  final Exception? error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: const CloseButton()),
      body: const Center(
        child: Text('Something went wrong!'),
      ),
    );
  }
}
