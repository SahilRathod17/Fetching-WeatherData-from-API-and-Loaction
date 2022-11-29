// ignore_for_file: prefer_const_constructors, unnecessary_string_escapes

import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class LoactionScreen extends StatefulWidget {
  @override
  State<LoactionScreen> createState() => _LoactionScreenState();
}

class _LoactionScreenState extends State<LoactionScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/loaction.jpg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.white, BlendMode.dstATop),
        ),
      ),
      constraints: BoxConstraints.expand(),
      child: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [],
          )
        ],
      )),
    );
  }
}
