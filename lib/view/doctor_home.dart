
import 'package:demo_firebase_setup/const/f%C4%B1nal_doctor_const.dart';
import 'package:demo_firebase_setup/widget/home_container_imagetext.dart';
import 'package:demo_firebase_setup/widget/title_large.dart';
import 'package:flutter/material.dart';

class DoctorHome extends StatefulWidget {
  const DoctorHome({super.key});

  @override
  State<DoctorHome> createState() => _DoctorHomeState();
}

class _DoctorHomeState extends State<DoctorHome> {
  final double _height = 3.2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DoctorsConst.colorlightgrey,
      body: SingleChildScrollView(
        child: Padding(
          padding: DoctorsConst.paddingGeneral8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _appBarContainerIconText(context),
              DoctorsConst.sizedBoxHeigt15,
              _rowContainerCalenderFolder(),
              DoctorsConst.sizedBoxHeigt10,
              _rowContainerRequestsMessages(),
              DoctorsConst.sizedBoxHeigt10,
              TitleLarge(
                  text: DoctorsConst.homeTitleDiscover,
                  color: DoctorsConst.colorblack,
                  fontSize: 18),
              DoctorsConst.sizedBoxHeigt10,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _cardTextImage(),
                  SizedBox(
                    height: 190,
                    width: 185,
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: DoctorsConst.borderRadiusCircular15),
                      color: DoctorsConst.colorlightgrey,
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: DoctorsConst.borderRadiusCircular10,
                              child: Image.asset(
                                DoctorsConst.imageHomeDoctor,
                                fit: BoxFit.cover,
                              ),
                            ),
                            DoctorsConst.sizedBoxHeigt5,
                            TitleLarge(
                                text: DoctorsConst.homeCoronaTitleTwo,
                                color: DoctorsConst.colorblack,
                                fontSize: 12)
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  SizedBox _cardTextImage() {
    return SizedBox(
      height: 190,
      width: 180,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
            borderRadius: DoctorsConst.borderRadiusCircular15),
        color: DoctorsConst.colorlightgrey,
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: DoctorsConst.borderRadiusCircular10,
                child: Image.asset(
                  DoctorsConst.imageHomeDoctor,
                  fit: BoxFit.contain,
                ),
              ),
              DoctorsConst.sizedBoxHeigt5,
              TitleLarge(
                  text: DoctorsConst.homeCoronaTitle,
                  color: DoctorsConst.colorblack,
                  fontSize: 14)
            ],
          ),
        ),
      ),
    );
  }

  Container _appBarContainerIconText(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / _height,
      decoration: const BoxDecoration(
          gradient:
              LinearGradient(colors: [Colors.indigo, Colors.indigoAccent]),
          borderRadius: BorderRadius.only(
              topLeft: DoctorsConst.radius30, topRight: DoctorsConst.radius30)),
      child: Padding(
          padding: DoctorsConst.paddingGeneral8,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DoctorsConst.sizedBoxHeigt20,
                _rowTextIconHelloMail(context),
                DoctorsConst.sizedBoxHeigt20,
                _containerColumnRowTextIcon(context),
              ])),
    );
  }

  Padding _rowContainerRequestsMessages() {
    return Padding(
      padding: DoctorsConst.paddingGeneral8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:const [
          ContainerImageText(
              text: DoctorsConst.homeRepairTitle,
              textone: DoctorsConst.homeRepairSubtitle,
              image: DoctorsConst.imageHomeRepair,
              colorcontainer: DoctorsConst.colorwhite,
              color: DoctorsConst.colorblack,
              colorone: DoctorsConst.colorindigo),
          ContainerImageText(
              text: DoctorsConst.homeReminderTitle,
              textone: DoctorsConst.homeReminderSubtitle,
              image: DoctorsConst.imageHomeReminder,
              colorcontainer: DoctorsConst.colorwhite,
              color: DoctorsConst.colorblack,
              colorone: DoctorsConst.colorindigo)
        ],
      ),
    );
  }

  Padding _rowContainerCalenderFolder() {
    return Padding(
      padding: DoctorsConst.paddingGeneral8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ContainerImageText(
              text: DoctorsConst.homeCalenderTitle,
              textone: DoctorsConst.homeCalenderSubtitle,
              image: DoctorsConst.imageHomeCalendar,
              colorcontainer: DoctorsConst.colorindigoaccent,
              color: DoctorsConst.colorwhite,
              colorone: DoctorsConst.colorwhite),
          ContainerImageText(
              text: DoctorsConst.homeFolderTitle,
              textone: DoctorsConst.homeFolderSubtitle,
              image: DoctorsConst.imageHomeFolder,
              colorcontainer: DoctorsConst.colorwhite,
              color: DoctorsConst.colorblack,
              colorone: DoctorsConst.colorindigo)
        ],
      ),
    );
  }

  Container _containerColumnRowTextIcon(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: DoctorsConst.borderRadiusCircular10,
        color: DoctorsConst.colorwhite,
      ),
      height: MediaQuery.of(context).size.height / 12,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: DoctorsConst.paddingGeneral8,
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    DoctorsConst.homeContainerSubtitle,
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                        color: DoctorsConst.colordarkgrey, fontSize: 14),
                  ),
                  DoctorsConst.sizedBoxHeigt10,
                  TitleLarge(
                      text: DoctorsConst.homeContainerTitle,
                      color: DoctorsConst.colorblack,
                      fontSize: 17)
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width / 5.5,
                decoration: BoxDecoration(
                    borderRadius: DoctorsConst.borderRadiusCircular15,
                    gradient: LinearGradient(colors: [
                      DoctorsConst.colorindigo,
                      DoctorsConst.colorindigoaccent
                    ])),
                child: Icon(
                  Icons.arrow_forward,
                  color: DoctorsConst.colorwhite,
                  size: 30,
                ),
              )
            ]),
      ),
    );
  }

  Row _rowTextIconHelloMail(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [_rowTextHelloIcon(context), _rowIconMail()],
    );
  }

  Row _rowIconMail() {
    return Row(
      children: [
        Icon(Icons.mail_outline_sharp, color: DoctorsConst.colorwhite),
        DoctorsConst.sizedBoxWidht10,
        Icon(Icons.notification_add_rounded, color: DoctorsConst.colorwhite)
      ],
    );
  }

  Column _rowTextHelloIcon(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          DoctorsConst.homeHello,
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(color: DoctorsConst.colorwhite, fontSize: 15),
        ),
        DoctorsConst.sizedBoxHeigt10,
        Row(
          children: [
            Text(DoctorsConst.homeSean,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline5?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: DoctorsConst.colorwhite)),
            DoctorsConst.sizedBoxWidht5,
            Icon(
              Icons.waving_hand_rounded,
              color: Colors.amber,
            )
          ],
        )
      ],
    );
  }
}
