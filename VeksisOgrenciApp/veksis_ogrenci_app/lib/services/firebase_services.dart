import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:veksis_ogrenci_app/services/Modals/student.dart';
import 'package:uuid/uuid.dart';

class FirebaseService {
  final carparks = FirebaseFirestore.instance.collection("student");

  register(Student student) {
    var uuid = const Uuid().v1();
    carparks.doc(uuid).set({
      'id': uuid,
      'name': student.name,
      'surname': student.surname,
      'gsm': student.gsm,
      'email': student.email,
      'authority': student.authority,
      'password': student.password,
      'creationtime': student.creationtime,
      'birthday': student.birthday
    });
  }
}
