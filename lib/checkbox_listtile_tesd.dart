import 'package:flutter/material.dart';

class check_tile extends StatefulWidget {
  const check_tile({super.key});

  @override
  State<check_tile> createState() => _check_tileState();
}

class _check_tileState extends State<check_tile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(20),
        color: Colors.grey.withOpacity(.5),
        child: CheckboxListTile(
          value: false,
          onChanged: (value) {
            value = true;
          },
          title: Text("zeyad"),
          subtitle: Text("ahmed"),
          checkboxShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
