// ignore_for_file: constant_identifier_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shop_item_repository/shop_item_repository.dart';
import 'package:shop_item_repository/src/models/user_converter.dart';

const String ITEMS_COLLECTION_REF = "shop_items";


class DatabaseRepository{

  final _firestore = FirebaseFirestore.instance;
  late final CollectionReference _itemsRef;
  final userCollection = FirebaseFirestore.instance.collection("users");
  
  DatabaseRepository() {
    _itemsRef = _firestore.collection(ITEMS_COLLECTION_REF).withConverter<ShopItemModel>(
      fromFirestore: (snapshot, _) => ShopItemModel.fromJson(snapshot.data()!),
      toFirestore: (shopItem, _) => shopItem.toJson()
    );
  }

  Stream<QuerySnapshot> getItems() {
    return _itemsRef.snapshots();
  }

  Stream<DocumentSnapshot<Object?>> getOrders(String? id) {
    return userCollection.doc(id).withConverter<OrderModel>(
      fromFirestore: (snapshot, _) => OrderModel.fromJson(snapshot.data()!), 
      toFirestore: (orderItem, _) => orderItem.toJson()
    ).snapshots();
  }

  Stream<DocumentSnapshot<Object?>> getPayments(String? id) {
    return userCollection.doc(id).withConverter<UserConverter>(
      fromFirestore: (snapshot, _) => UserConverter.fromJson(snapshot.data()!), 
      toFirestore: (userItem, _) => userItem.toJson()
    ).snapshots();
  }

  void addItem(ShopItemModel item) async {
    _itemsRef.add(item);
  }

}