import 'package:flutter/material.dart';
import 'package:examen1_rafd/utils/constants3.dart' as con;
import 'package:examen1_rafd/utils/constants.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List lista;

  @override
  void initState() {
    lista = List.from(con.listaExamen); // Crea una copia mutable de la lista original
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF006666), // Color de fondo general
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                // Encabezado
                Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.green[700],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      'Notificaciones de actividades',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20), // Espacio debajo del encabezado

                Expanded(

                  child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: lista.length,
                    itemBuilder: (BuildContext context, int index) {
                      var datos = lista[index].toString().split('#');
                      bool showButtons = index % 2 != 0; // Solo muestra botones en tarjetas alternadas
                      int numero = int.parse(datos[0].trim()); // Extraer el número
                      bool esPar = numero % 2 == 0; // Verificar si el número es par

                      return esPar
                          ? createCard(
                        txtNegritas: datos[2],
                        txtNormal1: datos[3],
                        numEstrellas: int.parse(datos[4].trim()),
                        numero: datos[1],
                        id: datos[0],
                        showButtons: showButtons,
                      )
                          : createdCard2(
                        datos[2].trim(),
                        datos[3].trim(),
                        int.parse(datos[0].trim()),
                        showButtons: showButtons,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container createdCard2(String txtNegritas, String txt, int id, {required bool showButtons}) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      margin: const EdgeInsets.only(bottom: 20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(txtNegritas, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                Text(txt, style: const TextStyle(color: Colors.grey)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: buildStars(3),
                ),
              ],
            ),
          ),
          if (showButtons)
            const SizedBox(width: 10), // Espacio entre texto y botones
          if (showButtons)
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    print("Ver más detalles del id: $id");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text("Ver más"),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      lista.removeAt(id - 1);
                      showSnackBar('Se eliminó el elemento con el id: $id', 15);
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text("Borrar"),
                ),
              ],
            ),
        ],
      ),
    );
  }

  void showSnackBar(String texto, int duracion) {
    final snackBar = SnackBar(
      content: Text(texto),
      duration: Duration(seconds: duracion),
      action: SnackBarAction(
        onPressed: () {},
        label: 'Cerrar',
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  List<Widget> buildStars(int numEstrellas) {
    List<Widget> stars = [];
    for (int i = 0; i < 5; i++) {
      stars.add(Icon(
        Icons.star,
        size: 15, // Tamaño más pequeño para las estrellas
        color: i < numEstrellas ? Colors.yellow : Colors.grey,
      ));
    }
    return stars;
  }
}

class createCard extends StatelessWidget {
  final String txtNegritas;
  final String txtNormal1;
  final int numEstrellas;
  final String numero;
  final String id;
  final bool showButtons; // Variable para mostrar botones

  const createCard({
    super.key,
    required this.txtNegritas,
    required this.txtNormal1,
    required this.numEstrellas,
    required this.numero,
    required this.id,
    required this.showButtons,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 8,
          child: Container(
            padding: const EdgeInsets.all(15.0),
            margin: const EdgeInsets.only(bottom: 20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  txtNegritas,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  txtNormal1,
                  style: const TextStyle(color: Colors.black54),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end, // Estrellas alineadas a la derecha
                  children: buildStars(numEstrellas),
                ),
              ],
            ),
          ),
        ),
        if (showButtons)
          const SizedBox(width: 10), // Espacio entre tarjeta y botones
        if (showButtons)
          Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  print("Ver más detalles del id: $id");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
                child: const Text("Ver más"),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  print("Eliminar elemento con id: $id");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
                child: const Text("Borrar"),
              ),
            ],
          ),
      ],
    );
  }

  List<Widget> buildStars(int numEstrellas) {
    List<Widget> stars = [];
    for (int i = 0; i < 5; i++) {
      stars.add(Icon(
        Icons.star,
        size: 15, // Tamaño más pequeño para las estrellas
        color: i < numEstrellas ? Colors.yellow : Colors.grey,
      ));
    }
    return stars;
  }
}

