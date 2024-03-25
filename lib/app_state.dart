import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _activeMenu = 'clients';
  String get activeMenu => _activeMenu;
  set activeMenu(String value) {
    _activeMenu = value;
  }

  String _emailURL = 'https://unkk-kl1611.flutterflow.app/clientPropsalReview?';
  String get emailURL => _emailURL;
  set emailURL(String value) {
    _emailURL = value;
  }
}
