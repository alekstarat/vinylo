
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_item_repository/shop_item_repository.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:vinylo/pages/home_page/blocs/database_bloc/database_bloc.dart';
import 'package:vinylo/pages/home_page/components/carousel_slider/carousel.dart';
import 'package:vinylo/pages/home_page/components/custom_divider.dart';
import 'package:vinylo/pages/home_page/components/shop_item/shop_item.dart';

class HomePageContent extends StatelessWidget {

  const HomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DatabaseBloc, DatabaseState>(
      builder: (context, state) {
        context.read<DatabaseBloc>().add(LoadDatabaseEvent());
        return SingleChildScrollView(
          child: Column(
            children: [
              const Carousel(),
              const CustomDivider(),
              if (state is DatabaseLoading) const CircularProgressIndicator(),
              if (state is DatabaseLoaded) 
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "ПОПУЛЯРНЫЕ ТОВАРЫ",
                            style: TextStyle(
                              color: ThemeProvider.themeOf(context).data.primaryColor,
                              fontSize: 20,
                              //fontWeight: FontWeight.bold,
                              fontFamily: "Ubuntu"
                            )
                          ),
                          
                          Icon(Icons.keyboard_arrow_right, color:  ThemeProvider.themeOf(context).data.primaryColor,)
                          
                        ],
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 270,
                      child: StreamBuilder(
                        stream: context.read<DatabaseBloc>().databaseRepository.getItems(), 
                        builder: (context, snapshot) {
                          List items = snapshot.data?.docs ?? [];
                          if (items.isEmpty) {
                            return const Center(child: Text("Нет пластинок!"));
                          } 
                          return ListView.separated(
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            separatorBuilder: (context, index) => const SizedBox(width: 16,),
                            itemCount: items.length,
                            
                            itemBuilder: (context, index) {
                              ShopItemModel item = items[index].data();
                              String itemId = items[index].id;
                              return ShopItem(
                                id: itemId, 
                                name: item.name, 
                                artist: item.artist, 
                                desc: item.desc, 
                                image: item.image, 
                                cost: item.cost.toDouble()
                              );
                            },
                          );
                        }
                      ),
                    ),
                  ],
                ),
              const CustomDivider(),
            ],
          ),
        );
      },
    );
  }
}
