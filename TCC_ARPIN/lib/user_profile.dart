import 'package:ar_pin/auth/Login.dart';
import 'package:ar_pin/auth/services/auth_service.dart';
import 'package:ar_pin/utils/appbar.dart';
import 'package:ar_pin/utils/functions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_page.dart';
import 'modelos_disponiveis.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  getUsername() async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    if (FirebaseAuth.instance.currentUser != null) {
      final snapshot = await db
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();
      Map data = snapshot.data() as Map;
      String username = data['username'].toString();
      return username;
    }
    return "Usuário não cadastrado";
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  final AdminPermissions admin = AdminPermissions();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        actions: const <Widget>[],
        title: IconButton(
            iconSize: 40,
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const HomePage()));
            },
            icon: Image.asset('assets/images/led.png')),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Image.asset('assets/images/arrow.png')),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          double baseWidth = 1040;
          double fem = constraints.maxWidth / baseWidth;
          double ffem = fem * 0.97;
          String picImg = "user";
          List<String> randomImgs = ["1", "2", "3", "4", "5", "6", "7", "8"];

          return SizedBox(
            width: double.infinity,
            child: SizedBox(
              // perfildeusuarioAh5 (207:58)
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      // autogroupn3ovcBh (4s1oD6K76jYviN91mgn3oV)
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // user1hyq (207:59)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 50 * fem, 0 * fem, 40 * fem),
                            width: 350 * fem,
                            height: 350 * fem,
                            child: Image.asset(
                              'assets/images/$picImg.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          FutureBuilder(
                              future: firestore.collection('users').doc(_firebaseAuth.currentUser!.uid).get(),
                              builder: (BuildContext context,
                                      snapshot) {
                                
                                
                                if (!snapshot.hasData) {
                                  return const Center(
                                    child: CircularProgressIndicator(
                                        backgroundColor:
                                            Colors.lightBlueAccent),
                                  );
                                  
                                }
                                final userData = snapshot.data!.data();
                                return SizedBox(
                                width: double.infinity,
                                  child: Center(
                                    child: Text(
                                      userData!['username'].toString(),
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                        fontSize: 54 * ffem,
                                        fontWeight: FontWeight.w600,
                                        height: 1.5 * ffem / fem,
                                        fontStyle: FontStyle.italic,
                                        color: const Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                              SizedBox(height: 20 * fem,),
                          Container(
                            // line3nxf (264:59)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 0 * fem, 10 * fem),
                            width: 1040 * fem,
                            height: 1 * fem,
                            decoration: const BoxDecoration(
                              color: Color(0xff000000),
                            ),
                          ),
                          Container(
                            // configuraes7zw (264:57)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 0 * fem, 35 * fem),
                            child: Center(
                              child: Text(
                                'Configurações',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  fontSize: 52 * ffem,
                                  fontWeight: FontWeight.w600,
                                  height: 1.5 * ffem / fem,
                                  fontStyle: FontStyle.italic,
                                  color: const Color(0xff000000),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            // autogroupfwm9pPZ (4s1njwRgb8zPHmyepJfwM9)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 0 * fem, 35 * fem),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50 * fem),
                            ),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xffe51f43),
                                minimumSize: Size(919 * fem, 125 * fem),
                                elevation: 0,
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50))),
                              ),
                              onPressed: () {
                                FirebaseAuth.instance.signOut().then((value) {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Login()));
                                });
                              },
                              child: Text(
                                'Sair da Conta',
                                style: GoogleFonts.poppins(
                                  fontSize: 48 * ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.5 * ffem / fem,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 0 * fem, 0 * fem),
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                backgroundColor: const Color(0xffe51f43),
                                side: const BorderSide(
                                    color: Color(0xffe51f43), width: 1),
                                minimumSize: Size(919 * fem, 125 * fem),
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50))),
                              ),
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const DeleteUser()));
                              },
                              child: Text(
                                'Deletar Conta',
                                style: GoogleFonts.poppins(
                                  fontSize: 48 * ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.5 * ffem / fem,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class DeleteUser extends StatefulWidget {
  const DeleteUser({super.key});

  @override
  State<DeleteUser> createState() => _DeleteUserState();
}

class _DeleteUserState extends State<DeleteUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: ArpinAppBar().title(context),
            actions: ArpinAppBar().actions(context),
            centerTitle: ArpinAppBar().centerTitle,
            leading: ArpinAppBar().leading(context),
            backgroundColor: ArpinAppBar().backgroundColor,
            elevation: ArpinAppBar().elevation),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Tem certeza que deseja deletar sua conta?",
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.155,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    AuthService().deleteUser();
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => const Login()));
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xffe51f43)),
                    minimumSize: MaterialStateProperty.all<Size>(
                        Size((MediaQuery.of(context).size.width / 2) - 48, 55)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  child: const Text("Sim"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => UserProfile()));
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xffe51f43)),
                    minimumSize: MaterialStateProperty.all<Size>(
                        Size((MediaQuery.of(context).size.width / 2) - 48, 55)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  child: const Text("Voltar para o perfil"),
                ),
              ],
            ),
          ],
        ));
  }
}
