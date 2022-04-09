import 'dart:convert';

import 'package:findhouseapp/models/place_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SpaceProvider extends ChangeNotifier {
  getRecomendedSpace() async {
    var url = Uri.parse('https://bwa-cozy.herokuapp.com/recommended-spaces');
    final response = await http.get(url);

    if(response.statusCode == 200) {
      List datas = jsonDecode(response.body);
      List<PlaceModel> places = datas.map((json) => PlaceModel.fromJson(json)).toList();
      return places;
    } else {
      return List<PlaceModel>;
    }
  }
}