import 'package:flutter/material.dart';
import 'package:examen1_rafd/home.dart';
import 'package:examen1_rafd/utils/constants.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();

}

class _LoginState extends State<Login> {
  TextEditingController user = TextEditingController();
  final pass = TextEditingController();
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fondo,
      body: Stack(
        children: [
          // Fondo: fila con dos columnas
          Row(
            children: [
              // Primera columna
              Column(
                children: [
                  Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.3333,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.25,
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: fondo2,
                    ),
                  ),
                  Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.3333,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.25,
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: fondo4,
                    ),
                  ),
                  Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.3333,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.25,
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: fondo,
                    ),
                  ),
                ],
              ),

              // Segunda columna
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.3333,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.25,
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: fondo,
                    ),
                  ),
                  Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.3333,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.25,
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: fondo3,
                    ),
                  ),
                  Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.3333,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.25,
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: fondo4,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.3333,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.25,
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: fondo3,
                    ),
                  ),
                  Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.3333,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.25,
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: fondo2,
                    ),
                  ),
                  Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.3333,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.25,
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: fondo,
                    ),
                  ),
                ],
              ),

              Column(
                children: [
                  Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.3333,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.25,
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: fondo4,
                    ),
                  ),
                  Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.3333,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.25,
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: fondo,
                    ),
                  ),
                  Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.3333,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.25,
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: fondo2,
                    ),
                  ),
                ],
              ),

            ],
          ),

          // Contenedor transparente superpuesto en el centro
          Align(
            alignment: Alignment.center,
            child: Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.5,
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.8,
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.white.withOpacity(0.5), // Transparencia del 30%
              ),
              child: Center(
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        "Bienvenido a tu primer EXAMEN",
                        style: TextStyle(
                          color: titulos,
                          fontSize: 30.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 19.0,),
                    TextFormField(
                        controller: user,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                width: 1,
                                style: BorderStyle.none,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Correo/Usuario'
                        )
                    ),
                    SizedBox(height: 20.0,),
                    TextFormField(
                      controller: pass,
                      obscureText: true,

                      ///Ocultar el texto normal
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                              width: 1,
                              style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Contraseña'
                      ),
                    ),

                    SizedBox(height: 20.0,),

                    if (_errorMessage != null)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Text(
                          _errorMessage!,
                          style: TextStyle(color: Colors.red, fontSize: 16.0),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ElevatedButton(

                      ///Atributo para agregar estilo al botón
                      style: ElevatedButton.styleFrom(
                        backgroundColor: botones,

                        ///Color al botón
                        ///Agrega borde redondeado en las esquinas
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        fixedSize: Size(370, 40),

                        ///Tamaño que tendrá el botón
                      ),
                      onPressed: () {
                        setState(() {
                          _errorMessage = null; // Reiniciar el mensaje de error

                          // Verificar si algún campo está vacío
                          if (user.text.isEmpty && pass.text.isEmpty) {
                            _errorMessage = "Datos incompletos";
                          } else if (user.text.isEmpty) {
                            _errorMessage =
                            "Por favor ingrese el usuario o correo";
                          } else if (pass.text.isEmpty) {
                            _errorMessage = "Por favor ingrese la contraseña";
                          } else if (user.text != "test") {
                            _errorMessage = "Usuario incorrecto";
                          } else if (pass.text != "FDM1") {
                            _errorMessage = "Contraseña incorrecta";
                          } else {
                            _errorMessage = null;
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) => Home(),
                            ));
                          }
                        });
                      },
                      child: const Row(

                        ///Alinear horizontamente
                        mainAxisAlignment: MainAxisAlignment.spaceAround,

                        ///Vertical
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                              'Iniciar Sesión',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.0),
                    const Text("Mi primer examen, ¿estara sencillo?",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}