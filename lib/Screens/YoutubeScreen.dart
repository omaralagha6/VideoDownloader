import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeScreen extends StatefulWidget {
  const YoutubeScreen({Key? key}) : super(key: key);

  @override
  State<YoutubeScreen> createState() => _YoutubeScreenState();
}

class _YoutubeScreenState extends State<YoutubeScreen> {
  late YoutubePlayerController _controller;
  late TextEditingController _idController;
  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;

  double _volume = 100;
  bool _muted = false;
  bool _isPlayerReady = false;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: "",
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);
    _idController = TextEditingController();
    _videoMetaData = const YoutubeMetaData();
    _playerState = PlayerState.unknown;
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    _idController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return YoutubePlayerBuilder(
        onExitFullScreen: () {
          SystemChrome.setPreferredOrientations(DeviceOrientation.values);
        },
        player: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.blueGrey,
          topActions: [
            const SizedBox(width: 8.0),
            Expanded(
              child: Text(
                _controller.metadata.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.settings, color: Colors.white, size: 25.0),
              onPressed: () {
                log('Settings Tapped!');
              },
            ),
          ],
          onReady: () {
            _isPlayerReady:
            true;
          },
        ),
        builder: (context, player) {
          return Scaffold(
            body: ListView(
              children: [
                 TextField(
                    enabled: _isPlayerReady,
                    controller: _idController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter youtube \<video id\> or \<link\>',
                      fillColor: Colors.blueGrey.withAlpha(20),
                      filled: true,
                      hintStyle: const TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.blueGrey,
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () => _idController.clear(),
                      ),
                    ),
                  ),
                player,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _space,
                        _text('Title', _videoMetaData.title),
                        _space,
                        _text('Channel', _videoMetaData.author),
                        _space,
                        _text('Video Id', _videoMetaData.videoId),
                        _space,
                        Row(
                          children: [
                            _text(
                              'PlayBack Quality',
                              _controller.value.playbackQuality ?? '',
                            ),
                            const Spacer(),
                            _text(
                              'Playback Rate',
                              '${_controller.value.playbackRate}x ',
                            )
                          ],
                        ),
                      ]),
                 )
              ],
            ),
          );
        });
  }

  Widget get _space => const SizedBox(height: 10);
  Widget _text(String title, String value) {
    return RichText(
      text: TextSpan(
        text: '$title : ',
        style: const TextStyle(
          color: Colors.blueAccent,
          fontWeight: FontWeight.bold,
        ),
        children: [
          TextSpan(
            text: value,
            style: const TextStyle(
              color: Colors.blueAccent,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}
