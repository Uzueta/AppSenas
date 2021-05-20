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
          RepasoIndicador(lista: this.lista)
          // RepasoPageView(
          //   lista: this.lista,
          // ),
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

class RepasoIndicador extends StatefulWidget {
  final List<dynamic> lista;

  RepasoIndicador({Key? key, required this.lista}) : super(key: key);

  @override
  _RepasoIndicadorState createState() => _RepasoIndicadorState();
}

class _RepasoIndicadorState extends State<RepasoIndicador> {
  late List listaShuffle;
  var indicador;
  var color;
  @override
  void initState() {
    super.initState();
    listaShuffle = new List.from(widget.lista);
    shuffle(listaShuffle);
    print("entra al init");
    indicador = new List<bool?>.generate(listaShuffle.length, (i) => false);
    color = new List<Color>.generate(listaShuffle.length, (i) => Colors.yellow);
  }

  @override
  Widget build(BuildContext context) {
    final _screenZise = MediaQuery.of(context).size.height;
    // List listaShuffle = new List.from(widget.lista);

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
                  // lista[index].description,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24),
                ),
              ),
              Container(
                  padding: EdgeInsets.all(30),
                  child: TextField(
                      controller: respuestas[index],
                      decoration: InputDecoration(
                          // enabled: _isEnabled,
                          filled: indicador[index],
                          fillColor: color[index],
                          border: OutlineInputBorder(),
                          hintText: 'Ingrese su respuesta'))),
              // Visibility(
              //   visible: indicador,
              //   child: Text("prueba"),
              // ),
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
                                indicador[index] = true;
                                if (respuestas[index].text.toLowerCase() ==
                                    listaShuffle[index]
                                        .description
                                        .toString()
                                        .toLowerCase()) {
                                  color[index] = Colors.green;
                                  // print("RESPUESTA CORRECTA");
                                } else {
                                  color[index] = Colors.red;
                                  // print("RESPUESTA INCORRECTA");
                                }
                              }
                              if (index == listaShuffle.length - 1) {
                                print("ultimo");
                              }
                            });
                            // print(respuestas[index].text),
                            // checarRespuesta(respuestas[index].text, index,
                            //     listaShuffle),
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

class RepasoPageView extends StatelessWidget {
  final List lista;

  const RepasoPageView({
    Key? key,
    required this.lista,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _screenZise = MediaQuery.of(context).size.height;
    List listaShuffle = new List.from(lista);
    shuffle(listaShuffle);

    var visible = false;

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
                  // lista[index].description,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24),
                ),
              ),
              Container(
                  padding: EdgeInsets.all(30),
                  child: TextField(
                      controller: respuestas[index],
                      decoration: InputDecoration(
                          // enabled: _isEnabled,
                          // filled: true,
                          // fillColor: fillColor,
                          border: OutlineInputBorder(),
                          hintText: 'Ingrese su respuesta'))),
              Visibility(
                visible: visible,
                child: Text("prueba"),
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 30),
                  child: ConstrainedBox(
                      constraints:
                          BoxConstraints.tightFor(height: 50, width: 210),
                      child: ElevatedButton(
                          onPressed: () => {
                                // print(respuestas[index].text),
                                // checarRespuesta(respuestas[index].text, index,
                                //     listaShuffle),
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

void checarRespuesta(String respuesta, int index, List<dynamic> lista) {
  if (respuesta.toLowerCase() ==
      lista[index].description.toString().toLowerCase()) {
    print("RESPUESTA CORRECTA");
  } else {
    print("RESPUESTA INCORRECTA");
  }
}

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
