import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:vinylo/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:vinylo/pages/home_page/pages/profile_page/profile_page_view.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              shape: Border(
                  bottom: BorderSide(
                      style: BorderStyle.solid,
                      color: ThemeProvider.themeOf(context).data.primaryColor)),
              backgroundColor:
                  ThemeProvider.themeOf(context).data.secondaryHeaderColor,
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () {}, 
                  icon: Icon(Icons.notifications_outlined, color: ThemeProvider.themeOf(context).data.primaryColor, size: 26)
                )
              ],
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: ThemeProvider.themeOf(context).data.primaryColor,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Text("Профиль",
                  style: TextStyle(
                      color: ThemeProvider.themeOf(context).data.primaryColor,
                      fontFamily: "Ubuntu",
                      fontWeight: FontWeight.bold)),
            ),
            body: StreamBuilder(
              stream: context.read<AuthenticationBloc>().userRepository.user,
              builder: (context, snapshot) {
                // ignore: avoid_print
                print(snapshot.data?.photoURL);
                // ignore: avoid_print
                print(snapshot.data?.email);

                return ProfilePageView(
                  image: snapshot.data?.photoURL,
                  name: snapshot.data?.displayName == ""
                      ? snapshot.data?.email
                      : snapshot.data?.displayName,
                  uid: snapshot.data?.uid,
                  email: snapshot.data?.email,
                );
              },
            ));
      },
    );
  }
}
