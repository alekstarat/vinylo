import 'package:flutter/material.dart';
<<<<<<< Updated upstream
import 'package:vinylo/app.dart';
=======
import 'package:user_repository/user_repository.dart';
import 'package:vinylo/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
>>>>>>> Stashed changes

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< Updated upstream
    return const App();
=======
    return App(FirebaseUserRepo());
>>>>>>> Stashed changes
  }
}
