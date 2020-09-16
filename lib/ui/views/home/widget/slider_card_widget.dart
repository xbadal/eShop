import 'dart:ui';

import 'package:flutter/material.dart';

class SliderCardWidget extends StatelessWidget {
  final String url;

  const SliderCardWidget({Key key, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        child: Stack(
          children: <Widget>[
            Image.network(
              '${url}',
              height: 300,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
            ),
          ],
        ),
      ),
    );
  }
}
