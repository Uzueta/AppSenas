import 'package:disenos/models/lecciones_listas.dart';
import 'package:disenos/screens/repaso_lecciones.dart';
import 'package:flutter/material.dart';

LeccionesLista listas = LeccionesLista();
List lista = listas.imagenes;

class PantallaLeccion extends StatelessWidget {
  final String titulo;
  final int id;

  const PantallaLeccion({Key? key, required this.titulo, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      case 4:
        lista = listas.meses;
        break;
      case 5:
        lista = listas.colores;
        break;
      case 6:
        lista = listas.tiempos;
        break;
      case 7:
        lista = listas.animales1;
        break;
      case 8:
        lista = listas.animales2;
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
                style: TextStyle(fontSize: 22, fontFamily: 'Signika'),
              )),
          Leccion(
            lista: lista,
            // palabra: 'A',
            // ruta: 'assets/jobs.png',
          ),
          Container(
              padding: EdgeInsets.only(top: 70),
              child: ConstrainedBox(
                  constraints: BoxConstraints.tightFor(height: 40, width: 120),
                  child: ElevatedButton(
                      onPressed: () => {
                            _mostrarAlerta(context, this.titulo),
                          },
                      child:
                          Text("Continuar", style: TextStyle(fontSize: 17))))),
        ],
      ),
    );
  }
}

void _mostrarAlerta(BuildContext context, String titulo) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return AlertDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        title: Text('¡Espera!'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('¿Ya viste todas las imagenes y deseas realizar un repaso?'),
            // FlutterLogo(size: 100.0)
          ],
        ),
        actions: <Widget>[
          TextButton(
              onPressed: () => Navigator.of(context).pop(), child: Text('No')),
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Repaso(titulo: titulo, lista: lista)));
              },
              child: Text('Si'))
        ],
      );
    },
  );
}

class Leccion extends StatelessWidget {
  final List lista;

  const Leccion({
    Key? key,
    required this.lista,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _screenZise = MediaQuery.of(context).size.height;
    return Container(
      height: _screenZise * 0.5,
      padding: EdgeInsets.all(0),
      child: PageView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: lista.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 2, color: Color(0xFF303030))),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image(
                    image: AssetImage(lista[index].imagePath),
                    height: 300,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 30),
                child: Text(
                  lista[index].description,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 40, fontFamily: 'Fredoka'),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
