import 'package:flutter/widgets.dart';

import '../../../product/constants/temp_data.dart';
import '../../../product/models/car_search_item.dart';

class SearchViewModel extends ChangeNotifier {
  List<CarSearchItemModel> items = [];
  List<String> selectedPaths = [];
  bool _isResultPage = false;
  bool get isResultPage => _isResultPage;
  set isResultPage(bool value) {
    _isResultPage = value;
    notifyListeners();
  }

  GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  SearchViewModel({required this.listKey});

  initPage() {
    resetAllAndBuildList(TempData.carSearchItems1);
  }

  void resetAllAndBuildList(List<CarSearchItemModel> newItems) async {
    int oldCount = items.length;
    if (oldCount > 0) {
      for (var i = 0; i < oldCount; i++) {
        listKey.currentState!.removeItem(0, (context, animation) => Container(),
            duration: Duration.zero);
        await Future.delayed(const Duration(milliseconds: 20));
      }
    }

    items.clear();
    items.addAll(newItems);
    int count = items.length;
    if (count > 0) {
      for (var i = 0; i < count; i++) {
        listKey.currentState!
            .insertItem(i, duration: const Duration(milliseconds: 20));
        // await Future.delayed(const Duration(milliseconds: 20));
      }
    }
    notifyListeners();
  }

  void addToPath(CarSearchItemModel model) {
    selectedPaths.add(model.title);
    if (model.children.isEmpty) {
      isResultPage = true;
    } else {
      resetAllAndBuildList(model.children);
    }
  }
}
