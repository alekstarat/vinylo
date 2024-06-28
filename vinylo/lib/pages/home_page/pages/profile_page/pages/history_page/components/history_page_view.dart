import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_item_repository/shop_item_repository.dart';
import 'package:vinylo/blocs/authentication_bloc/authentication_bloc.dart';

class HistoryPageView extends StatelessWidget {
  const HistoryPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: context.read<AuthenticationBloc>().userRepository.user,
      builder: (context, snapshotUser) {
        return StreamBuilder<QuerySnapshot<Object?>>(
          stream: context.read<DatabaseRepository>().getOrders(snapshotUser.data?.uid),
          builder: (context, snapshot) {

            return SizedBox(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Text("");
                }
              ),
            );
          }
        );
      }
    );
  }
}