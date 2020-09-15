import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class ProviderModel with ChangeNotifier{
  // widget var
  Widget _passedWidget;

  // getter method
  Widget get passedWidget => _passedWidget;

  // setter method
   changeWidget(Widget value) {
    _passedWidget = value;
    notifyListeners();
  }

}
