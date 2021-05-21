import 'dart:ui';
import 'package:disenos/screens/lecciones.dart';
import 'package:disenos/screens/radios.dart';
import 'package:flutter/material.dart';

class CardTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        buildTableRow(
          'Abecedario',
          'assets/abc.png',
          PantallaLeccion(
            titulo: 'Abecedario',
            id: 1,
          ),
          'Números',
          'assets/numeros.png',
          PantallaLeccion(
            id: 2,
            titulo: 'Números',
          ),
        ),
        buildTableRow(
          'Días',
          'assets/dias.png',
          PantallaLeccion(
            id: 3,
            titulo: 'Días',
          ),
          'Meses',
          'assets/meses.png',
          PantallaLeccion(
            id: 4,
            titulo: 'Meses',
          ),
        ),
        buildTableRow(
          'Colores',
          'assets/colores.png',
          PantallaLeccion(
            id: 5,
            titulo: 'Colores',
          ),
          'Tiempo',
          'assets/tiempo.png',
          PantallaLeccion(
            id: 6,
            titulo: 'Tiempo',
          ),
        ),
        buildTableRow(
          'Animales 1',
          'assets/animales1.png',
          PantallaLeccion(
            id: 7,
            titulo: 'Animales 1',
          ),
          'Animales 2',
          'assets/animales2.png',
          PantallaLeccion(
            id: 8,
            titulo: 'Animales 2',
          ),
        ),
      ],
    );
  }

  TableRow buildTableRow(String text, String ruta, Widget screen, String text2,
      String ruta2, Widget screen2) {
    return TableRow(children: [
      _SigleCard(
          color: Colors.white,
          // color: Colors.blue,
          // icon: Icons.border_all,
          text: text,
          ruta: ruta,
          screen: screen),
      _SigleCard(
          color: Colors.white,
          // color: Colors.pinkAccent,
          // icon: Icons.car_rental,
          text: text2,
          ruta: ruta2,
          screen: screen2),
    ]);
  }
}

class _SigleCard extends StatelessWidget {
  // final IconData icon;
  final Color color;
  final String text;
  final String ruta;
  final Widget screen;

  const _SigleCard(
      {Key? key,
      // required this.icon,
      required this.color,
      required this.text,
      required this.ruta,
      required this.screen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _CardBackground(
        screen: this.screen,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(13),
              child: Image.asset(
                ruta,
                height: 110,
                fit: BoxFit.cover,
              ),
            ),
            //-------------------------------------
            // CircleAvatar(
            //   backgroundImage: ExactAssetImage(ruta),
            //   // backgroundColor: this.color,
            //   // child: Icon(
            //   //   this.icon,
            //   //   size: 35,
            //   //   color: Colors.white,
            //   // ),
            //   radius: 40,
            // ),
            SizedBox(height: 10),
            Text(
              this.text,
              style: TextStyle(color: this.color, fontSize: 18),
            )
          ],
        ));
  }
}

class _CardBackground extends StatelessWidget {
  final Widget child;
  final Widget screen;

  const _CardBackground({Key? key, required this.child, required this.screen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(15),
        child: InkWell(
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => screen)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                height: 180,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(62, 66, 107, 0.7),
                    borderRadius: BorderRadius.circular(20)),
                child: this.child,
              ),
            ),
          ),
        ));
  }
}
