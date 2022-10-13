
import 'package:demo_firebase_setup/const/f%C4%B1nal_doctor_const.dart';
import 'package:demo_firebase_setup/view/doctor_login.dart';
import 'package:demo_firebase_setup/widget/advert_detail_list.dart';
import 'package:flutter/material.dart';

class DoctorInfoOne extends StatefulWidget {
  const DoctorInfoOne({super.key});

  @override
  State<DoctorInfoOne> createState() => _DoctorInfoOneState();
}

class _DoctorInfoOneState extends State<DoctorInfoOne> {
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
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            MaterialButton(
              onPressed: () =>
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => DoctorLogin(),
              )),
              child: Text(
                DoctorsConst.infoTextButtonSkip,
                style: TextStyle(color: Colors.blue, fontSize: 20),
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20,left: 20,bottom: 30,right: 20),
          child: Column(children: [
            Expanded(
                child: PageView.builder(
                    controller: controller,
                    itemCount: listofvalue.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 100),
                        child: Column(
                          children: [Container(decoration:BoxDecoration(borderRadius: DoctorsConst.borderRadiusCircular20,color: Colors.amber) ,),
                            Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: DoctorsConst.borderRadiusCircular20),
                              color: Colors.amber,
                              child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            listofvalue[index].imagepath))),
                              ),
                            ),
                          ],
                        ),
                      );
                    })),
            DoctorsConst.sizedBoxHeigt30,
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('$currentpage/' + listofvalue.length.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(fontWeight: FontWeight.w500)),TextButton(
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
          ]),
        ));
  }
}
