import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:shopping_figma_one/src/model/size_model.dart';

class SizeBloc {
  final _sizeFetcher = PublishSubject<List<SizeModel>>();

  Observable<List<SizeModel>> get allSize => _sizeFetcher.stream;

  List<SizeModel> list = [
    SizeModel("4", 0),
    SizeModel("4.5", 280),
    SizeModel("5", 0),
    SizeModel("5.5", 0),
    SizeModel("6", 280),
    SizeModel("6.5", 280),
    SizeModel("7", 280),
    SizeModel("7.5", 0),
    SizeModel("8", 280),
    SizeModel("8.5", 280),
    SizeModel("9", 280),
    SizeModel("9.5", 0),
    SizeModel("10", 280),
    SizeModel("10.5", 0),
    SizeModel("11", 280),
    SizeModel("11.5", 280),
    SizeModel("12", 280),
    SizeModel("12.5", 0),
  ];

  fetchAllSize() async {
    Timer(Duration(milliseconds: 100), () {
      _sizeFetcher.sink.add(list);
    });
  }

  dispose() {
    _sizeFetcher.close();
  }
}

SizeBloc sizeBloc = SizeBloc();
