import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:myapp/src/core/services/auth_service.dart';
import 'package:myapp/src/core/services/firestore_service.dart';
import 'package:myapp/src/features/auth/screens/login_screen.dart';
import 'package:myapp/src/features/admin/screens/admin_dashboard_screen.dart';
import 'package:myapp/src/features/user/screens/user_dashboard_screen.dart';
import 'package:myapp/src/features/admin/screens/admin_forms_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(
          create: (_) => AuthService(),
        ),
        Provider<FirestoreService>(
          create: (_) => FirestoreService(),
        ),
      ],
      child: Builder(
        builder: (context) {
          final authService = Provider.of<AuthService>(context, listen: false);
          return MaterialApp.router(
            routerConfig: _router(authService),
            title: 'Forms App',
            theme: ThemeData(
              primarySwatch: Colors.indigo,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
          );
        },
      ),
    );
  }
}

GoRouter _router(AuthService authService) {
  return GoRouter(
    initialLocation: '/',
    refreshListenable: GoRouterRefreshStream(authService.authStateChanges),
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        ),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/admin',
        builder: (context, state) => const AdminDashboardScreen(),
        routes: [
          GoRoute(
            path: 'forms',
            builder: (context, state) => const AdminFormsScreen(),
          ),
        ],
      ),
      GoRoute(
        path: '/user',
        builder: (context, state) => const UserDashboardScreen(),
      ),
    ],
    redirect: (BuildContext context, GoRouterState state) async {
      final user = FirebaseAuth.instance.currentUser;
      final isLoggedIn = user != null;
      final loggingIn = state.uri.toString() == '/login';

      if (!isLoggedIn) {
        return loggingIn ? null : '/login';
      }

      final firestoreService = Provider.of<FirestoreService>(context, listen: false);
      final role = await firestoreService.getUserRole(user.uid);

      if (loggingIn) {
        return role == 'admin' ? '/admin' : '/user';
      }

      final isAdminArea = state.uri.toString().startsWith('/admin');
      if (role == 'admin' && !isAdminArea) {
        return '/admin';
      }

      final isUserArea = state.uri.toString().startsWith('/user');
      if (role == 'user' && !isUserArea) {
        return '/user';
      }

      return null;
    },
  );
}

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen((_) => notifyListeners());
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
