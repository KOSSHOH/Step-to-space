import 'package:rxdart/rxdart.dart';
import 'package:shopping_figma_one/src/model/card_model.dart';
import 'package:shopping_figma_one/src/utils/repository.dart';

class CardBloc {
  final _repository = Repository();
  final _cardFetcher = PublishSubject<List<CardModel>>();

  Observable<List<CardModel>> get allCard => _cardFetcher.stream;

  fetchAllCard() async {
    List<CardModel> database = await _repository.databaseItem();
    _cardFetcher.sink.add(database);
  }

  fetchSaveCard(CardModel card) async {
    int index = await _repository.databaseItemSave(card);
  }

  dispose() {
    _cardFetcher.close();
  }
}

CardBloc cardBloc = CardBloc();
