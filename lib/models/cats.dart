/*
 * Copyright (c) 2023 Kodeco LLC.
 *
 * Permission is hereby granted, free of charge, to any person
 * obtaining a copy of this software and associated documentation
 * files (the "Software"), to deal in the Software without
 * restriction, including without limitation the rights to use,
 * copy, modify, merge, publish, distribute, sublicense, and/or
 * sell copies of the Software, and to permit persons to whom
 * the Software is furnished to do so, subject to the following
 * conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * Notwithstanding the foregoing, you may not use, copy, modify,
 * merge, publish, distribute, sublicense, create a derivative work,
 * and/or sell copies of the Software in any work that is designed,
 * intended, or marketed for pedagogical or instructional purposes
 * related to programming, coding, application development, or
 * information technology. Permission for such use, copying,
 * modification, merger, publication, distribution, sublicensing,
 * creation of derivative works, or sale is expressly withheld.
 *
 * This project and source code may use libraries or frameworks
 * that are released under various Open-Source licenses. Use of
 * those libraries and frameworks are governed by their own
 * individual licenses.

 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 * HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 *
 */

/*
Breeds API result
{
    "adaptability": 5,
    "affection_level": 5,
    "alt_names": "",
    "cfa_url": "http://cfa.org/Breeds/BreedsAB/Abyssinian.aspx",
    "child_friendly": 3,
    "country_code": "EG",
    "country_codes": "EG",
    "dog_friendly": 4,
    "energy_level": 5,
    "experimental": 0,
    "grooming": 1,
    "hairless": 0,
    "health_issues": 2,
    "hypoallergenic": 0,
    "id": "abys",
    "indoor": 0,
    "intelligence": 5,
    "lap": 1,
    "life_span": "14 - 15",
    "name": "Abyssinian",
    "natural": 1,
    "origin": "Egypt",
    "rare": 0,
    "rex": 0,
    "shedding_level": 2,
    "short_legs": 0,
    "social_needs": 5,
    "stranger_friendly": 5,
    "suppressed_tail": 0,
    "temperament": "Active, Energetic, Independent, Intelligent, Gentle",
    "vcahospitals_url": "https://vcahospitals.com/know-your-pet/cat-breeds/abyssinian",
    "vetstreet_url": "http://www.vetstreet.com/cats/abyssinian",
    "vocalisation": 1,
    "weight": {
      "imperial": "7  -  10",
      "metric": "3 - 5"
    },
    "wikipedia_url": "https://en.wikipedia.org/wiki/Abyssinian_(cat)"
  },
 */

import 'package:json_annotation/json_annotation.dart';
part 'cats.g.dart';

@JsonSerializable()
class Breed {
  String id;
  String name;
  String description;
  String temperament;

  Breed({
    required this.id,
    required this.name,
    required this.description,
    required this.temperament
  });

  factory Breed.fromJson(Map<String, dynamic> json) => _$BreedFromJson(json);

  Map<String, dynamic> toJson() => _$BreedToJson(this);

}

@JsonSerializable()
class BreedList {
  List<Breed> breeds;

  BreedList({required this.breeds});
  factory BreedList.fromJson(final dynamic json) {
  return BreedList(
      breeds: (json as List<dynamic>)
          .map((dynamic e) => Breed.fromJson(e as Map<String, dynamic>))
          .toList());
}
}

@JsonSerializable()
class Cat {
  String name;
  String description;
  String life_span;

  Cat({required this.name,required this.description,required this.life_span});

  factory Cat.fromJson(Map<String, dynamic> json) => _$CatFromJson(json);

  Map<String, dynamic> toJson() => _$CatToJson(this);
}

@JsonSerializable()
class CatBreed {
  String id;
  String url;
  int width;
  int height;

  CatBreed({
    required this.id,
    required this.url,
    required this.width,
    required this.height
  });

  factory CatBreed.fromJson(Map<String, dynamic> json) {
    // 1
    try {
      final id =  json['id'] as String;
      final url =  json['url'] as String;
      final width = json['width'] as int;
      final height = json['height'] as int;
      return CatBreed(
        id: id,
        url: url,
        width: width,
        height: height,
      );
    } catch(e) {
      // 2
      return CatBreed(
        id: '',
        url: '',
        width: -1,
        height: -1,
      );
    }
  }
}

@JsonSerializable()
class CatList {
  List<CatBreed> breeds;

  CatList({required this.breeds});

  factory CatList.fromJson(dynamic json) {
  return CatList(
      breeds: (json as List<dynamic>)
          .map((dynamic e) => CatBreed.fromJson(e as Map<String, dynamic>))
          .toList());
}
}

T? tryCast<T>(dynamic object) => object is T ? object : null;