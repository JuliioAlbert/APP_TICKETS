import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gen_soportes/config/router/router_notifier.dart';
import 'package:gen_soportes/features/auth/presentacion/providers/auth_provider.dart';
import 'package:gen_soportes/features/tickets/presentacion/screens/screens.dart';

import 'package:go_router/go_router.dart';

import '../../features/auth/presentacion/screens/screens.dart';

final goRouterProvider = Provider((ref) {
  final goRouterNotifier = ref.read(goRouterNotifierProvider);

  return GoRouter(
    initialLocation: '/splash',
    refreshListenable: goRouterNotifier,
    routes: [
      ///* Primera pantalla
      GoRoute(
        path: '/splash',
        builder: (context, state) => const CheckAuthStatusScreen(),
      ),

      ///* Auth Routes
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/',
        builder: (context, state) => const TicketsScreen(),
      ),
      GoRoute(
        path: '/atendidos',
        builder: (context, state) => const AtendidosScreen(),
      ),
      GoRoute(
        path: '/cancelado',
        builder: (context, state) => const CanceladosScreen(),
      ),
    ],
    redirect: (context, state) {
      final isGoingTo = state.subloc;
      final authStatus = goRouterNotifier.authStatus;

      if (isGoingTo == '/splash' && authStatus == AuthStatus.checking)
        return null;

      if (authStatus == AuthStatus.notAuthenticated) {
        if (isGoingTo == '/login' || isGoingTo == '/register') return null;

        return '/login';
      }

      if (authStatus == AuthStatus.authenticated) {
        if (isGoingTo == '/login' ||
            isGoingTo == '/register' ||
            isGoingTo == '/splash') {
          return '/';
        }
      }

      return null;
    },
  );
});
