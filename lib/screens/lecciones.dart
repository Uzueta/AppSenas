import 'package:flutter/material.dart';

class PantallaLeccion extends StatelessWidget {
  final String titulo;

  const PantallaLeccion({Key? key, required this.titulo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(this.titulo)),
        body: Leccion(
            // palabra: 'A',
            // ruta: 'assets/jobs.png',
            ));
  }
}

// class Leccion extends StatelessWidget {
//   final String palabra;
//   final String ruta;

//   const Leccion({Key? key, required this.palabra, required this.ruta})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//           padding: EdgeInsets.all(40),
//           child: Column(children: [
//             Container(
//               padding: EdgeInsets.only(bottom: 20),
//               child: Text(
//                   'Observa la imagen con atención y practícala, cuando termines pasa a la siguiente'),
//             ),
//             Image.asset(ruta),
//             Container(
//               padding: EdgeInsets.all(40),
//               child: Text(
//                 this.palabra,
//                 textAlign: TextAlign.left,
//               ),
//             ),
//             // ElevatedButton(onPressed: () {}, child: Text('Siguiente'))
//           ])),
//     );
//   }
// }

class Leccion extends StatelessWidget {
  // const Leccion({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: PageView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: imagenes.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Image.asset(
                imagenes[index].imagePath,
              ),
              Text(
                imagenes[index].description,
                textAlign: TextAlign.center,
              )
            ],
          );
        },
      ),
    );
  }
}

// Widget lista() {
//   ListView lista = new ListView();
//   for (var i = 0; i < 10; i++) {
//     lista = new ListView();
//   }
//   return lista;
// }

List<Imagenes> imagenes = [
  Imagenes(imagePath: 'assets/abc.png', description: 'ABC'),
  Imagenes(imagePath: 'assets/jobs.png', description: 'jobs'),
  Imagenes(imagePath: 'assets/ola.png', description: 'landscape'),
  Imagenes(imagePath: 'assets/morfin.png', description: 'morfin'),
  Imagenes(imagePath: 'assets/naturaleza.png', description: 'naturaleza'),
  Imagenes(imagePath: 'assets/ola.png', description: 'ola'),
  Imagenes(imagePath: 'assets/saludos.png', description: 'saludos'),
  Imagenes(imagePath: 'assets/ola.png', description: 'scroll-1'),
];

class Imagenes {
  String imagePath;
  String description;

  Imagenes({required this.imagePath, required this.description});
}
// Widget botonSiguiente(){
//   return ElevatedButton(onPressed: onPressed, child: child)
// }

// Widget botonRepaso(){
//   return ElevatedButton(onPressed: onPressed, child: child)
// }
