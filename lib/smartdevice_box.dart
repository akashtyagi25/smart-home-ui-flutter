import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class smartdevicebox extends StatelessWidget {
  final String smartdevicename;
  final String iconpath;
  final bool powerOn;

  void Function(bool)? onChanged;

   smartdevicebox({
    super.key,
    required this.smartdevicename,
    required this.iconpath,
    required this.powerOn,
    required this.onChanged
    
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          color: powerOn? Colors.grey.shade900:Colors.grey.shade200,
        borderRadius: BorderRadius.circular(24)
        ),
        
        child: Padding(
          padding: const  EdgeInsets.symmetric(vertical: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                 Image.asset(
                  iconpath,
                 height: 65,
                 color: powerOn?Colors.white:Colors.black),

                Padding(
                  padding:  EdgeInsets.only(left: 15.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                        smartdevicename,
                        style:  TextStyle(
                          fontWeight: FontWeight.bold,
                        
                          fontSize: 20,
                          color: powerOn?Colors.white:Colors.black
                          ),
                        )
                        ),
                      
                         Transform.rotate(
                          angle: pi/2,
                           child: CupertinoSwitch(
                            value: powerOn, 
                            onChanged: onChanged,
                            ),
                         ),
                      
                    ],
                  ),
                )
            ],
                 
          ),
        ),
        
      ),
    );
  }
}