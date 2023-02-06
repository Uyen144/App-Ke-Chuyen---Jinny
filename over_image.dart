import 'package:flutter/material.dart';

class OverImage extends StatelessWidget {
  Widget overImage;

  OverImage({required this.overImage});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: GestureDetector(
        child: Stack(
          alignment: Alignment(-1, 1),
          children: <Widget>[
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color.fromARGB(255, 218, 186, 186),
                    Color(0xffFF9494),
                  ],
                ),
              ),
              child: Container(
                child: ListTile(
                  title: Padding(
                    padding: EdgeInsets.only(left: 200, top: 20),
                    child: Column(
                      children: <Widget>[
                        Spacer(),
                        Text(
                          'Fairy tell',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 45,
                              fontFamily: 'Better'),
                        ),
                        Spacer(),
                        Text(
                          'for kids',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontFamily: 'Magic',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Container(child: overImage),
            ),
          ],
        ),
      ),
    );
  }
}
