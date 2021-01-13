import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:shopping_figma_one/src/model/brand_model.dart';
import 'package:shopping_figma_one/src/model/home_item_model.dart';
import 'package:shopping_figma_one/src/model/item_model.dart';

class SearchBloc {
  List<ItemModel> _searchResult = [
    ItemModel(
      id: 0,
      image: "assets/img/j_nike.png",
      companyImage: "assets/images/nike.svg",
      name: "Nike ISPA Overreact Sail Multi",
      type: "Lowest Ask",
      price: 233,
    ),
    ItemModel(
      id: 1,
      image: "assets/img/j_adidas.png",
      companyImage: "assets/images/adidas.svg",
      name: "adidas Yeezy Boost 700 MNVN Bone",
      type: "Lowest Ask",
      price: 373,
    ),
    ItemModel(
      id: 3,
      image: "assets/img/j_jordan.png",
      companyImage: "assets/images/jordan.svg",
      name: "Jordan 11 Retro Low White Concord (W)",
      type: "Lowest Ask",
      price: 194,
    ),
    ItemModel(
      id: 0,
      image: "assets/img/j_nike.png",
      companyImage: "assets/images/nike.svg",
      name: "Nike ISPA Overreact Sail Multi",
      type: "Lowest Ask",
      price: 233,
    ),
    ItemModel(
      id: 1,
      image: "assets/img/j_adidas.png",
      companyImage: "assets/images/adidas.svg",
      name: "adidas Yeezy Boost 700 MNVN Bone",
      type: "Lowest Ask",
      price: 373,
    ),
    ItemModel(
      id: 3,
      image: "assets/img/j_jordan.png",
      companyImage: "assets/images/jordan.svg",
      name: "Jordan 11 Retro Low White Concord (W)",
      type: "Lowest Ask",
      price: 194,
    ),
    ItemModel(
      id: 0,
      image: "assets/img/j_nike.png",
      companyImage: "assets/images/nike.svg",
      name: "Nike ISPA Overreact Sail Multi",
      type: "Lowest Ask",
      price: 233,
    ),
    ItemModel(
      id: 1,
      image: "assets/img/j_adidas.png",
      companyImage: "assets/images/adidas.svg",
      name: "adidas Yeezy Boost 700 MNVN Bone",
      type: "Lowest Ask",
      price: 373,
    ),
    ItemModel(
      id: 3,
      image: "assets/img/j_jordan.png",
      companyImage: "assets/images/jordan.svg",
      name: "Jordan 11 Retro Low White Concord (W)",
      type: "Lowest Ask",
      price: 194,
    ),
  ];

  final _searchFetcher = PublishSubject<List<ItemModel>>();

  Observable<List<ItemModel>> get allSearch => _searchFetcher.stream;

  fetchAllSearch() async {
    Timer(Duration(seconds: 1), () {
      _searchFetcher.sink.add(_searchResult);
    });
  }

  dispose() {
    _searchFetcher.close();
  }
}

SearchBloc searchBloc = SearchBloc();
