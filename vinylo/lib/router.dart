import 'package:vinylo/pages/auth/accaunt_screen.dart';
import 'package:vinylo/pages/auth/login_screen.dart';
import 'package:vinylo/pages/auth/reset_password_screen.dart';
import 'package:vinylo/pages/auth/signup_screen.dart';
import 'package:vinylo/pages/auth/verify_email_screen.dart';
import 'package:vinylo/pages/catalog.dart';
import 'package:vinylo/pages/main_screen.dart';
import 'package:vinylo/pages/settings.dart';

final routes = {
  '/': (context) => const MainScreen(),
  '/settings': (context) => const Settings(),
  '/catalog': (context) => const Catalog(),
  '/account': (context) => const AccountScreen(),
  '/login': (context) => const LoginScreen(),
  '/signup': (context) => const SignUpScreen(),
  '/reset_password': (context) => const ResetPasswordScreen(),
  '/verify_email': (context) => const VerifyEmailScreen(),
};
