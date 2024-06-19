import 'package:vinylo/pages/catalog.dart';
import 'package:vinylo/pages/main_screen.dart';
import 'package:vinylo/pages/reg_screen.dart';
import 'package:vinylo/pages/settings.dart';
import 'package:vinylo/pages/user_screen.dart';

final routes = {
  '/': (context) => const MainScreen(),
  '/reg': (context) => const RegScreen(),
  '/user': (context) => const UserProfile(),
  '/settings': (context) => const Settings(),
  '/catalog': (context) => const Catalog(),
};
