import 'package:get/get.dart';

class GetxBaseViewModel extends GetxController {
  String errorMessage;

  bool get hasError => errorMessage != null;
  bool _isBusy = false;

  bool get isBusy => _isBusy;

  Future<void> runFuture(Future<void> Function() body) async {
    try {
      setBusy(true);
      errorMessage = null;
      await body();
    // ignore: empty_catches, avoid_catches_without_on_clauses
    } catch (e) {
    } finally {
      setBusy(false);
    }
  }

  // ignore: avoid_positional_boolean_parameters
  void setBusy(bool value) {
    _isBusy = value;
    if (_isBusy) {
      errorMessage = null;
    }
    update();
  }
}
