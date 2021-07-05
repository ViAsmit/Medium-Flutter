import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:medium_flutter/config/app_config.dart' as app;
import 'package:medium_flutter/provider/state_management.dart';
import 'package:medium_flutter/src/widgets/textField.dart';
import 'package:medium_flutter/src/widgets/toobar.dart';
import 'package:provider/provider.dart';

class TextEditor extends StatefulWidget {
  TextEditor({Key key}) : super(key: key);

  @override
  _TextEditorState createState() => _TextEditorState();
}

class _TextEditorState extends State<TextEditor> {
  bool showToolbar = false;
  TextEditingController titleCtl = TextEditingController();
  TextEditingController textCtl = TextEditingController();
  String imgLink = "";

  @override
  void initState() {
    super.initState();
    KeyboardVisibilityNotification().addNewListener(
      onChange: (isVisible) {
        if (!isVisible) {
          FocusScope.of(context).unfocus();
        }
        setState(() {
          showToolbar = isVisible;
        });
      },
    );
  }

  @override
  void dispose() {
    KeyboardVisibilityNotification().dispose();
    super.dispose();
  }

  void PublishArticle(state) {
    print(state);
  }

  Future<String> _showModal(BuildContext context) async {
    TextEditingController imgCtl = TextEditingController();
    await showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                  20.0, 20.0, 20.0, 0.0), // content padding
              child: Container(
                height: 200,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50.0, vertical: 20.0),
                        child: TextField(
                          autofocus: true,
                          controller: imgCtl,
                          decoration:
                              InputDecoration(hintText: "Paste Image URL"),
                        ),
                      ),
                      ElevatedButton(
                        child: const Text('Close BottomSheet'),
                        onPressed: () => Navigator.pop(context),
                      )
                    ],
                  ),
                ),
              ),
            ) // From with TextField inside
            ,
          ),
        );
      },
    );
    return imgCtl.text;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<EditorProvider>(
      create: (context) => EditorProvider(),
      builder: (context, child) {
        return SafeArea(
          child: Scaffold(
            body: Stack(
              children: <Widget>[
                Positioned(
                  top: 16,
                  left: 0,
                  right: 0,
                  bottom: 56,
                  child: Consumer<EditorProvider>(builder: (context, state, _) {
                    return Column(
                      children: [
                        Focus(
                          child: SmartTextField(
                            controller: titleCtl,
                            hint: "Title",
                            type: SmartTextType.H1,
                          ),
                        ),
                        Focus(
                          child: SmartTextField(
                            controller: textCtl,
                            hint: "Text",
                            type: SmartTextType.H2,
                          ),
                        ),
                        Divider(),
                        Container(
                          width: double.infinity,
                          height: app.App(context).appHeight(30),
                          decoration: BoxDecoration(
                            border: Border.all(width: 2.0),
                          ),
                          child: (imgLink != "")
                              ? GestureDetector(
                                  onTap: () async {
                                    String link = await _showModal(context);
                                    setState(() {
                                      imgLink = link;
                                    });
                                  },
                                  child: Image.network(imgLink),
                                )
                              : IconButton(
                                  onPressed: () async {
                                    String link = await _showModal(context);
                                    setState(() {
                                      imgLink = link;
                                    });
                                  },
                                  icon: Icon(Icons.add),
                                ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: state.length,
                            itemBuilder: (context, index) {
                              return Focus(
                                onFocusChange: (hasFocus) {
                                  if (hasFocus)
                                    state.setFocus(state.typeAt(index));
                                },
                                child: SmartTextField(
                                  type: state.typeAt(index),
                                  controller: state.textAt(index),
                                  focusNode: state.nodeAt(index),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  }),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Selector<EditorProvider, SmartTextType>(
                    selector: (buildContext, state) => state.selectedType,
                    builder: (context, selectedType, _) {
                      return Toolbar(
                        selectedType: selectedType,
                        onSelected:
                            Provider.of<EditorProvider>(context, listen: false)
                                .setType,
                        onPublish: () {
                          Provider.of<EditorProvider>(context, listen: false)
                              .getData(titleCtl.text, textCtl.text, imgLink,
                                  context);
                        },
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
