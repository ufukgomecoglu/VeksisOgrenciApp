import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:veksis_ogrenci_app/pages/deneme.dart';
import 'package:veksis_ogrenci_app/pages/register_page.dart';
import 'package:veksis_ogrenci_app/pages/student_login_page.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key, required this.title});
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
  return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/accontPageBackgroundImages.jpeg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                color: HexColor('#7C89A1'),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Column(
                children: [
                  Text("Merhaba",
                      style:
                          TextStyle(color: HexColor('#FDFBFF'), fontSize: 40)),
                  Text("Hesabınıza giriş yapın veya üye olun",
                      style:
                          TextStyle(color: HexColor('#FDFBFF'), fontSize: 17)),
                ],
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const StudentLoginPage(
                              title: "Öğrenci Giriş",
                            )));
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(300, 50),
                    backgroundColor: HexColor("#7C89A1"),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text("Öğrenci Girişi Yap",
                      style:
                          TextStyle(color: HexColor('#FDFBFF'), fontSize: 20)),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const MyApp(
                              title: "Öğrenci Giriş",
                            )));
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(300, 50),
                    backgroundColor: HexColor("#7C89A1"),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text("Öğretmen Girişi Yap",
                      style:
                          TextStyle(color: HexColor('#FDFBFF'), fontSize: 20)),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const RegisterPage(
                              title: "Öğrenci Giriş",
                            )));
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(300, 50),
                    backgroundColor: HexColor("#7C89A1"),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text("Kayıt ol!",
                      style:
                          TextStyle(color: HexColor('#FDFBFF'), fontSize: 20)),
                ),
              ],
            ),
          )
        ],
      ));
}
