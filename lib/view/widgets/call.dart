import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_sample/model/contants.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class MyCall extends StatelessWidget {
  const MyCall({Key? key, required this.callID}) : super(key: key);
  final String callID;

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Stack(
      children: [
        ZegoUIKitPrebuiltCall(
          appID: MyConst.appId,
          appSign: MyConst.appSign,
          userID: user.uid.toString(),
          userName: user.email.toString(),
          callID: callID,
          config: ZegoUIKitPrebuiltCallConfig.groupVideoCall(),
        ),
        Positioned(
          top: 30,
          left: 10,
          child: InkWell(
            onTap: () {
              Clipboard.setData(ClipboardData(text: callID));
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('UID copied to clipboard')),
              );
            },
            child: Text(
              'CallID :${callID}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
