import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final TextEditingController _usernameTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final textFieldFocusNode = FocusNode();
  bool _obscureText = false;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  

  void _toggleObscured() {
    setState(() {
      _obscureText = !_obscureText;
      //por enquanto não utilizado
      if (textFieldFocusNode.hasPrimaryFocus) return; // If focus is on text field, dont unfocus
      textFieldFocusNode.canRequestFocus = false;     // Prevents focus if tap on eye
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          double baseWidth = 1040;
          double fem = constraints.maxWidth / baseWidth;
          double ffem = fem * 0.97;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin:
                      EdgeInsets.fromLTRB(0 * fem, 125 * fem, 0 * fem, 0 * fem),
                  width: 250 * fem,
                  height: 250 * fem,
                  child: Image.asset(
                    'assets/images/led.png',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 20 * fem, 0 * fem, 0 * fem),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: GoogleFonts.poppins(
                              fontSize: 40,
                              fontWeight: FontWeight.w300,
                              fontStyle: FontStyle.italic,
                              color: const Color(0xff000000),
                            ),
                            children: [
                              const TextSpan(
                                text: 'AR-',
                              ),
                              TextSpan(
                                text: 'PIN',
                                style: GoogleFonts.poppins(
                                  fontSize: 40,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.italic,
                                  color: const Color(0xff000000),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 600 * fem,
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 25 * fem, 0 * fem, 0 * fem),
                        child: Text(
                          '"Porque ensinar não é apenas transmitir conhecimento!"',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 50 * ffem,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff000000),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 75 * fem, 0 * fem, 35 * fem),
                      child: Text(
                        'Crie sua Conta',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 72 * ffem,
                          fontWeight: FontWeight.w600,
                          height: 1.5 * ffem / fem,
                          color: const Color(0xff000000),
                        ),
                      ),
                    ),
                    Container(
                      // autogroupuewqg9V (4s1pqsvW2wfmvBsJLtUEwq)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 35 * fem),
                      width: 919 * fem,
                      height: 125 * fem,
                      decoration: BoxDecoration(
                        color: const Color(0x7fd9d1e4),
                        borderRadius: BorderRadius.circular(50 * fem),
                      ),
                      child: TextField(
                        controller: _usernameTextController,
                        maxLines: 1,
                        decoration: InputDecoration(
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.fromLTRB(
                              25 * fem, 0 * fem, 0 * fem, 0 * fem),
                          hintText: 'Nome de Usuario',
                          hintStyle: const TextStyle(color: Color(0xff000000)),
                        ),
                        style: GoogleFonts.poppins(
                          fontSize: 48 * ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.5 * ffem / fem,
                          color: const Color(0xff000000),
                        ),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(30),
                        ],
                      ),
                    ),
                    Container(
                      // autogroupuewqg9V (4s1pqsvW2wfmvBsJLtUEwq)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 35 * fem),
                      width: 919 * fem,
                      height: 125 * fem,
                      decoration: BoxDecoration(
                        color: const Color(0x7fd9d1e4),
                        borderRadius: BorderRadius.circular(50 * fem),
                      ),
                      child: TextField(
                        controller: _emailTextController,
                        maxLines: 1,
                        decoration: InputDecoration(
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.fromLTRB(
                              25 * fem, 0 * fem, 0 * fem, 0 * fem),
                          hintText: 'Email',
                          hintStyle: const TextStyle(color: Color(0xff000000)),
                        ),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(50),
                        ],
                        style: GoogleFonts.poppins(
                          fontSize: 48 * ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.5 * ffem / fem,
                          color: const Color(0xff000000),
                        ),
                      ),
                    ),
                    Container(
                      // autogroupuewqg9V (4s1pqsvW2wfmvBsJLtUEwq)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 35 * fem),
                      width: 919 * fem,
                      height: 125 * fem,
                      decoration: BoxDecoration(
                        color: const Color(0x7fd9d1e4),
                        borderRadius: BorderRadius.circular(50 * fem),
                      ),
                      child: TextField(
                        controller: _passwordTextController,
                        maxLines: 1,
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.fromLTRB(
                              25 * fem, 25 * fem, 0 * fem, 0 * fem),
                          hintText: 'Senha',
                          hintStyle: const TextStyle(color: Color(0xff000000)),
                          suffixIcon: Padding(padding: const EdgeInsets.fromLTRB(0,0,4,0),
                          child: GestureDetector(
                            onTap: _toggleObscured,
                            child: Icon(
                              _obscureText                               
                                ? Icons.visibility
                                : Icons.visibility_off,
                              size: 24,
                            ),
                          ),
                          
                          )
                        ),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(30),
                        ],
                        style: GoogleFonts.poppins(
                          fontSize: 48 * ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.5 * ffem / fem,
                          color: const Color(0xff000000),
                        ),
                        
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    FlutterPwValidator(
                      controller: _passwordTextController,
                      minLength: 8,
                      uppercaseCharCount: 1,
                      numericCharCount: 1,
                      specialCharCount: 1,
                      width: 900 * fem,
                      height: 150,
                      onSuccess: () {
                        // print("matched");
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Password is matched")));
                      },
                      onFail: () {
                        // print("not matching");
                      },
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 45 * fem, 0 * fem, 50 * fem),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          //se nao der certo, migre para primary de novo
                          backgroundColor: const Color(0xffe51f43),
                          minimumSize: Size(919 * fem, 125 * fem),
                          elevation: 0,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                        ),
                        onPressed: () {
                          FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                  email: _emailTextController.text,
                                  password: _passwordTextController.text)
                              .then((value) {
                            firestore
                                .collection('users')
                                .doc(value.user!.uid)
                                .set({
                              'username': _usernameTextController.text,
                                });
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Login()));
                          });
                        },
                        child: Text(
                          'Cadastrar-se',
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
                Center(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 100 * fem, 0 * fem, 0 * fem),
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => const Login()));
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                      child: Text(
                        'Já esteve aqui antes? Acesse sua conta!',
                        style: GoogleFonts.poppins(
                          fontSize: 45 * ffem,
                          fontWeight: FontWeight.w600,
                          height: 1.5 * ffem / fem,
                          color: const Color(0xff2473ea),
                          decorationColor: const Color(0xff2473ea),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
