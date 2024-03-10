import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:transport/src/screens/auth/auth_screen.dart';
import 'package:transport/src/screens/book_service_screen.dart';
import 'package:transport/src/screens/profile_screen.dart';

import '../screens/auth/login_screen.dart';
import '../screens/home_screen.dart';
import '../screens/auth/signup_screen.dart';
import '../screens/service_screen.dart';

GoRouter goRouter = GoRouter(
  initialLocation: "/auth",
  routes: [
    GoRoute(
      path: "/splash",
      pageBuilder: (context, pageBuilder) {
        return CustomTransitionPage(
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0);
            const end = Offset.zero;
            const curve = Curves.ease;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 750),
          child: const AuthScreen(),
        );
      },
    ),
    GoRoute(
      path: "/auth",
      pageBuilder: (context, pageBuilder) {
        return CustomTransitionPage(
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0);
            const end = Offset.zero;
            const curve = Curves.ease;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 750),
          child: const AuthScreen(),
        );
      },
    ),
    GoRoute(
      path: "/login",
      pageBuilder: (context, pageBuilder) {
        return CustomTransitionPage(
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0);
            const end = Offset.zero;
            const curve = Curves.ease;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 750),
          child: const LoginScreen(),
        );
      },
    ),
    GoRoute(
      path: "/signup",
      pageBuilder: (context, pageBuilder) {
        return CustomTransitionPage(
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0);
            const end = Offset.zero;
            const curve = Curves.ease;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 750),
          child: const SignUpScreen(),
        );
      },
    ),
    GoRoute(
      path: "/",
      pageBuilder: (context, pageBuilder) {
        return CustomTransitionPage(
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0);
            const end = Offset.zero;
            const curve = Curves.ease;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 750),
          child: const MyHomePage(
            title: "",
          ),
        );
      },
    ),
    GoRoute(
      path: "/profile",
      pageBuilder: (context, pageBuilder) {
        return CustomTransitionPage(
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0);
            const end = Offset.zero;
            const curve = Curves.ease;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 750),
          child: const ProfileScreen(),
        );
      },
    ),
    GoRoute(
      path: "/services",
      pageBuilder: (context, pageBuilder) {
        return CustomTransitionPage(
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0);
            const end = Offset.zero;
            const curve = Curves.ease;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 750),
          child: const ServiceScreen(),
        );
      },
    ),
    GoRoute(
      path: "/book_service",
      pageBuilder: (context, pageBuilder) {
        return CustomTransitionPage(
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0);
            const end = Offset.zero;
            const curve = Curves.ease;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 750),
          child: const BookServiceScreen(),
        );
      },
    ),
  ],
);
