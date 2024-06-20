import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shop_item_repository/shop_item_repository.dart';

// ignore: constant_identifier_names
const String ITEMS_COLLECTION_REF = "shop_items";

class DatabaseRepository{

  final _firestore = FirebaseFirestore.instance;
  late final CollectionReference _itemsRef;

  DatabaseRepository() {
    _itemsRef = _firestore.collection(ITEMS_COLLECTION_REF).withConverter<ShopItemModel>(
      fromFirestore: (snapshot, _) => ShopItemModel.fromJson(snapshot.data()!),
      toFirestore: (shopItem, _) => shopItem.toJson()
    );
  }

  Stream<QuerySnapshot> getItems() {
    return _itemsRef.snapshots();
  }

  void addItem(ShopItemModel item) async {
    _itemsRef.add(item);
  }

}