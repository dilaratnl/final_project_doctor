
import 'package:demo_firebase_setup/const/f%C4%B1nal_doctor_const.dart';
import 'package:demo_firebase_setup/widget/auth_services.dart';
import 'package:demo_firebase_setup/view/doctor_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
class DoctorNewLogin extends StatefulWidget {
  const DoctorNewLogin({super.key});

  @override
  State<DoctorNewLogin> createState() => _DoctorNewLoginState();
}
String? _email = "dilara@gmail.com";
// ignore: unused_element
String? _name = "dilara";
String? _sifre = "1234566";
String? _ikinciSifre = "1234566";
class _DoctorNewLoginState extends State<DoctorNewLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 236, 236, 236),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, bottom: 30, top: 30),
        child: Center(
          child: SingleChildScrollView(
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const DoctorLogin()));
                      },
                      icon: const Icon(Icons.arrow_back_rounded)),
                ],
              ),
              const SizedBox(height: 40),
              Text('Lets Get Started!',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 30)),
              const SizedBox(height: 20),
              Text('Create an account to Q Allure to get all features',
                  style: Theme.of(context).textTheme.subtitle2?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      fontSize: 16)),
              const SizedBox(height: 30),
              _textFieldIconName(),
              const SizedBox(height: 15),
              _textFieldIconEmail(),
              const SizedBox(height: 15),
              _textFieldIconPhone(),
              const SizedBox(height: 15),
              _textFieldIconPassoword(),
              const SizedBox(height: 15),
              _textFieldIconConfirmPassoword(),
              const SizedBox(height: 50),
              SizedBox(
                height: MediaQuery.of(context).size.height / 15,
                width: MediaQuery.of(context).size.width / 1.8,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 22, 96, 157),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                    onPressed: () async{
                     await Firebase.initializeApp();
                     /*  if(_sifre != _ikinciSifre){
                        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Passwords has not matched")));
            return;
                      } */
                      AuthService service = AuthService();

                      await Firebase.initializeApp();
                      User? user;
                    user = await service.signUp(_sifre!, _email!, context);
                    },
                    child: Text('CREATE',
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white))),
              ),
             const SizedBox(height: 15), Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Text(DoctorsConst.newloginQuestion,
                       style: Theme.of(context).textTheme.subtitle2?.copyWith(
                            color: const Color.fromARGB(255, 145, 145, 145),fontSize: 18,fontWeight: FontWeight.bold
                          )),
                  //SizedBox(width: 5),
                  TextButton(
                      onPressed: () { Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>const DoctorLogin()));},
                      child: Text(
                        DoctorsConst.newlogin,
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                            color: DoctorsConst.colorblue, fontWeight: FontWeight.bold,fontSize: 18),
                      ))
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }

  TextFormField _textFieldIconConfirmPassoword() {
    return TextFormField(
        //maxLength: 20,
        cursorColor: DoctorsConst.colorOrange,
        decoration: InputDecoration(
            fillColor: DoctorsConst.colorwhite,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
            prefixIcon:const Icon(Icons.lock_outline_rounded),
            hintText: DoctorsConst.newloginConPassoword,
            hintStyle:const TextStyle(fontSize: 15)),
            onSaved: (String? girilenIkinciSifre) {
                    _ikinciSifre = girilenIkinciSifre.toString();
                  },
        keyboardType: TextInputType.number);
  }

  TextFormField _textFieldIconPassoword() {
    return TextFormField(
        //maxLength: 20,
       cursorColor: DoctorsConst.colorOrange,
        decoration: InputDecoration(
            fillColor: DoctorsConst.colorwhite,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
            prefixIcon:const Icon(Icons.lock_outline_rounded),
            hintText: DoctorsConst.newloginPassoword,
            hintStyle:const TextStyle(fontSize: 15)),
            onSaved: (String? girilenSifre) {
                    _sifre = girilenSifre.toString();
                  },
        keyboardType: TextInputType.number);
  }

  TextField _textFieldIconPhone() {
    return TextField(
        //maxLength: 20,
         cursorColor: DoctorsConst.colorOrange,
        decoration: InputDecoration(
            fillColor: DoctorsConst.colorwhite,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
            prefixIcon:const Icon(Icons.phone_android_outlined),
            hintText: DoctorsConst.newloginPhone,
            hintStyle:const TextStyle(fontSize: 15)),
        keyboardType: TextInputType.phone);
  }

  TextFormField _textFieldIconEmail() {
    return TextFormField(
        //maxLength: 20,
       cursorColor: DoctorsConst.colorOrange,
        decoration: InputDecoration(
            fillColor: DoctorsConst.colorwhite,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
            prefixIcon:const Icon(Icons.mail_outline_sharp),
            hintText: DoctorsConst.newloginEmail,
            hintStyle: const TextStyle(fontSize: 15)),
            onSaved: (String? girilenemail) {
                    _email = girilenemail;
                  },
        keyboardType: TextInputType.emailAddress);
  }

  TextFormField _textFieldIconName() {
    return TextFormField(
        //maxLength: 20,
        cursorColor: DoctorsConst.colorOrange,
        decoration: InputDecoration(
            fillColor: DoctorsConst.colorwhite,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: DoctorsConst.borderRadiusCircular30,
              borderSide: BorderSide.none,
            ),
            
            prefixIcon:const Icon(Icons.person_rounded),
            hintText: DoctorsConst.newloginName,
            hintStyle:const TextStyle(fontSize: 15)),
            onSaved: (String? girilenName) {
                    _name = girilenName;
                  },
        keyboardType: TextInputType.name);
  }
}
