import 'package:flutter/material.dart';
import 'package:video_sample/view/widgets/call.dart';

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const MyCall(callID: "1"),
              ),
            );
          },
          child: const Text("Join Call"),
        ),
      ),
    );
  }
}
