import 'package:shopping_figma_one/src/model/brand_model.dart';
import 'package:shopping_figma_one/src/model/item_model.dart';

class HomeItemModel {
  List<ItemModel> justDropped;
  List<ItemModel> mostPopular;
  List<ItemModel> recommended;
  List<ItemModel> newLowest;
  List<ItemModel> newHighest;
  List<BrandModel> popularBrand;

  HomeItemModel({
    this.justDropped,
    this.mostPopular,
    this.recommended,
    this.newLowest,
    this.newHighest,
    this.popularBrand,
  });
}
