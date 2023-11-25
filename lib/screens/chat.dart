import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tawk/flutter_tawk.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Surveyasia'),
      ),
      body: Tawk(
        directChatLink: 'YOUR_DIRECT_CHAT_LINK',
        visitor: TawkVisitor(
          name: 'Ayoub AMINE',
          email: 'ayoubamine2a@gmail.com',
        ),
      ),
    );
  }
}