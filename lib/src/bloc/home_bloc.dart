import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:shopping_figma_one/src/model/brand_model.dart';
import 'package:shopping_figma_one/src/model/home_item_model.dart';
import 'package:shopping_figma_one/src/model/item_model.dart';

class HomeBloc {
  List<ItemModel> _justDropped = [
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

  List<ItemModel> _mostPopular = [
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
  List<ItemModel> _recommended = [
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
  List<ItemModel> _newLowest = [
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
  List<ItemModel> _newHighest = [
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

  List<BrandModel> _popularBrand = [
    BrandModel(
      image: "assets/images/nike.svg",
      name: "NIKE",
      type: "All 601",
    ),
    BrandModel(
      image: "assets/images/adidas.svg",
      name: "Adidas",
      type: "All 601",
    ),
    BrandModel(
      image: "assets/images/vans.svg",
      name: "Vans",
      type: "All 601",
    ),
    BrandModel(
      image: "assets/images/vans.svg",
      name: "Balenciaga",
      type: "All 601",
    ),
    BrandModel(
      image: "assets/images/jordan.svg",
      name: "Jordan",
      type: "All 601",
    ),
  ];

  final _homeFetcher = PublishSubject<HomeItemModel>();

  Observable<HomeItemModel> get allHome => _homeFetcher.stream;

  fetchAllHome() async {
    Timer(Duration(seconds: 1), () {
      _homeFetcher.sink.add(HomeItemModel(
        justDropped: _justDropped,
        mostPopular: _mostPopular,
        recommended: _recommended,
        newLowest: _newLowest,
        newHighest: _newHighest,
        popularBrand: _popularBrand,
      ));
    });
  }

  dispose() {
    _homeFetcher.close();
  }
}

HomeBloc homeBloc = HomeBloc();
