// import 'package:firebase_auth/firebase_auth.dart';

// class AuthService{
//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

//   EntrarUsuario({required String email, required String senha}){
//     print("METODO ENTRAR USUARIO");
//   }

//   CadastrarUsuario({ required String email, required String senha}){
//     print("METODO CADASTRAR USUARIO");
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future deleteUser() async {
    await Future.delayed(const Duration(seconds: 5));
    await _firebaseAuth.currentUser!.delete();
  }

  dynamic isAchiviementDone(String idQuest)async{
    Future.delayed(const Duration(seconds: 1));
    var userSnapshot = await FirebaseFirestore.instance.collection('users').doc(_firebaseAuth.currentUser!.uid).get();
    Map <String, dynamic> map = userSnapshot.data() as Map<String, dynamic>;
    if (map.containsKey(idQuest)) return "true";
    return "false";
  }

  Future createAchiviement(String idQuest)async{
     await Future.delayed(const Duration(seconds:1));
     await FirebaseFirestore.instance.collection('users').doc(_firebaseAuth.currentUser!.uid).update({"achiviements": FieldValue.arrayUnion([idQuest])});
  }
}
