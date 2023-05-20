import 'dart:async';

class SearchBloc {
  final _searchController = StreamController<bool>.broadcast();

  Stream<bool> get searchStream => _searchController.stream;

  void startSearch() {
    _searchController.sink.add(true);
  }

  void stopSearch() {
    _searchController.sink.add(false);
  }

  void dispose() {
    _searchController.close();
  }
}
