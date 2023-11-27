import 'package:flutter/material.dart';

class UserInput extends StatelessWidget {
  final String label;
  final String hintText;
  final IconData icon;
  final TextEditingController controller;

  UserInput({required this.hintText, required this.icon, required this.label,required this.controller});

  static bool _isAlphanumeric(String value) {
    final alphanumericRegex = RegExp(r'^[a-zA-Z0-9]+$');
    return alphanumericRegex.hasMatch(value);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
       horizontal: 50
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 5),
            child: Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,

              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child:
                Row(
                  children: [
                    Icon(
                      icon,
                      color: Colors.black,
                    ),
                    SizedBox(width: 8.0),
                    Expanded(
                      child: TextFormField(
                        controller: controller,
                        validator:  (value) {
                          if(label=="Usuário"){
                            if (value == null || value.isEmpty || value.length > 20 || value.endsWith(' ')) {
                              return 'Digite um nome de usuário';
                            }
                            return null;
                          }
                          else{
                            if (value == null ||
                                value.isEmpty ||
                                value.length < 2 ||
                                value.length > 20 ||
                                value.endsWith(' ') ||
                                !_isAlphanumeric(value)){
                              return "Digite uma senha válida!";
                            }
                            return null;
                          }

                        },
                        decoration: InputDecoration(
                          hintText: hintText,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
          ),
        ],
      ),
    );
  }
}