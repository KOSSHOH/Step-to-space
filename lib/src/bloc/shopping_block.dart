import 'package:rxdart/rxdart.dart';

class ShoppingBloc {
  final _shoppingFetcher = PublishSubject<String>();

  Observable<String> get allShopping => _shoppingFetcher.stream;

  fetchAllShopping(String size) async {
    _shoppingFetcher.sink.add(size);
  }

  dispose() {
    _shoppingFetcher.close();
  }
}

ShoppingBloc shoppingBloc = ShoppingBloc();
