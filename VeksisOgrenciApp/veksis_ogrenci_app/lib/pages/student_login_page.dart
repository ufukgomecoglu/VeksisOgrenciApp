import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class StudentLoginPage extends StatefulWidget {
  const StudentLoginPage({super.key, required this.title});
  final String title;

  @override
  State<StudentLoginPage> createState() => _StudentLoginPage();
}

class _StudentLoginPage extends State<StudentLoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Öğrenci Giriş',
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
  return const Center();
}
