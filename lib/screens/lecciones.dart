import 'package:disenos/widgets/lecciones_listas.dart';
import 'package:flutter/material.dart';

class PantallaLeccion extends StatelessWidget {
  final String titulo;
  final int id;

  const PantallaLeccion({Key? key, required this.titulo, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    LeccionesLista listas = LeccionesLista();
    List lista = listas.imagenes;
    switch (id) {
      case 1:
        lista = listas.abc;
        break;
      case 2:
        lista = listas.numeros;
        break;
      case 3:
        lista = listas.dias;
        break;
      default:
        lista = listas.imagenes;
    }

    return Scaffold(
      appBar: AppBar(title: Text(this.titulo)),
      body: Column(
        children: [
          Container(
              padding: EdgeInsets.all(30),
              child: Text(
                "Observe la imagen y ponga atención a la posición de los dedos, deslice para pasar a la siguiente imagen.",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 18, fontFamily: 'Verdana'),
              )),
          Leccion(
            lista: lista,
            // palabra: 'A',
            // ruta: 'assets/jobs.png',
          ),
        ],
      ),
    );
  }
}

class Leccion extends StatelessWidget {
  final List lista;

  const Leccion({
    Key? key,
    required this.lista,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 640,
      padding: EdgeInsets.only(top: 0, bottom: 30, left: 30, right: 30),
      child: PageView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: lista.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  lista[index].imagePath,
                ),
              ),
              Container(
                padding: EdgeInsets.all(30),
                child: Text(
                  lista[index].description,
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

// List<Imagenes> imagenes = [
//   Imagenes(imagePath: 'assets/a.png', description: 'ABC'),
//   Imagenes(imagePath: 'assets/jobs.png', description: 'jobs'),
//   Imagenes(imagePath: 'assets/ola.png', description: 'landscape'),
//   Imagenes(imagePath: 'assets/morfin.png', description: 'morfin'),
//   Imagenes(imagePath: 'assets/naturaleza.png', description: 'naturaleza'),
//   Imagenes(imagePath: 'assets/ola.png', description: 'ola'),
//   Imagenes(imagePath: 'assets/saludos.png', description: 'saludos'),
//   Imagenes(imagePath: 'assets/ola.png', description: 'scroll-1'),
// ];

// List<Imagenes> abc = [
//   Imagenes(imagePath: 'assets/abecedario/a.png', description: 'A'),
//   Imagenes(imagePath: 'assets/abecedario/b.png', description: 'B'),
//   Imagenes(imagePath: 'assets/abecedario/c.png', description: 'C'),
//   Imagenes(imagePath: 'assets/abecedario/d.png', description: 'D'),
//   Imagenes(imagePath: 'assets/abecedario/e.png', description: 'E'),
//   Imagenes(imagePath: 'assets/abecedario/f.png', description: 'F'),
//   Imagenes(imagePath: 'assets/abecedario/g.png', description: 'G'),
//   Imagenes(imagePath: 'assets/abecedario/h.png', description: 'H'),
//   Imagenes(imagePath: 'assets/abecedario/i.png', description: 'I'),
//   Imagenes(imagePath: 'assets/abecedario/j.png', description: 'J'),
//   Imagenes(imagePath: 'assets/abecedario/k.png', description: 'K'),
//   Imagenes(imagePath: 'assets/abecedario/l.png', description: 'L'),
//   Imagenes(imagePath: 'assets/abecedario/m.png', description: 'M'),
//   Imagenes(imagePath: 'assets/abecedario/n.png', description: 'N'),
//   Imagenes(imagePath: 'assets/abecedario/ni.png', description: 'Ñ'),
//   Imagenes(imagePath: 'assets/abecedario/o.png', description: 'O'),
//   Imagenes(imagePath: 'assets/abecedario/p.png', description: 'P'),
//   Imagenes(imagePath: 'assets/abecedario/q.png', description: 'Q'),
//   Imagenes(imagePath: 'assets/abecedario/r.png', description: 'R'),
//   Imagenes(imagePath: 'assets/abecedario/s.png', description: 'S'),
//   Imagenes(imagePath: 'assets/abecedario/t.png', description: 'T'),
//   Imagenes(imagePath: 'assets/abecedario/u.png', description: 'U'),
//   Imagenes(imagePath: 'assets/abecedario/v.png', description: 'V'),
//   Imagenes(imagePath: 'assets/abecedario/w.png', description: 'W'),
//   Imagenes(imagePath: 'assets/abecedario/x.png', description: 'X'),
//   Imagenes(imagePath: 'assets/abecedario/y.png', description: 'Y'),
//   Imagenes(imagePath: 'assets/abecedario/z.png', description: 'Z'),
// ];

// class Imagenes {
//   String imagePath;
//   String description;

//   Imagenes({required this.imagePath, required this.description});
// }
