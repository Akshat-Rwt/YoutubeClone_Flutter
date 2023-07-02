import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Player extends StatefulWidget {
  String id;
  Player(this.id);
  

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {

late YoutubePlayerController _controller;

@override
  void initState() {
    // TODO: implement initState
    super.initState();

  _controller = YoutubePlayerController(
    initialVideoId: widget.id,
    flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
    ),
);

  }

bool _isPlayerReady= false ;
void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
  
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
    controller: _controller,
    showVideoProgressIndicator: true,
    
    onReady:  () {
        _controller.addListener(listener);
    },
);
  }
}