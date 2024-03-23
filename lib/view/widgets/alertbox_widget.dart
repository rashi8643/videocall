import 'package:flutter/material.dart';
import 'package:video_sample/view/widgets/call.dart';
import 'package:video_sample/view/widgets/textfield_widget.dart';

class ShowDialogWidget extends StatefulWidget {
  const ShowDialogWidget({super.key});
  @override
  State<ShowDialogWidget> createState() => _ShowDialogWidgetState();
}

class _ShowDialogWidgetState extends State<ShowDialogWidget> {
  final TextEditingController uidController = TextEditingController();
  bool _validateError = false;
  @override
  void dispose() {
    uidController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.amber,
      shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(30)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFieldWidget(
            controller: uidController,
            errorText: _validateError ? "uid is mandatory" : null,
          ),
          SizedBox(
            height: 16,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                minimumSize: const Size(double.infinity, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                join();
              },
              child: Text('Go'))
        ],
      ),
    );
  }

  Future<void> join() async {
    setState(() {
      uidController.text.isEmpty
          ? _validateError = true
          : _validateError = false;
    });
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MyCall(callID: uidController.text),
        ));
  }
}
