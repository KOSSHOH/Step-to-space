import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:shopping_figma_one/src/model/brand_model.dart';
import 'package:shopping_figma_one/src/model/home_item_model.dart';
import 'package:shopping_figma_one/src/model/item_model.dart';
import 'package:shopping_figma_one/src/model/story_model.dart';

class StoryBloc {
  List<StoryModel> _list = [
    StoryModel(
      image: "assets/images/1.png",
      name: "Welcome X-S-Store",
      title: "X-S-Store",
      type: "image",
    ),
    StoryModel(
      image: "assets/images/2.png",
      name: "Nike Adapt BB Unboxing - Futuristic Self Lacing Sneakers",
      type: "video",
      userImage: "assets/images/user2.png",
      userName: "Unbox Therapy",
      viewCount: "949K",
      time: "3 min ago",
    ),
    StoryModel(
      image: "assets/images/3.png",
      name:
          "Nike Alphafly Next% Full & Final Review | Carbon Fiber Plate Marathon Shoe",
      type: "live",
      userImage: "assets/images/user3.png",
      userName: "fideletty",
      viewCount: "32.4K",
      time: "3 min ago",
    ),
    StoryModel(
      image: "assets/images/4.png",
      name: "About\nJordan 1 Mid Chicago Toe",
      type: "not",
      userImage: "assets/images/user4.png",
      userName: "TheOffWhiteDealer",
      viewCount: "32.4K",
      time: "3 min ago",
    ),
  ];

  final _storyFetcher = PublishSubject<List<StoryModel>>();

  Observable<List<StoryModel>> get allStory => _storyFetcher.stream;

  fetchAllStory() async {
    Timer(Duration(milliseconds: 1500), () {
      _storyFetcher.sink.add(_list);
    });
  }

  dispose() {
    _storyFetcher.close();
  }
}

StoryBloc storyBloc = StoryBloc();
