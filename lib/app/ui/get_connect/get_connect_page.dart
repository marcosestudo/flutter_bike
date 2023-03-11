import 'package:flutter/material.dart';
import 'package:flutter_bike_finder/app/controllers/get_connect_controller.dart';
import 'package:get/get.dart';

class GetConnectPage extends GetView<GetConnectCoontroller> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GetConnect Page')),
      body: Container(
        child: Text('GetConnect Body'),
      ),
    );
  }
}