import 'dart:ui';

import 'package:disenos/screens/basic_design.dart';
import 'package:disenos/screens/lecciones.dart';
import 'package:disenos/screens/pagina.dart';
import 'package:disenos/screens/scroll_design.dart';
import 'package:flutter/material.dart';

class CardTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        buildTableRow(
            'Naturalezas',
            'assets/naturaleza.png',
            BasicDesignScreen(),
            'Abecedario',
            'assets/abc.png',
            ScrollScreen()),
        buildTableRow('Trabajos', 'assets/jobs.png', Pagina02(), 'Saludos',
            'assets/saludos.png', Container()),
        buildTableRow('Entertainment', 'assets/ola.png', Container(), 'Grocery',
            'assets/morfin.png', PantallaLeccion(titulo: 'Grocery')),
        buildTableRow('General', 'assets/morfin.png', Container(), 'Transport',
            'assets/jobs.png', Container()),
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
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                ruta,
                width: 150,
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
