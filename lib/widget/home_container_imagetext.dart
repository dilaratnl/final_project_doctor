
import 'package:demo_firebase_setup/const/f%C4%B1nal_doctor_const.dart';
import 'package:flutter/material.dart';

class ContainerImageText extends StatelessWidget {
  const ContainerImageText(
      {super.key,
      required this.text,
      required this.textone,
      required this.image,
      required this.colorcontainer,
      required this.color,
      required this.colorone});
  final String text;
  final String textone;
  final String image;
  final colorcontainer;
  final color;
  final colorone;
  final double _height6 = 6;
  final double _width2 = 2.2;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: DoctorsConst.borderRadiusCircular10,
        color: colorcontainer,
      ),
      height: MediaQuery.of(context).size.height / _height6,
      width: MediaQuery.of(context).size.width / _width2,
      child: Padding(
          padding: DoctorsConst.paddingGeneral4,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  image,
                  height: MediaQuery.of(context).size.height / 12,
                  width: MediaQuery.of(context).size.width / 9,
                ),
                Text(text,
                    style: Theme.of(context).textTheme.headline5?.copyWith(
                        color: color,
                        fontWeight: FontWeight.bold,
                        fontSize: 13)),
                DoctorsConst.sizedBoxHeigt5,
                Text(
                  textone,
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(color: color, fontSize: 10),
                ),
                Divider(
                    height: 15,
                    thickness: 5,
                    indent: 0,
                    endIndent: 140,
                    color: colorone)
              ])),
    );
  }
}
