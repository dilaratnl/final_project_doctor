import 'package:demo_firebase_setup/const/f%C4%B1nal_doctor_const.dart';
import 'package:demo_firebase_setup/view/doctor_home.dart';
import 'package:demo_firebase_setup/widget/auth_services.dart';
import 'package:demo_firebase_setup/view/doctor_newlogin.dart';
import 'package:demo_firebase_setup/widget/tabbarlearn_bottomnavigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class DoctorLogin extends StatefulWidget {
  const DoctorLogin({super.key});

  @override
  State<DoctorLogin> createState() => _DoctorLoginState();
}

String? _sifre = "123456";
String? _email = "deneme@hotmail.com";

class _DoctorLoginState extends State<DoctorLogin> {
  //final String _imageInfoTwo = 'assets/images/doctor_info_two.png';
  final double _height4 = 4;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 30),
        child: Center(
          child: SingleChildScrollView(
            child: Column(//mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
              Image.asset(DoctorsConst.imageInfoTwo,
                  height: MediaQuery.of(context).size.height / _height4,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.contain), 
              Text(DoctorsConst.loginTitle,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline5?.copyWith(
                      fontWeight: FontWeight.bold, color: DoctorsConst.colorblack)),
              DoctorsConst.sizedBoxHeigt15,
              Text(DoctorsConst.loginSubtitle,
                  style: Theme.of(context).textTheme.subtitle2?.copyWith(
                        color: DoctorsConst.colorgrey,
                      )),
              DoctorsConst.sizedBoxHeigt20,
              TextFormField(
                  //maxLength: 20,
                  cursorColor: DoctorsConst.colorOrange,
                  decoration: InputDecoration(
                      //fillColor: Colors.white,
                      //filled: true,
                      border: OutlineInputBorder(
                        borderRadius: DoctorsConst.borderRadiusCircular30,
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: const Icon(Icons.person_rounded),
                      hintText: 'E-mail',
                      hintStyle: const TextStyle(fontSize: 15)),
                  onChanged: (String? girilenIkinciSifre) {
                    _email = girilenIkinciSifre;
                  },
                  keyboardType: TextInputType.emailAddress),
              DoctorsConst.sizedBoxHeigt15,
              TextFormField(
                  obscureText: true,
                  obscuringCharacter: "*",
                  //maxLength: 10,
                  cursorColor: Colors.orange,
                  decoration: InputDecoration(
                      //fillColor: Colors.white,
                      //filled: true,
                      border: OutlineInputBorder(
                        borderRadius: DoctorsConst.borderRadiusCircular30,
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: const Icon(Icons.lock_open),
                      hintText: 'Passoword',
                      hintStyle: const TextStyle(fontSize: 15)),
                  onChanged: (String? girilenIkinciSifre) {
                    _sifre = girilenIkinciSifre;
                  },
                  keyboardType: TextInputType.emailAddress),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(''),
                  Text(
                    DoctorsConst.loginQuestion,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2
                        ?.copyWith(fontWeight: FontWeight.w600, fontSize: 12),
                  ),
                ],
              ),
              DoctorsConst.sizedBoxHeigt15,
              SizedBox(
                height: 40,
                width: 150,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: DoctorsConst.colorDarkblue,
                        shape: RoundedRectangleBorder(
                            borderRadius: DoctorsConst.borderRadiusCircular30)),
                    onPressed: () async {
                      User? user;
                      AuthService service = AuthService();

                      //await Firebase.initializeApp();
                      user = await service.signIn(_sifre!, _email!, context);
                      await service.signIn(_sifre!, _email!, context);
                    },
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const NavigationBarLearn()));
                      },
                      child: Text(DoctorsConst.login,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2
                              ?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                  color: Colors.white)),
                    )),
              ),
              DoctorsConst.sizedBoxHeigt40,
              Text(DoctorsConst.loginConnect,
                  style: Theme.of(context).textTheme.subtitle2?.copyWith(
                        color: Colors.grey,
                      )),
              DoctorsConst.sizedBoxHeigt15,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 10, 52, 86)),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Not coded yet!")));
                      },
                      icon: const Icon(Icons.facebook_sharp),
                      label: const Text('Facebook')),
                  ElevatedButton.icon(
                      style:
                          ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Not coded yet!")));
                      },
                      icon: const Icon(Icons.g_mobiledata),
                      label: const Text('Google'))
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(DoctorsConst.loginQuestionOne,
                      style: Theme.of(context).textTheme.subtitle2?.copyWith(
                            color: DoctorsConst.colorgrey,
                          )),
                  //SizedBox(width: 5),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const DoctorNewLogin()));
                      },
                      child: Text(
                        DoctorsConst.loginSignup,
                        style: Theme.of(context).textTheme.subtitle2?.copyWith(
                            color: DoctorsConst.colorblue, fontWeight: FontWeight.w600),
                      ))
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
