import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:xino_hackathon/screens/home.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class ChatScreen extends StatefulWidget {
  final String name;
  final String room;
  ChatScreen(this.name, this.room);
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffffa36c),
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => {
            //flutterWebviewPlugin.close();
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Home()))
          },
        ),
      ),
      initialChild: Container(
        child: Center(
                child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Color(0xffffa36c)),),
      )),
      url:
          'http://airona.herokuapp.com/chat.html?username=${widget.name}&room=${widget.room}',
      resizeToAvoidBottomInset: true,
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     backgroundColor: Color(0xffffa36c),
    //     elevation: 0.0,
    //     leading: IconButton(
    //       icon: Icon(Icons.arrow_back_ios, color: Colors.white),
    //       onPressed: () => {
    //         Navigator.pushReplacement(
    //             context, MaterialPageRoute(builder: (context) => Home()))
    //       },
    //     ),
    //   ),
    // body: WebView(
    //   javascriptMode: JavascriptMode.unrestricted,
    //   initialUrl: 'http://airona.herokuapp.com/chat.html?username=wrrer&room=rwer',
    // ),
    //resizeToAvoidBottomInset: false,
    // );
  }
}
