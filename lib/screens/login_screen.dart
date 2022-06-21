// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:otrapp/screens/home_screen.dart';
import 'package:otrapp/services/auth_sevice.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  bool loading = false;

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Loggin"),
          centerTitle: true,
          backgroundColor: Colors.orangeAccent,
        ),
        body: SingleChildScrollView(
            child: Container(
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height,
                    maxWidth: MediaQuery.of(context).size.width),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://images.unsplash.com/photo-1571008887538-b36bb32f4571?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 36.0, horizontal: 24.0),
                          child: Column(children: []),
                        ),
                      ),
                      Expanded(
                          flex: 3,
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40),
                                  topRight: Radius.circular(40),
                                )),
                            child: Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Bienvenido de Vuelta",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 46.0,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 6.0,
                                  ),
                                  Text(
                                    "Ingresa tus datos",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 80.0,
                                  ),
                                  TextField(
                                    controller: emailController,
                                    decoration: const InputDecoration(
                                      labelText: 'Correo',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  TextField(
                                    obscureText: true,
                                    controller: passwordController,
                                    decoration: const InputDecoration(
                                        labelText: "Contraseña",
                                        border: OutlineInputBorder()),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  loading
                                      ? const CircularProgressIndicator()
                                      : SizedBox(
                                          height: 50,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: ElevatedButton(
                                            onPressed: () async {
                                              setState(() {
                                                // ignore: unused_label
                                                loading:
                                                true;
                                              });
                                              if (emailController.text == "" ||
                                                  passwordController.text ==
                                                      "") {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                        const SnackBar(
                                                  content: Text(
                                                      "Es necesario completar todos los campos"),
                                                  backgroundColor: Colors.red,
                                                ));
                                              } else {
                                                User? result =
                                                    await AuthSevice().login(
                                                        emailController.text,
                                                        passwordController.text,
                                                        context);
                                                if (result != null) {
                                                  print(
                                                      "Inicio de Sesión Exitosa");
                                                  Navigator.pushAndRemoveUntil(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const HomeScreen()),
                                                      (route) => false);
                                                }
                                              }
                                              setState(() {
                                                // ignore: unused_label
                                                loading:
                                                false;
                                              });
                                            },
                                            child: const Text(
                                              "Iniciar Sesión",
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                ],
                              ),
                            ),
                          ))
                    ]))));
  }
}
