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

import 'package:flutter/material.dart';
import 'dart:convert';
import '../api/cat_api.dart';
import '../models/cats.dart';

class CatInfo extends StatefulWidget {
  final String catBreed;
  final String catId;

  CatInfo({required this.catBreed, required this.catId});

  @override
  State<CatInfo> createState() => _CatInfoState();
}

class _CatInfoState extends State<CatInfo> {
  CatList catList = CatList(breeds: List.empty());
  void getCatData() async {
    final catJson = await CatAPI().getCatBreed(widget.catId);

    final dynamic catMap = json.decode(catJson);

    setState(() {
      catList = CatList.fromJson(catMap);
    });
  }

  @override
  void initState() {
    super.initState();
    getCatData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.catBreed),
        ),
        body: getCat());
  }

  Widget getCat() {
    final mediaSize = MediaQuery.of(context).size;
    if (catList.breeds.isEmpty) {
      return Container();
    } else {
      return Center(
        child: Container(
          width: mediaSize.width,
          height: mediaSize.height,
          // 1
          decoration: BoxDecoration(
              image: DecorationImage(
            // 2
            image: NetworkImage(catList.breeds[0].url), fit: BoxFit.contain,
          )),
        ),
      );
    }
  }
}
