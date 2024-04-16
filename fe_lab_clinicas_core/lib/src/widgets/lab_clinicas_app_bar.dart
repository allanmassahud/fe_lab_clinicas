// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';

class LabClinicasAppBar extends AppBar{
  LabClinicasAppBar({super.key, List<Widget>? actions}) :super(
    toolbarHeight: 72,
    backgroundColor: Colors.transparent,
    actions: actions,
    flexibleSpace: Container(
      alignment: Alignment.centerLeft,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0, 1),
            blurRadius: 4
          )
        ]
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 64),
        child: Image.asset("assets/images/logo_horizontal.png"),
      ),
    ), 
  );

}