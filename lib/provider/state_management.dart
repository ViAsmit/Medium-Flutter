import 'package:flutter/material.dart';
import 'package:medium_flutter/services/api_services.dart';
import 'package:medium_flutter/services/prefs_services.dart';
import 'package:medium_flutter/src/widgets/textField.dart';

// import 'text_field.dart';

class EditorProvider extends ChangeNotifier {
  List<FocusNode> _nodes = [];
  List<TextEditingController> _text = [];
  List<SmartTextType> _types = [];
  SmartTextType selectedType;

  EditorProvider({SmartTextType defaultType = SmartTextType.T}) {
    selectedType = defaultType;
    insert(index: 0);
  }

  int get length => _text.length;
  int get focus => _nodes.indexWhere((node) => node.hasFocus);
  FocusNode nodeAt(int index) => _nodes.elementAt(index);
  TextEditingController textAt(int index) => _text.elementAt(index);
  SmartTextType typeAt(int index) => _types.elementAt(index);

  void setType(SmartTextType type) {
    if (selectedType == type) {
      selectedType = SmartTextType.T;
    } else {
      selectedType = type;
    }
    _types.removeAt(focus);
    _types.insert(focus, selectedType);
    notifyListeners();
  }

  void setFocus(SmartTextType type) {
    selectedType = type;
    notifyListeners();
  }

  void insert({int index, String text, SmartTextType type = SmartTextType.T}) {
    final TextEditingController controller =
        TextEditingController(text: '\u200B' + (text ?? ''));
    controller.addListener(() {
      if (!controller.text.startsWith('\u200B')) {
        final int index = _text.indexOf(controller);
        if (index > 0) {
          textAt(index - 1).text += controller.text;
          textAt(index - 1).selection = TextSelection.fromPosition(TextPosition(
              offset: textAt(index - 1).text.length - controller.text.length));
          nodeAt(index - 1).requestFocus();
          _text.removeAt(index);
          _nodes.removeAt(index);
          _types.removeAt(index);
          notifyListeners();
        }
      }
      if (controller.text.contains('\n')) {
        final int index = _text.indexOf(controller);
        List<String> _split = controller.text.split('\n');
        controller.text = _split.first;
        insert(
            index: index + 1,
            text: _split.last,
            type: typeAt(index) == SmartTextType.BULLET
                ? SmartTextType.BULLET
                : SmartTextType.T);
        textAt(index + 1).selection =
            TextSelection.fromPosition(TextPosition(offset: 1));
        nodeAt(index + 1).requestFocus();
        notifyListeners();
      }
    });
    _text.insert(index, controller);
    _types.insert(index, type);
    _nodes.insert(index, FocusNode());
  }

  void getData(
      String title, String text, String imgLink, BuildContext context) async {
    ApiService _apiService = ApiService();
    Prefs _prefs = Prefs();
    String uid = await _prefs.getUid();

    var description = "";
    for (int i = 0; i < _text.length; i++) {
      description += _text[i].text + "\n";
    }
    print(description);
    Map<String, dynamic> data = {
      "title": title,
      "text": text,
      "claps": 0.toString(),
      "description": description,
      "feature_img": imgLink,
      "author_id": uid,
    };
    print(data);
    final response =
        await _apiService.postArticleMethod(endpoint: "/posts", data: data);
    if (!response.error) {
      print(response.data);
      Navigator.of(context).pushNamedAndRemoveUntil("/", (route) => false);
    } else {
      print("========");
      print(response.data);
      print("========");
      print(response.errorMessage);
      print("========");
    }
  }
}
