import 'package:demo_firebase_setup/const/f%C4%B1nal_doctor_const.dart';
import 'package:flutter/material.dart';

class DoctorMessage extends StatefulWidget {
  const DoctorMessage({super.key});

  @override
  State<DoctorMessage> createState() => _DoctorMessageState();
}

class _DoctorMessageState extends State<DoctorMessage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DoctorsConst.colorlightpurple,
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            DoctorsConst.message,
            style: Theme.of(context).textTheme.headline6?.copyWith(
                color: DoctorsConst.colorpurple,
                fontWeight: FontWeight.bold,
                fontSize: 25),
          ),
          DoctorsConst.sizedBoxHeigt40,
          Icon(
            Icons.sentiment_satisfied_outlined,
            color: DoctorsConst.colorOrange,size: 50,
          )
        ],
      )),
    );
  }
}
