import 'package:flutter/material.dart';

class Pagina02 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página 2'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text("Terminos y condiciones",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            Text(
                "Para usar esta aplicación es necesario aceptar que aceptes tal y tal"),
            Text(
                "Para usar esta aplicación es necesario aceptar que aceptes tal y tal"),
            Text(
                "Para usar esta aplicación es necesario aceptar que aceptes tal y tal"),
            Text(
                "Para usar esta aplicación es necesario aceptar que aceptes tal y tal"),
            Text(
                "Para usar esta aplicación es necesario aceptar que aceptes tal y tal"),
            ElevatedButton(
                child: Text('Aceptar'),
                onPressed: () => {Navigator.pop(context)})
          ],
        ),
      ),
    );
  }
}
