import 'dart:io';
import 'package:demo_firebase_setup/const/f%C4%B1nal_doctor_const.dart';
import 'package:demo_firebase_setup/view/doctor_login.dart';
import 'package:demo_firebase_setup/widget/api_postmodal.dart';
import 'package:demo_firebase_setup/widget/subtitle_small.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DoctorAppointmentList extends StatefulWidget {
  const DoctorAppointmentList({super.key});

  @override
  State<DoctorAppointmentList> createState() => _DoctorAppointmentListState();
}

class _DoctorAppointmentListState extends State<DoctorAppointmentList> {
  List<PostModel>? _itemsModels;
  @override
  void initState() {
    super.initState();
    getpost();
  }

  Future<void> getpost() async {
    final baglanti =
        await Dio().get('https://jsonplaceholder.typicode.com/posts');
    var gelendeger = baglanti.statusCode;
    if (baglanti.statusCode == HttpStatus.ok) {
      final veri = baglanti.data;
      if (veri is List)
        setState(() {
          _itemsModels = veri.map((e) => PostModel.fromJson(e)).toList();
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: DoctorsConst.borderRadiusCircular30,
      child: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(100.0),
              child: AppBar(
                leading: IconButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => DoctorLogin(),
                      ));
                    },
                    icon: Icon(Icons.arrow_back_ios_new_rounded)),
                title: Text('Appointments List',
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(color: Colors.white)),
                actions: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.mail_outlined)),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.notifications_none_outlined))
                ],
              )),
          body: ListView.builder(
              itemCount: _itemsModels?.length ?? 0,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 4.5,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1.5),
                        borderRadius: DoctorsConst.borderRadiusCircular30,color: DoctorsConst.colorlightpurple),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 8, right: 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SubtitleSmall(
                                    text: 'Sat, 4 April 2020',
                                    color: DoctorsConst.colordarkgrey,
                                    fontSize: 15,
                                  ),
                                  DoctorsConst.sizedBoxWidht5,
                                  Container(
                                    height:
                                        MediaQuery.of(context).size.height / 70,
                                    color: Color.fromARGB(255, 54, 54, 54),
                                    width:
                                        MediaQuery.of(context).size.width / 800,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  SubtitleSmall(
                                    text: '3.15 PM',
                                    color: Color.fromARGB(255, 165, 165, 165),
                                    fontSize: 15,
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  CircleAvatar(
                                    maxRadius: 4,
                                    backgroundColor: Colors.green,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Online',
                                    style: Theme.of(context)
                                        .textTheme
                                        .overline
                                        ?.copyWith(
                                          color: Color.fromARGB(
                                              255, 165, 165, 165),
                                        ),
                                  ),
                                  Icon(
                                    Icons.more_vert,
                                    color: Color.fromARGB(255, 165, 165, 165),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        _line(context),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8, right: 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                        color: DoctorsConst.colorlightpurple,
                                        width: 3)),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image.asset(
                                      DoctorsConst.imageHomeDoctor,
                                      fit: BoxFit.cover,
                                    )),
                              ),
                              Column(crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _itemsModels?[index].title ?? '',
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue),
                                  ),
                                  SubtitleSmall(
                                    text: DoctorsConst.listArea,
                                    fontSize: 10,
                                    color: DoctorsConst.colorgrey,
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.blue,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  SubtitleSmall(
                                    text: 'Map',
                                    color: DoctorsConst.colorblue,
                                    fontSize: 15,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        _line(context),
                        SizedBox(
                          height: 1,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4, right: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.person_rounded,
                                    color: Colors.blue,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  SubtitleSmall(
                                      text: 'Dr. Jane HeartBreaker',
                                      color: DoctorsConst.colorblack,
                                      fontSize: 15),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    height:
                                        MediaQuery.of(context).size.height / 70,
                                    color: Colors.black,
                                    width:
                                        MediaQuery.of(context).size.width / 300,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  SubtitleSmall(
                                    text: 'Age : 29 Y',
                                    color: DoctorsConst.colorblack,
                                    fontSize: 15,
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                25,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                5.3,
                                        child: ElevatedButton(
                                            onPressed: () {},
                                            child: Text(
                                              'Completed',
                                              style: TextStyle(fontSize: 10),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Color.fromARGB(
                                                  158, 142, 255, 146),
                                            ))),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              })),
    );
  }

  Container _line(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 800,
      width: MediaQuery.of(context).size.width,
      color: Colors.black,
    );
  }
}
