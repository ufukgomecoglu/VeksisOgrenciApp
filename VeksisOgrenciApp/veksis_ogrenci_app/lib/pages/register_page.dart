import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:veksis_ogrenci_app/services/Modals/student.dart';
import 'package:veksis_ogrenci_app/services/firebase_services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';
import 'package:regexpattern/regexpattern.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hesabım',
          style: TextStyle(color: HexColor('#FDFBFF')),
        ),
        backgroundColor: HexColor('#7C89A1'),
        elevation: 1,
        shadowColor: Colors.black,
      ),
      body: content(context),
    );
  }
}

Widget content(BuildContext context) {
  int seconds;
  int nanoseconds;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController gsmController = TextEditingController();
  final TextEditingController mailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController birthday = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final  birthday1 =DateTime.timestamp();
  DateTime selectedDate = DateTime.now();
  final int selectedDate1 = selectedDate.microsecondsSinceEpoch;
  seconds = (selectedDate1 ~/ (1000 * 1000));
  nanoseconds = ((selectedDate1 % (1000 * 1000)) * 1000);
  addstudent() {
    try {
      FirebaseService().register(Student(
          name: nameController.text,
          surname: surnameController.text,
          gsm: gsmController.text,
          email: mailController.text,
          password: passwordController.text,
          authority: 'Öğrenci',
          creationtime: Timestamp.now(),
          birthday: Timestamp(seconds, nanoseconds)));
    } catch (e) {
      Fluttertoast.showToast(
        msg: 'Kayıt olurken bir hata oluştu',
        timeInSecForIosWeb: 3,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red,
      );
    }
    FocusScope.of(context).unfocus();
  }

  return Center(
    key: formKey,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: nameController,
            decoration: InputDecoration(
              labelText: 'İsim',
              labelStyle: TextStyle(color: HexColor('#7C89A1')),
              prefixIcon: const Icon(Icons.person),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: HexColor("#7C89A1")),
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: HexColor("#7C89A1")),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return "Lütfen bir değer girin";
              }
              final RegExp regex = RegExp(r'^[a-zA-Z]+$');
              if (!regex.hasMatch(value)) {
                return "Sadece harf içeren bir değer girin";
              }
              if (value.length < 3) {
                return "3 harften az olamaz";
              }
              return null;
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: surnameController,
            decoration: InputDecoration(
              labelText: 'Soyisim',
              labelStyle: TextStyle(color: HexColor('#7C89A1')),
              prefixIcon: const Icon(Icons.person),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: HexColor("#7C89A1")),
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: HexColor("#7C89A1")),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return "Lütfen bir değer girin";
              }
              final RegExp regex = RegExp(r'^[a-zA-Z]+$');
              if (!regex.hasMatch(value)) {
                return "Sadece harf içeren bir değer girin";
              }
              if (value.length < 3) {
                return "3 harften az olamaz";
              }
              return null;
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: gsmController,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'telefon',
              labelStyle: TextStyle(color: HexColor('#7C89A1')),
              prefixIcon: const Icon(Icons.phone_android),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: HexColor("#7C89A1")),
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: HexColor("#7C89A1")),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            validator: (value) {
              return value!.isNotEmpty && !value.isPhone()
                  ? 'Lütfen geçerli bir telefon numarası girin'
                  : null;
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: mailController,
            decoration: InputDecoration(
              labelText: 'Mail Adres',
              labelStyle: TextStyle(color: HexColor('#7C89A1')),
              prefixIcon: const Icon(Icons.phone_android),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: HexColor("#7C89A1")),
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: HexColor("#7C89A1")),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            validator: (value) {
              return value!.isNotEmpty && !value.isEmail()
                  ? 'Lütfen geçerli bir e-posta adresi girin'
                  : null;
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: birthday,
            keyboardType: TextInputType.datetime,
            
            inputFormatters: [],
            decoration: InputDecoration(
              labelText: 'Doğum Tarihi',
              labelStyle: TextStyle(color: HexColor('#7C89A1')),
              prefixIcon: const Icon(Icons.date_range),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: HexColor("#7C89A1")),
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: HexColor("#7C89A1")),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            validator: (value) {
              return value!.isNotEmpty && !value.isDateTime()
                  ? 'Lütfen geçerli bir e-posta adresi girin'
                  : null;
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
        ),
      ],
    ),
  );
}
