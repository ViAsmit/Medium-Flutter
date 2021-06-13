import 'package:medium_flutter/enum/view_state.dart';
import 'package:medium_flutter/provider/getit.dart';
import 'package:medium_flutter/services/navigation_service.dart';
import 'package:flutter/material.dart';

class BaseModel extends ChangeNotifier {
  final navigationService = getIt<NavigationService>();
  ViewState _state = ViewState.Idle;

  ViewState get state => _state;
  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }
}
