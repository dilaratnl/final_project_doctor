import 'package:demo_firebase_setup/const/f%C4%B1nal_doctor_const.dart';
import 'package:demo_firebase_setup/widget/advert_detail_list.dart';
import 'package:flutter/material.dart';

class DoctorInfoDeneme extends StatefulWidget {
  const DoctorInfoDeneme({super.key});

  @override
  State<DoctorInfoDeneme> createState() => _DoctorInfoDenemeState();
}

class _DoctorInfoDenemeState extends State<DoctorInfoDeneme> {
  var controller = PageController();
  int currentpage = 0;
  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        currentpage = controller.page!.toInt();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 300),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      DoctorsConst.borderRadiusCircular30)),
                          onPressed: () {},
                          child: Text(DoctorsConst.infoTextButtonSkip,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(
                                      color: DoctorsConst.colorblue,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18)))
                    ]),
              ),
              Column(children: [
                PageView.builder(
                    controller: controller,
                    itemCount: listofvalue.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: Column(children: [
                          Image.asset(
                            DoctorsConst.imageInfoOne,
                            fit: BoxFit.contain,
                            height: MediaQuery.of(context).size.height / 3,
                          ),
                          DoctorsConst.sizedBoxHeigt20,
                          Text(
                            DoctorsConst.infoTwoTitle,
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: DoctorsConst.colorblack,
                                    fontSize: 25),
                          ),
                          DoctorsConst.sizedBoxHeigt10,
                          Text(
                            DoctorsConst.infoTwoSubtitle,
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2
                                ?.copyWith(
                                    color: DoctorsConst.colordarkgrey,
                                    fontSize: 20),
                          )
                        ]),
                      );
                    })
              ]),
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 20, bottom: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(DoctorsConst.infoTextNumber,
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                            color: DoctorsConst.colorblack,
                            fontWeight: FontWeight.w400,
                            fontSize: 18)),
                    TextButton(
                        style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    DoctorsConst.borderRadiusCircular30)),
                        onPressed: () {},
                        child: Text(DoctorsConst.infoTextButtonNext,
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                ?.copyWith(
                                    color: DoctorsConst.colorblack,
                                    fontWeight: FontWeight.w600)))
                  ],
                ),
              )
            ]),
      ),
    );
  }
}
