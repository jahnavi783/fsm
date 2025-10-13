import 'package:flutter/material.dart';

import 'ai/ai_assistance.dart';
import 'chat/chat_screen.dart';
import 'video/video_calling_page.dart';

class TechnicalAssistancePage extends StatelessWidget {
  const TechnicalAssistancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Technical Helpdesk")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => VideoCallingPage()));
              },
              label: Text("Live Video Call"),
              icon: Icon(Icons.video_call_outlined),
            ),
            SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LiveChatScreen()));
              },
              label: Text("Live Chat"),
              icon: Icon(Icons.chat_outlined),
            ),
            SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AIAssistanceScreen()));
              },
              label: Text("AI Assistance"),
              icon: Icon(Icons.notes),
            ),
          ],
        ),
      ),
    );
  }
}
