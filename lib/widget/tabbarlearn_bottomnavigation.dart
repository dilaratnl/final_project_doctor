
import 'package:demo_firebase_setup/const/f%C4%B1nal_doctor_const.dart';
import 'package:demo_firebase_setup/view/doctor_appointment_list%20.dart';
import 'package:demo_firebase_setup/view/doctor_home.dart';
import 'package:demo_firebase_setup/view/doctor_message.dart';
import 'package:flutter/material.dart';

class NavigationBarLearn extends StatefulWidget {
  const NavigationBarLearn({super.key});

  @override
  State<NavigationBarLearn> createState() => _NavigationBarLearnState();
}

class _NavigationBarLearnState extends State<NavigationBarLearn> {
  int _selectedIndex = 0;
  List<Widget> _bottomList = [
    DoctorHome(),
    DoctorAppointmentList(),
    DoctorMessage(),
    DoctorHome(),
    DoctorHome(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      bottomNavigationBar: BottomNavigationBar(
          iconSize: 30,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: DoctorsConst.colorgrey,
          selectedItemColor: DoctorsConst.colorindigo,
          currentIndex: _selectedIndex,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month_outlined), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.mail_outline_sharp), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.supervisor_account), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined), label: '')
          ]),
      body: _bottomList.elementAt(_selectedIndex),
    );
  }
}
