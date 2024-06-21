import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:vinylo/pages/home_page/components/custom_divider.dart';
import 'package:vinylo/pages/home_page/pages/profile_page/components/custom_tile.dart';

class ProfilePageView extends StatelessWidget {
  final String? image, name, email, uid;

  const ProfilePageView(
      {super.key,
      required this.image,
      required this.name,
      required this.email,
      required this.uid});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: CircleAvatar(
                    radius: 65,
                    backgroundColor: Colors.grey.shade400,
                    child: image == null
                        ? const Icon(
                            Icons.person_outline,
                            color: Colors.white,
                            size: 65,
                          )
                        : Image(image: NetworkImage(image!))),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(
                  name ?? "",
                  style: TextStyle(
                      color: ThemeProvider.themeOf(context).data.primaryColor,
                      fontSize: 20,
                      fontFamily: "Ubuntu"),
                ),
              ),
              const CustomDivider(),
              CustomTile(icon: Icon(Icons.history, color: ThemeProvider.themeOf(context).data.primaryColor,), label: "История заказов"),
              const CustomDivider(),
              CustomTile(icon: Icon(Icons.payment_outlined, color: ThemeProvider.themeOf(context).data.primaryColor,), label: "Способ оплаты"),
              const CustomDivider(),
              CustomTile(icon: Icon(Icons.notifications_outlined, color: ThemeProvider.themeOf(context).data.primaryColor,), label: "Настройки уведомлений"),
              const CustomDivider(),
            ],
          ),
        );
  }
}
