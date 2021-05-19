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
          Container(
              padding: EdgeInsets.all(30),
              child: Text(
                "Observe la imagen y ponga atención a la posición de los dedos, deslice para pasar a la siguiente imagen de la categoría.",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 18, fontFamily: 'Verdana'),
              )),
          Leccion(
              // palabra: 'A',
              // ruta: 'assets/jobs.png',
              ),
        ],
      ),
    );
  }
}

class Leccion extends StatelessWidget {
  // const Leccion({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 640,
      padding: EdgeInsets.only(top: 0, bottom: 30, left: 30, right: 30),
      child: PageView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: imagenes.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Image.asset(
                imagenes[index].imagePath,
              ),
              Container(
                padding: EdgeInsets.all(30),
                child: Text(
                  imagenes[index].description,
                  textAlign: TextAlign.center,
                ),
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
  Imagenes(imagePath: 'assets/a.png', description: 'ABC'),
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
