import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';
import '../over_image.dart';
import 'vietnam_screen.dart';
import 'thegioi_screen.dart';
import 'package:lottie/lottie.dart';

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final page = ({required Widget child}) => Styled.widget(child: child)
        .padding(vertical: 30, horizontal: 20)
        .constrained(minHeight: MediaQuery.of(context).size.height - (2 * 30))
        .scrollable();

    return <Widget>[
      Row(
        children: [
          Spacer(),
          Text(
            'jinny',
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 80,
              fontFamily: 'BubbleBobble',
              color: Color(0xffFF9494),
            ),
          )
        ],
      ).alignment(Alignment.center).padding(bottom: 20),
      UserCard(),
      Settings(),
      FinalCard(),
    ].toColumn().parent(page);
  }
}

class UserCard extends StatelessWidget {
  // Widget _buildUserRow() {
  //   return <Widget>[

  //     <Widget>[
  //       Text(
  //         'Fairy tell',
  //         textAlign: TextAlign.center,
  //         style: TextStyle(
  //             color: Colors.white, fontSize: 55, fontFamily: 'Better'),
  //       ).padding(bottom: 5),
  //       Text(
  //         'for kids',
  //         textAlign: TextAlign.center,
  //         style: TextStyle(
  //           color: Colors.white,
  //           fontSize: 35,
  //           fontFamily: 'Magic',
  //           fontWeight: FontWeight.bold,
  //         ),
  //       ),
  //     ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
  //   ].toRow();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(),
      child: OverImage(
        overImage: Image.asset(
          'assets/images/mouse.png',
          width: 250,
        ),
      ),
    );
  }
}

class SettingsItemModel {
  final IconData icon;
  final Color color;
  final String title;
  final String description;
  const SettingsItemModel({
    required this.color,
    required this.description,
    required this.icon,
    required this.title,
  });
}

const List<SettingsItemModel> settingsItems = [
  SettingsItemModel(
    icon: Icons.book,
    color: Color(0xffFF9494),
    title: 'Truyện cổ tích Việt Nam',
    description: 'Nghe ngay',
  ),
  SettingsItemModel(
    icon: Icons.book,
    color: Color.fromARGB(255, 153, 46, 214),
    title: 'Truyện cổ tích thế giới',
    description: 'Nghe ngay',
  ),
];

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) => settingsItems
      .map((settingsItem) => SettingsItem(
            settingsItem.icon,
            settingsItem.color,
            settingsItem.title,
            settingsItem.description,
          ))
      .toList()
      .toColumn();
}

class SettingsItem extends StatefulWidget {
  SettingsItem(this.icon, this.iconBgColor, this.title, this.description);

  final IconData icon;
  final Color iconBgColor;
  final String title;
  final String description;

  @override
  _SettingsItemState createState() => _SettingsItemState();
}

class _SettingsItemState extends State<SettingsItem> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    final settingsItem =
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
              shadowColor: Color(0x30000000),
            ) // shadow borderRadius
            .constrained(height: 80)
            .padding(vertical: 10) // margin
            .gestures(
              // onTapChange: (tapStatus) => setState(() => pressed = tapStatus),
              onTapDown: (details) => print('tapDown'),
              onTap: () => {
                if (widget.title == 'Truyện cổ tích Việt Nam')
                  {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Vietnam(),
                      ),
                    )
                  }
                else if (widget.title == 'Truyện cổ tích thế giới')
                  {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Thegioi(),
                      ),
                    )
                  }
              },
            )
            //.scale(pressed ? 0.95 : 1.0, animate: true)
            .animate(Duration(milliseconds: 150), Curves.easeOut);

    final Widget icon = Icon(widget.icon, size: 20, color: Colors.white)
        .padding(all: 12)
        .decorated(
          color: widget.iconBgColor,
          borderRadius: BorderRadius.circular(30),
        )
        .padding(left: 15, right: 10);

    final Widget title = Text(
      widget.title,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    ).padding(bottom: 5);

    final Widget description = Text(
      widget.description,
      style: TextStyle(
        color: Colors.black26,
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
    );

    return settingsItem(
      child: <Widget>[
        icon,
        <Widget>[
          title,
          description,
        ].toColumn(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ].toRow(),
    );
  }
}

class FinalCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      child: Lottie.network(
          'https://assets4.lottiefiles.com/packages/lf20_gSMVZV7ZdZ.json'),
    );
  }
}
