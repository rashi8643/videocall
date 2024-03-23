import 'package:flutter/material.dart';
import 'package:video_sample/model/contants.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

import '../pages/login.dart';

class MyCall extends StatelessWidget {
  const MyCall({Key? key, required this.callID}) : super(key: key);
  final String callID;

  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltCall(
      appID: MyConst
          .appId, 
      appSign: MyConst
          .appSign,
      userID: FirebaseAuth.instance.currentUser!.uid.toString(),
      userName: 'aa',
      callID: callID,
     
      config: ZegoUIKitPrebuiltCallConfig.groupVideoCall(),
      
    );
  }
}
