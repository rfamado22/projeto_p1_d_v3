// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:projeto_p1/Views/View1.dart';
import 'package:projeto_p1/Views/View2.dart';
import 'package:projeto_p1/Views/View3.dart';
import 'package:projeto_p1/model/Lista.dart';


 
void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MainApp(),
    ),
  );
}
 
class MainApp extends StatelessWidget {
  const MainApp({super.key});
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lista de Compras RFA',
      home:PrincipalView(),
    );
  }
}
