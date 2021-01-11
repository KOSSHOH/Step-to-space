import 'dart:async';
import 'package:shopping_figma_one/src/database/database_helper_card.dart';
import 'package:shopping_figma_one/src/model/card_model.dart';

class Repository {
  DatabaseHelperCard databaseHelper = new DatabaseHelperCard();

  Future<List<CardModel>> databaseItem() => databaseHelper.getProduct();
}
