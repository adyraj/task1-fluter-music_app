import 'package:AV_Media/ui/video.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

AudioPlayer audioPlayer = new AudioPlayer();
var ap = new AudioCache(fixedPlayer: audioPlayer);

playonline() async {
  ap.clearCache();
  await ap.play('note.wav');
}

pause() {
  audioPlayer.pause();
}

stop() {
  audioPlayer.stop();
}


var myHome = DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.orange.shade300,
            actions: <Widget>[Icon(Icons.search,size: 28,)],
            leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.white,
              size: 28,
            ),
            onPressed: () {},
          ),
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.audiotrack, size: 28, color: Colors.white)),
                Tab(icon: Icon(Icons.music_video, size: 28, color: Colors.white)),
              ],
              indicatorColor: Colors.white,
            ),
            title: Text('Music Hub',
            style: TextStyle(
                color: Colors.white, fontFamily: "Nexa", fontSize: 28,)),
        centerTitle: true,),
          body: TabBarView(
            children: [
              Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 90),
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.orange.shade300,
              borderRadius: BorderRadius.circular(50),
              //shape: BoxShape.circle,
            ),
          ),       
          InkWell(
            child: Container(
              margin: EdgeInsets.only(top: 140),
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
              ),
              child: Image.asset('images/myimg.png',),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 460),
            width: 290,
            height: 65,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.orange.shade300, width: 3.0),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  onPressed: pause,
                  child: Icon(
                    Icons.pause,
                    color: Colors.orange.shade400,
                  ),
                ),
                FlatButton(
                  onPressed: playonline,
                  child: Icon(Icons.play_circle_filled,
                      size: 61, color: Colors.orange.shade400),
                ),
                FlatButton(
                  onPressed: stop,
                  child: Icon(Icons.stop, color: Colors.orange.shade400),
                ),
              ],
            ),
          ),
        ],
              ),
              Container(
                margin: EdgeInsets.all(30),
                width: 300,
                height: 300,
                decoration: BoxDecoration(
              color: Colors.orange.shade300,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
                    padding: const EdgeInsets.only(
                      left: 29,
                      right: 29,
                      top: 40,
                      bottom: 40,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: new SamplePlayer(),
                  ),
              ),
             ],           
          ),
          ),
        );

home() {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: myHome,
  );
}