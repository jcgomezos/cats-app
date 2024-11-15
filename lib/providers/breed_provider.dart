import 'package:flutter/material.dart';
import 'package:kitties_app/models/cat.dart';
import 'package:kitties_app/models/cat_response.dart';

class BreedProvider with ChangeNotifier {

  List<CatResponse> _breedResponse = [];
  List<Cat> _catResponse = [];
  

  List<CatResponse> get breedResponse => _breedResponse;
  List<Cat> get catResponse => _catResponse;

  set breedResponse (List<CatResponse> response){
    _breedResponse = response;
    notifyListeners();
  }
  set catResponse (List<Cat> response){
    _catResponse = response;
    notifyListeners();
  }
}