import 'package:flutter/material.dart';
import 'package:examen1_rafd/utils/constants3.dart' as con;
import 'package:examen1_rafd/utils/constants.dart';
import 'package:examen1_rafd/more_info.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List lista;

  @override
  void initState() {
    lista = List.from(con.listaExamen);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text("Francisco Daniel Ruiz Arista"),
        ),
      ),
      backgroundColor: fondo,
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
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      'Notificaciones de actividades',
                      style: TextStyle(
                        color: titulos,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                Expanded(

                  child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: lista.length,
                    itemBuilder: (BuildContext context, int index) {
                      var datos = lista[index].toString().split('#');
                      bool showButtons = index % 2 != 0;
                      int numero = int.parse(datos[0].trim());
                      bool esPar = numero % 2 == 0;

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
                        int.parse(datos[1].trim()),
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

  Container createdCard2(int numero, String txtNegritas, String txt, int id, {required bool showButtons}) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      margin: const EdgeInsets.only(bottom: 20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => MoreInfo()));
        },
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Text(
                numero.toString(),
                style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Text(txtNegritas, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                      Text(txt, style: const TextStyle(color: Colors.grey)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: buildStars(3),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
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
        size: 15,
        color: i < numEstrellas ? Colors.yellow : Colors.grey,
      ));
    }
    return stars;
  }
}

class createCard extends StatefulWidget {
  final String txtNegritas;
  final String txtNormal1;
  final int numEstrellas;
  final String numero;
  final String id;
  final bool showButtons;

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
  _createCardState createState() => _createCardState();
}

class _createCardState extends State<createCard> {
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    if (!_isVisible) {
      return const SizedBox.shrink();
    }

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
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  child: Text(
                    widget.numero,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      widget.txtNegritas,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      widget.txtNormal1,
                      style: const TextStyle(color: Colors.black54),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: buildStars(widget.numEstrellas),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        if (widget.showButtons)
          const SizedBox(width: 10),
        if (widget.showButtons)
          Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const MoreInfo()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.edit),
                    const SizedBox(width: 5),
                    const Text("Ver más"),
                  ],
                ),
              ),

              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isVisible = false;
                    showSnackBar('Se eliminó la tarjeta con ID: ${widget.id}', 3);
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.delete),
                    const SizedBox(width: 5),
                    const Text("Borrar"),
                  ],
                ),
              ),
            ],
          ),
      ],
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
        size: 15,
        color: i < numEstrellas ? Colors.yellow : Colors.grey,
      ));
    }
    return stars;
  }
}
