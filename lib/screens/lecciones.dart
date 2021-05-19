import 'package:flutter/material.dart';

class PantallaLeccion extends StatelessWidget {
  final String titulo;

  const PantallaLeccion({Key? key, required this.titulo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(this.titulo)),
        body: Column(
          children: [
            Leccion(
              palabra: 'A',
              ruta: 'assets/jobs.png',
            )
          ],
        ));
  }
}

class Leccion extends StatelessWidget {
  final String palabra;
  final String ruta;

  const Leccion({Key? key, required this.palabra, required this.ruta})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          padding: EdgeInsets.all(40),
          child: Column(children: [
            Container(
              padding: EdgeInsets.only(bottom: 20),
              child: Text(
                  'Observa la imagen con atención y practícala, cuando termines pasa a la siguiente'),
            ),
            Image.asset(ruta),
            Container(
              padding: EdgeInsets.all(40),
              child: Text(
                this.palabra,
                textAlign: TextAlign.left,
              ),
            ),
            ElevatedButton(onPressed: () {}, child: Text('Siguiente'))
          ])),
    );
  }
}

Widget lista() {
  ListView lista = new ListView();
  for (var i = 0; i < 10; i++) {
    lista = new ListView();
  }
  return lista;
}

// Widget botonSiguiente(){
//   return ElevatedButton(onPressed: onPressed, child: child)
// }

// Widget botonRepaso(){
//   return ElevatedButton(onPressed: onPressed, child: child)
// }
