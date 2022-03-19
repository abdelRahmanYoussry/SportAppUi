import 'package:adham_tasks/Shared/AppCubit/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ChatsScreen extends StatelessWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: 25,),
            chatWidget(context: context)
          ],
        ),
      )
    );
  }
}
