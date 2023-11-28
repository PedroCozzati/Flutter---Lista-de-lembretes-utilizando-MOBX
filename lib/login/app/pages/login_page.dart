import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/utils/get_screen_size.dart';

import '../controllers/store.dart';
import '../widgets/login_button.dart';
import '../widgets/privacy_policy_link.dart';
import '../widgets/user_input.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final userStore = UserStore();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async=>exit(0),
      child: Scaffold(
        body:
        Builder(
            builder: (BuildContext context) {
              return SingleChildScrollView(
                  child: GestureDetector(
                    onTap: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                    child:
                    Container(
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
                          Padding(padding: EdgeInsets.all(DeviceInfo.screenHeight/20)),

                          Form(
                            key: _formKey,
                            child:
                            Column(
                              children: [
                                Padding(padding: EdgeInsets.all(DeviceInfo.screenHeight/20)),
                                UserInput(
                                  controller:_usernameController,
                                  hintText: "Digite seu nome de usuário",
                                  icon: Icons.person,
                                  label: "Usuário",
                                ),
                                UserInput(
                                  controller:_passwordController,
                                  hintText: "Digite sua senha",
                                  icon: Icons.lock,
                                  label: "Senha",
                                ),
                              ],
                            ),
                          ),
                          LoginButton(
                            text: 'Entrar',

                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                String username = _usernameController.text;
                                String password = _passwordController.text;

                                bool result = await userStore.login(username, password);

                                userStore.loginHandler(result,context);

                              }else{
                                if (kDebugMode) {
                                  print("nao validado");
                                }
                              }
                            },
                          ),
                          Padding(padding: EdgeInsets.all(DeviceInfo.screenHeight/20)),
                          PrivacyPolicyLink(
                            text: 'Política de privacidade',
                          ),
                           Padding(padding: EdgeInsets.all(DeviceInfo.screenHeight/20)),
                        ],
                      ),
                    ),
                  )
              );
            }
        ),
        resizeToAvoidBottomInset: false,
      ),
    );
  }
}