import 'package:flutter/material.dart';

class UserInput extends StatelessWidget {
  final String hintText;
  final FocusNode focus;
  final TextEditingController controller;
  final onSubmitted;

  UserInput({required this.hintText, required this.controller, required this.onSubmitted, required this.focus});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Expanded(
              child: TextFormField(
                focusNode: focus,
                onFieldSubmitted:onSubmitted ,
                textAlign: TextAlign.center,
                controller: controller,
                style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Digite um texto";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: hintText,
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
