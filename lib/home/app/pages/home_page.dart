import 'dart:io';

import 'package:flutter/material.dart';
import 'package:test_flutter/utils/get_screen_size.dart';

import '../controllers/data_store.dart';
import '../widgets/dialog.dart';
import '../widgets/privacy_policy_link.dart';
import '../widgets/user_input.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _textController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final FocusNode textFieldFocus = FocusNode();
  bool isEditing = false;
  int editIndex = 0;
  DataStore dataStore = DataStore();

  @override
  void initState() {
    dataStore.loadPreferences();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => exit(0),
      child: Scaffold(
        body: Builder(builder: (BuildContext context) {
          return SingleChildScrollView(
              child: GestureDetector(
            onTap: () {},
            child: Container(
              height: DeviceInfo.screenHeight,
              width: DeviceInfo.screenWidth,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(30, 78, 98, 1),
                    Color.fromRGBO(45, 149, 142, 1)
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // const Padding(padding: EdgeInsets.all(10)),
                  Observer(
                    builder: (context) => SizedBox(
                      width: DeviceInfo.screenWidth,
                      height: DeviceInfo.screenHeight / 2.3,
                      child: Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.elliptical(10, 150),
                                bottomRight: Radius.elliptical(10, 150),
                                topLeft: Radius.elliptical(10, 150),
                                topRight: Radius.elliptical(10, 150)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 1,
                                offset: const Offset(
                                    0, 1), // changes position of shadow
                              ),
                            ],
                          ),
                          child: ListView.separated(
                            itemCount: dataStore.itemList.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Center(
                                      child: Text(
                                    dataStore.itemList[index],
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  )),
                                ),
                                trailing: SizedBox(
                                  width: DeviceInfo.screenWidth / 4.5,
                                  child: Row(
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.edit),
                                        onPressed: () {
                                          FocusScope.of(context)
                                              .requestFocus(textFieldFocus);
                                          isEditing = true;
                                          editIndex = index;
                                        },
                                      ),
                                      IconButton(
                                        icon: const Icon(
                                          Icons.close_rounded,
                                          color: Colors.red,
                                          size: 30,
                                        ),
                                        onPressed: () {
                                          DeleteDialog dialog = DeleteDialog(
                                            itemName: dataStore.itemList[index],
                                            index: index,
                                            store:dataStore
                                          );
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return dialog;
                                            },
                                          );
                                          // FocusScope.of(context).requestFocus(FocusNode());
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const Divider();
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: UserInput(
                      focus: textFieldFocus,
                      hintText: "Digite seu texto",
                      controller: _textController,
                      onSubmitted: (value) {
                        if (isEditing) {
                          if (_formKey.currentState!.validate()) {
                            dataStore.editItem(editIndex, _textController.text);
                            _textController.clear();
                            isEditing = false;
                          }
                        } else {
                          if (_formKey.currentState!.validate()) {
                            dataStore.addItem(_textController.text);
                            _textController.clear();
                          }
                        }
                      },
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(120)),
                ],
              ),
            ),
          ));
        }),
        resizeToAvoidBottomInset: true,
      ),
    );
  }
}
