import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DifficultyLevel {
  String id;
  String name;

  DifficultyLevel(this.id, this.name);

  static List<DifficultyLevel> getDifficultyLevel() {
    return <DifficultyLevel>[
      DifficultyLevel('all', 'الكل'),
      DifficultyLevel('beginner', 'مبتدئ'),
      DifficultyLevel('intermediate', 'متوسط'),
      DifficultyLevel('advanced', 'متقدم'),
    ];
  }
}

class PriceFilter {
  String id;
  String name;

  PriceFilter(this.id, this.name);

  static List<PriceFilter> getPriceFilter() {
    return <PriceFilter>[
      PriceFilter('all', 'الكل'),
      PriceFilter('free', 'مجاني'),
      PriceFilter('paid', 'مدفوع'),
    ];
  }
}

class Language {
  int? id;
  String? value;
  String? displayedValue;
  Language(
      {@required this.id, @required this.value, @required this.displayedValue});
}

class Languages with ChangeNotifier {
  List<Language> _items = [];

  List<Language> get items {
    return [..._items];
  }

  Future<void> fetchLanguages() async {
    var url = '$BASE_URL/api/languages';
    try {
      final response = await http.get(Uri.parse(url));
      final extractedData = json.decode(response.body) as List;
      // if (extractedData.length != 0) {
      //   return;
      // }
      final List<Language> loadedLanguages = [];
      // print(extractedData);
      for (var langData in extractedData) {
        loadedLanguages.add(
          Language(
            id: langData['id'],
            value: langData['value'],
            displayedValue: langData['displayedValue'],
          ),
        );
      }
      _items = loadedLanguages;
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }
}
