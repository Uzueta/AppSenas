import 'dart:math';

import 'package:flutter/material.dart';

var respuestas;
// TextEditingController respuesta = new TextEditingController();

class Repaso extends StatelessWidget {
  final List lista;
  final String titulo;
  const Repaso({Key? key, required this.titulo, required this.lista})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    respuestas = new List<TextEditingController>.generate(
        lista.length, (i) => new TextEditingController());

    return Scaffold(
      appBar: AppBar(title: Text("Repaso de ${this.titulo.toLowerCase()}")),
      body: Column(
        children: [
          RepasoView(
            lista: this.lista,
          ),
          // Container(
          //     padding: EdgeInsets.only(top: 70),
          //     child: ConstrainedBox(
          //         constraints: BoxConstraints.tightFor(height: 40, width: 120),
          //         child: ElevatedButton(
          //             onPressed: () => {print(respuestas.text)},
          //             child:
          //                 Text("Continuar", style: TextStyle(fontSize: 17))))),
        ],
      ),
    );
  }
}

class RepasoView extends StatefulWidget {
  final List lista;

  RepasoView({Key? key, required this.lista}) : super(key: key);

  @override
  _RepasoViewState createState() => _RepasoViewState();
}

late List listaShuffle;

class _RepasoViewState extends State<RepasoView> {
  @mustCallSuper
  void initState() {
    listaShuffle = new List.from(widget.lista);
    shuffle(listaShuffle);
  }

  // bool _visible = false;
  Color _fillColor = Colors.yellow;
  bool _flag = false;

  // var textfields =
  //     new List<TextField>.generate(listaShuffle.length, (i) => new TextField());

  var colores =
      new List<Color>.generate(listaShuffle.length, (i) => Colors.yellow);

  var flags = new List<bool>.generate(listaShuffle.length, (i) => false);

  @override
  Widget build(BuildContext context) {
    final _screenZise = MediaQuery.of(context).size.height;

    // List listaShuffle = new List.from(widget.lista);
    // shuffle(listaShuffle);

    return Container(
      height: _screenZise * 0.8,
      padding: EdgeInsets.all(0),
      child: PageView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: listaShuffle.length,
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
                    image: AssetImage(listaShuffle[index].imagePath),
                    height: 300,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 30),
                child: Text(
                  "¿A que palabra pertenece esta seña?",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24),
                ),
              ),
              Container(
                  padding: EdgeInsets.all(30),
                  child: TextField(
                      controller: respuestas[index],
                      decoration: InputDecoration(
                          enabled: !flags[index],
                          filled: flags[index],
                          fillColor: colores[index],
                          border: OutlineInputBorder(),
                          hintText: 'Ingrese su respuesta'))),
              Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 30),
                  child: ConstrainedBox(
                      constraints:
                          BoxConstraints.tightFor(height: 50, width: 210),
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              if (respuestas[index]
                                  .text
                                  .toString()
                                  .isNotEmpty) {
                                flags[index] = true;
                                if (respuestas[index].text.toLowerCase() ==
                                    listaShuffle[index]
                                        .description
                                        .toString()
                                        .toLowerCase()) {
                                  colores[index] = Colors.green;
                                  // print("RESPUESTA CORRECTA");
                                } else {
                                  colores[index] = Colors.red;
                                  // print("RESPUESTA INCORRECTA");
                                }
                              }
                              if (index == listaShuffle.length - 1) {
                                print("ultimo");
                              }
                            });
                          },
                          child: Text("Comprobar respuesta",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 17)))))
            ],
          );
        },
      ),
    );
  }
}

// void checarRespuesta(
//     String respuesta, int index, List<dynamic> lista, Color color) {
//   if (respuesta.toLowerCase() ==
//       lista[index].description.toString().toLowerCase()) {
//     color = Colors.green;
//     print("RESPUESTA CORRECTA");
//   } else {
//     color = Colors.red;
//     print("RESPUESTA INCORRECTA");
//   }
// }

// class RepasoPageView extends StatelessWidget {
//   final List lista;

//   const RepasoPageView({
//     Key? key,
//     required this.lista,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final _screenZise = MediaQuery.of(context).size.height;
//     List listaShuffle = new List.from(lista);
//     shuffle(listaShuffle);

//     var visible = false;

//     return Container(
//       height: _screenZise * 0.8,
//       padding: EdgeInsets.all(0),
//       child: PageView.builder(
//         physics: BouncingScrollPhysics(),
//         itemCount: listaShuffle.length,
//         itemBuilder: (context, index) {
//           return Column(
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     border: Border.all(width: 2, color: Color(0xFF303030))),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(20),
//                   child: Image(
//                     image: AssetImage(listaShuffle[index].imagePath),
//                     height: 300,
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.only(top: 30),
//                 child: Text(
//                   "¿A que palabra pertenece esta seña?",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(fontSize: 24),
//                 ),
//               ),
//               Container(
//                   padding: EdgeInsets.all(30),
//                   child: TextField(
//                       controller: respuestas[index],
//                       decoration: InputDecoration(
//                           // enabled: _isEnabled,
//                           // filled: true,
//                           // fillColor: fillColor,
//                           border: OutlineInputBorder(),
//                           hintText: 'Ingrese su respuesta'))),
//               Visibility(
//                 visible: visible,
//                 child: Text("prueba"),
//               ),
//               Container(
//                   alignment: Alignment.centerLeft,
//                   padding: EdgeInsets.only(left: 30),
//                   child: ConstrainedBox(
//                       constraints:
//                           BoxConstraints.tightFor(height: 50, width: 210),
//                       child: ElevatedButton(
//                           onPressed: () => {
//                                 print(respuestas[index].text),
//                                 checarRespuesta(respuestas[index].text, index,
//                                     listaShuffle),
//                               },
//                           child: Text("Comprobar respuesta",
//                               textAlign: TextAlign.center,
//                               style: TextStyle(fontSize: 17)))))
//             ],
//           );
//         },
//       ),
//     );
//   }
// }

TextField caja(int index) {
  TextField caja = new TextField(
      controller: respuestas[index],
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.red,
          border: OutlineInputBorder(),
          hintText: 'Ingrese su respuesta'));
  return caja;
}

List shuffle(List items) {
  var random = new Random();

  // Go through all elements.
  for (var i = items.length - 1; i > 0; i--) {
    // Pick a pseudorandom number according to the list length
    var n = random.nextInt(i + 1);

    var temp = items[i];
    items[i] = items[n];
    items[n] = temp;
  }

  return items;
}
