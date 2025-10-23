import 'dart:ui';

import 'package:flutter/material.dart';

class BackgroundCustom extends StatelessWidget {
  final Widget child;
  BackgroundCustom({super.key,
  required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,     
          colors: 
            [ 
            Color.fromARGB(255, 7, 7, 7), 
            Color.fromARGB(255, 25, 25, 25), 
            Color.fromARGB(255, 74, 89, 141), 
            Color.fromARGB(255, 133, 151, 205), 
            Color.fromARGB(255, 115, 136, 184), 
            Color.fromARGB(255, 110, 128, 195), 
          ]
          ,
        ),
      ),
      child: child,
    );
  }
}


