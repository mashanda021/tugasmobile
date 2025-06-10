import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../models/bmi_category.dart';

class BmiService {
  /// Mengambil daftar kategori BMI dari file lokal JSON
  static Future<List<BmiCategory>> fetchCategories() async {
    final jsonStr = await rootBundle.loadString('assets/bmi_categories.json');
    final List data = json.decode(jsonStr);
    return data
        .map((item) => BmiCategory.fromJson(item as Map<String, dynamic>))
        .toList();
  }
}