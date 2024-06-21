import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:vinylo/pages/home_page/pages/profile_page/profile_page.dart';
import 'package:vinylo/pages/login_page/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:vinylo/pages/login_page/login_page.dart';
import 'package:vinylo/pages/settings_page/settings_page.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {

    return Drawer(
      backgroundColor: ThemeProvider.themeOf(context).data.secondaryHeaderColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 16, top: 16),
            child: CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 50,
              child: Center(
                child: Icon(Icons.person_outline, color: Colors.white, size: 50,),
              ),
            ),
          ),
          const Divider(
            color: Colors.grey,
            indent: 16,
            endIndent: 16,
            height: 5,
          ),
          ListTile(
            title: Text("Профиль",
                style: TextStyle(
                  color: ThemeProvider.themeOf(context).data.primaryColor,
                  fontFamily: "Ubuntu"
                )),
            leading: Icon(
              CupertinoIcons.person_crop_circle,
              color: ThemeProvider.themeOf(context).data.primaryColor,
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilePage()));
            },
          ),
          const Divider(
            color: Colors.grey,
            indent: 16,
            endIndent: 48,
            height: 5,
          ),
          ListTile(
            title: Text("Настройки",
                style: TextStyle(
                  color: ThemeProvider.themeOf(context).data.primaryColor,
                  fontFamily: "Ubuntu"
                )),
            leading: Icon(
              CupertinoIcons.settings,
              color: ThemeProvider.themeOf(context).data.primaryColor,
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingsPage()));
            },
          ),
          const Divider(
            color: Colors.grey,
            indent: 16,
            endIndent: 48,
            height: 5,
          ),
          ListTile(
            title: Text("Помощь",
                style: TextStyle(
                  color: ThemeProvider.themeOf(context).data.primaryColor,
                  fontFamily: "Ubuntu"
                )),
            leading: Icon(
              CupertinoIcons.question_circle,
              color: ThemeProvider.themeOf(context).data.primaryColor,
            ),
            onTap: () {},
          ),
          const Divider(
            color: Colors.grey,
            indent: 16,
            endIndent: 16,
            height: 5,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.35,
          ),
          const Divider(
            color: Colors.grey,
            indent: 16,
            endIndent: 16,
            height: 5,
          ),
          BlocListener<SignInBloc, SignInState>(
            listener: (context, state) {},
            child: ListTile(
              title: const Text("Выйти",
                  style: TextStyle(
                    color: Colors.red,
                    fontFamily: "Ubuntu"
                  )),
              leading: const Icon(
                Icons.exit_to_app_outlined,
                color: Colors.red,
              ),
              onTap: () {
                  context.read<SignInBloc>().add(const SignOutRequired());
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
              },
            ),
          ),
          const Divider(
            color: Colors.grey,
            indent: 16,
            endIndent: 16,
            height: 5,
          ),
        ],
      ),
    );
  }
}
