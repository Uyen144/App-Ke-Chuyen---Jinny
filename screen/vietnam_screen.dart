import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_randomcolor/flutter_randomcolor.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:jinny_test1/audio/vietnam_audio.dart';

//class khoi tao color background
class Vietnam extends StatelessWidget {
  //Color(0xffeac7d0),
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color(0xffFF9494),
            Color(0xffFFD1D1),
          ],
        ),
      ),
      child: Column(
        children: <Widget>[
          Spacer(),
          Container(
            alignment: Alignment.bottomLeft,
            padding: EdgeInsets.only(top: 7, right: 300),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
            ),
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 40,
              ),
            ),
          ),
          Container(
            height: 250,
            child: Image.asset(
              'assets/images/house.png',
            ),
          ),
          Container(
            height: 506.7,
            width: 400,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(36), topLeft: Radius.circular(36)),
            ),
            child: SettingsVietnam(),
          ),
        ],
      ),
    );
  }
}

//danh sach title[i]
//danh sach title[i] luon thay doi len k dung 'const' truoc List
List<SettingsItemModelVietnam> settingsItemsVietnam = [
  SettingsItemModelVietnam(title: 'Tấm Cám', icon: Icons.book),
  SettingsItemModelVietnam(title: 'Thạch Sanh(null)', icon: Icons.book),
  SettingsItemModelVietnam(title: 'Sọ Dừa(null)', icon: Icons.book),
  SettingsItemModelVietnam(title: 'Cây tre trăm đốt(null)', icon: Icons.book),
];

//class khoi tao va constructor bien title
class SettingsItemModelVietnam {
  final String title;
  final IconData icon;
  SettingsItemModelVietnam({required this.title, required this.icon});
}

//
class SettingsVietnam extends StatelessWidget {
  @override
  Widget build(BuildContext context) => settingsItemsVietnam
      .map((settingItemsVietnam) =>
          SettingsItem(settingItemsVietnam.title, settingItemsVietnam.icon))
      .toList()
      .toColumn(); //import package Styled
}

class SettingsItem extends StatefulWidget {
  SettingsItem(this.title, this.icon);
  final String title;

  final IconData icon;
  @override
  _SettingsItemStateVietnam createState() => _SettingsItemStateVietnam();
}

//class Widget cua List title
class _SettingsItemStateVietnam extends State<SettingsItem> {
  bool pressed =
      false; //ko khoi tao + khai bao thi 'pressed ? 0 : 20,' se bi loi
  @override
  Widget build(BuildContext context) {
    final settingItemsVietnam =
        ({required Widget child}) => Styled.widget(child: child)
                .alignment(Alignment.center)
                .borderRadius(all: 15)
                .ripple()
                .backgroundColor(Colors.white, animate: true)
                .clipRRect(all: 25) // clip ripple
                .borderRadius(all: 25, animate: true)
                .elevation(
                  pressed ? 0 : 20,
                  borderRadius: BorderRadius.circular(25),
                  shadowColor: Colors.black54,
                ) // shadow borderRadius
                .constrained(height: 40)
                .padding(vertical: 7, left: 10, right: 10) //padding giua cac o
                .gestures(
              onTap: (() {
                if (widget.title == 'Tấm Cám') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AudioVietnam(),
                    ),
                  );
                } else if (widget.title == 'Tấm Cám') {
                } else if (widget.title == 'Tấm Cám') {
                } else if (widget.title == 'Tấm Cám') {}
              }),
            ).animate(Duration(milliseconds: 150), Curves.easeOut);

    final Widget icon = Icon(widget.icon, size: 20, color: Colors.white)
        .padding(all: 5)
        .decorated(
          color: Color(0xffFF9494),
          borderRadius: BorderRadius.circular(20),
        )
        .padding(left: 15, right: 10);
    //decor title
    final Widget title = Text(
      widget.title,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );

    return settingItemsVietnam(
      child: <Widget>[
        icon,
        <Widget>[
          title,
        ].toColumn(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ].toRow(),
    );
  }
}
