import 'package:examen1_rafd/utils/constants.dart';
import 'package:flutter/material.dart';

class MoreInfo extends StatefulWidget {
  const MoreInfo({super.key});

  @override
  State<MoreInfo> createState() => _MoreInfoState();
}

class _MoreInfoState extends State<MoreInfo> {
  List<int> divisions = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fondo,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: ElevatedButton(
              onPressed: _addContainer,
              child: const Text("Dividir contenedor"),
            ),
          ),
          if (divisions.isNotEmpty)
            Expanded(
              child: ListView.builder(
                itemCount: divisions.length,
                itemBuilder: (context, index) {
                  return _buildRow(divisions[index]);
                },
              ),
            ),
        ],
      ),
    );
  }

  void _addContainer() {
    setState(() {
      if (divisions.isEmpty || divisions.last == 12) {
        divisions.add(1);
      } else {
        divisions[divisions.length - 1]++;
      }
    });
  }

  Widget _buildRow(int numDivisions) {
    return Row(
      children: List.generate(
        numDivisions,
            (index) => Expanded(
          child: Container(
            height: 50,
            color: _getColor(index),
            margin: const EdgeInsets.all(2.0),
          ),
        ),
      ),
    );
  }

  Color _getColor(int index) {
    List<Color> colors = [
      Colors.green,
      Colors.white,
      Colors.red,
    ];
    return colors[index % colors.length];
  }
}


