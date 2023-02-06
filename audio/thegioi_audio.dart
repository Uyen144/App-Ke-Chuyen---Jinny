import 'package:flutter/src/widgets/container.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

class AudioThegioi extends StatefulWidget {
  @override
  State<AudioThegioi> createState() => _AudioThegioiState();
}

class _AudioThegioiState extends State<AudioThegioi> {
  final player = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero; //audio dai bao nhieu giay?
  Duration position = Duration.zero; //dang play dc bao nhieu giay?

  @override
  void initState() {
    super.initState();
    loop();

    //playing, paused, stopped
    player.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });

    //duration
    player.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    //positon
    player.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  Future<void> loadFile() async {
    await player.setSource(AssetSource('audio/basoitoc.mp3'));
    await player.setVolume(1);
  }

  Future<void> loop() async {
    player.setReleaseMode(ReleaseMode.loop);
    player.setSource(AssetSource('audio/basoitoc.mp3'));
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  Future<void> stop() async {}

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return [if (duration.inHours > 0) hours, minutes, seconds].join(':');
  }

  @override
  Widget build(BuildContext context) {
    final settingsItemsAudioVietnam =
        ({required Widget child}) => Styled.widget(child: child);

    return Scaffold(
      backgroundColor: Color(0xffFFD1D1),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.only(right: 300),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Color(0xffFF9494),
                  size: 40,
                ),
              ),
            ),
            ClipRRect(
              child: Container(
                width: double.infinity,
                height: 400,
                child: Image.asset(
                  'assets/images/castle.png',
                ),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            const Text(
              'Ba sợi tóc vàng của quỷ',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Slider(
              thumbColor: Color(0xffFF9494),
              activeColor: Color(0xffFF9494),
              inactiveColor: Color(0xffFF9494),
              min: 0,
              max: duration.inSeconds.toDouble(),
              value: position.inSeconds.toDouble(),
              onChanged: (value) async {
                final position = Duration(seconds: value.toInt());
                await player.seek(position);
                await player.resume();
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(formatTime(position)),
                  Text(formatTime(duration)),
                ],
              ),
            ),
            CircleAvatar(
              backgroundColor: Color(0xffFF9494),
              radius: 35,
              child: IconButton(
                color: Colors.white,
                icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                iconSize: 40,
                onPressed: () async {
                  if (isPlaying) {
                    await player.pause();
                    print(duration);
                    print(position);
                  } else {
                    await player.resume();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
