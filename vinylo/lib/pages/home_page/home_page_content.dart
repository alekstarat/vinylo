
// ignore_for_file: unnecessary_const
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vinylo/pages/home_page/blocs/database_bloc/database_bloc.dart';
import 'package:vinylo/pages/home_page/components/carousel_slider/carousel.dart';
import 'package:vinylo/pages/home_page/components/custom_divider.dart';
import 'package:vinylo/pages/home_page/components/popular_items/popular_items.dart';
import 'package:vinylo/pages/home_page/components/recommended_items/recommended_items.dart';

class HomePageContent extends StatelessWidget {

  const HomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DatabaseBloc, DatabaseState>(
      builder: (context, state) {
        context.read<DatabaseBloc>().add(LoadDatabaseEvent());
        return const SingleChildScrollView(
          child: Column(
            children: [
              Carousel(),
              const CustomDivider(),
              const PopularItems(),
              const CustomDivider(),
              const RecommendedItems(),
              const CustomDivider(),
            ],
          ),
        );
      },
    );
  }
}
