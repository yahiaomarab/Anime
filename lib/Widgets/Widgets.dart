import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Data/Model/Model.dart';

Widget Item(context, QuoteModel model) {
  return Container(
    padding: EdgeInsets.all(30),
    margin: EdgeInsets.all(30),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      color: Colors.green[300],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${model.anime}',
          style: TextStyle(color: Colors.black),
        ),
        SizedBox(
          height: 10,
        ),
        Text('${model.character} '),
        SizedBox(
          height: 10,
        ),
        Text('${model.quote}'),
      ],
    ),
  );
}
