import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:otrapp/screens/home_screen.dart';
import 'package:otrapp/screens/login_screen.dart';
import 'package:otrapp/services/auth_sevice.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:
              const Text("Crear Cuenta", style: TextStyle(color: Colors.black)),
          centerTitle: true,
          backgroundColor: Colors.white,
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
                                    "Hola Bienvenido",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 35.0,
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
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.0,
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
                                  TextField(
                                    obscureText: true,
                                    controller: confirmPasswordController,
                                    decoration: const InputDecoration(
                                        labelText: "Confirmar Contraseña",
                                        border: OutlineInputBorder()),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  loading
                                      ? const CircularProgressIndicator()
                                      // ignore: sized_box_for_whitespace
                                      : Container(
                                          height: 50,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: ElevatedButton(
                                            onPressed: () async {
                                              setState(() {
                                                loading = true;
                                              });
                                              if (emailController.text == "" ||
                                                  passwordController.text ==
                                                      "") {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                        const SnackBar(
                                                  content: Text(
                                                      "Debes rellenar todos los espacios"),
                                                  backgroundColor: Colors.red,
                                                ));
                                              } else if (passwordController
                                                      .text !=
                                                  confirmPasswordController
                                                      .text) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                        const SnackBar(
                                                  content: Text(
                                                      "Las contraseñas no coinciden"),
                                                  backgroundColor: Colors.red,
                                                ));
                                              } else {
                                                User? result =
                                                    await AuthSevice().register(
                                                        emailController.text,
                                                        passwordController.text,
                                                        context);
                                                if (result != null) {
                                                  // ignore: avoid_print
                                                  print("Conexción Exitosa");
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
                                              "Crear Cuenta",
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const LoginScreen()));
                                      },
                                      child: const Text(
                                          "¿Ya tienes una cuenta? Inicia Sesión"))
                                ],
                              ),
                            ),
                          ))
                    ]))));
  }
}
