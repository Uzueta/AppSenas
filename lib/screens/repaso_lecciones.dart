import 'dart:math';

import 'package:disenos/models/opciones.dart';
import 'package:disenos/screens/lecciones.dart';
import 'package:flutter/material.dart';

var puntaje;
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
    puntaje = 0;
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
  var seleccionado;
  var opciones;
  late List<List<Opciones>> grupoOpciones;
  var tituloOpciones;
  var boton, enable;
  @override
  void initState() {
    super.initState();
    listaShuffle = new List.from(widget.lista);
    shuffle(listaShuffle);
    print("entra al init");
    indicador = new List<bool?>.generate(listaShuffle.length, (i) => false);
    // color = new List<Color>.generate(listaShuffle.length, (i) => Colors.yellow);
    seleccionado = new List<String>.generate(listaShuffle.length, (i) => "0");
    grupoOpciones = new List<List<Opciones>>.generate(
        listaShuffle.length,
        (i) => new List<Opciones>.generate(
            4, (i) => new Opciones(subtitulo: "", color: Color(0x00000000))));
    tituloOpciones = generarOpciones(listaShuffle);
    boton = new List<bool?>.generate(widget.lista.length, (i) => false);
    enable = new List<bool?>.generate(widget.lista.length, (i) => true);
  }

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size.height;
    // List listaShuffle = new List.from(widget.lista);
    return Container(
      height: _screenSize * 0.9,
      padding: EdgeInsets.all(0),
      child: PageView.builder(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        itemCount: listaShuffle.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              _instruccion(index),
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
                  "??A que palabra pertenece esta se??a?",
                  // lista[index].description,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24),
                ),
              ),
              Tiles(
                lista: listaShuffle,
                index: index,
                seleccionado: seleccionado,
                opciones: grupoOpciones,
                tituloOpciones: tituloOpciones,
                respuesta: listaShuffle[index].description,
                botonHabilitado: boton,
                opcionesHabilitadas: enable,
              )

              // Container(
              //     padding: EdgeInsets.all(30),
              //     child: TextField(
              //         controller: respuestas[index],
              //         decoration: InputDecoration(
              //             // enabled: _isEnabled,
              //             filled: indicador[index],
              //             fillColor: color[index],
              //             border: OutlineInputBorder(),
              //             hintText: 'Ingrese su respuesta'))),
              // Container(
              //     alignment: Alignment.centerLeft,
              //     padding: EdgeInsets.only(left: 30),
              //     child: ConstrainedBox(
              //         constraints:
              //             BoxConstraints.tightFor(height: 50, width: 210),
              //         child: ElevatedButton(
              //             onPressed: () {
              //               setState(() {
              //                 if (respuestas[index]
              //                     .text
              //                     .toString()
              //                     .isNotEmpty) {
              //                   indicador[index] = true;
              //                   if (respuestas[index].text.toLowerCase() ==
              //                       listaShuffle[index]
              //                           .description
              //                           .toString()
              //                           .toLowerCase()) {
              //                     color[index] = Colors.green;
              //                     // print("RESPUESTA CORRECTA");
              //                   } else {
              //                     color[index] = Colors.red;
              //                     // print("RESPUESTA INCORRECTA");
              //                   }
              //                 }
              //                 if (index == listaShuffle.length - 1) {
              //                   print("ultimo");
              //                 }
              //               });
              //               // print(respuestas[index].text),
              //               // checarRespuesta(respuestas[index].text, index,
              //               //     listaShuffle),
              //             },
              //             child: Text("Comprobar respuesta",
              //                 textAlign: TextAlign.center,
              //                 style: TextStyle(fontSize: 17))))
              // )
            ],
          );
        },
      ),
    );
  }

  Container _instruccion(int index) {
    if (index == 0) {
      return Container(
        padding: EdgeInsets.all(20),
        child: Text(
          "Desliza hacia abajo para ver la siguientes preguntas",
          style: TextStyle(fontSize: 24),
          textAlign: TextAlign.justify,
        ),
      );
    } else {
      return Container(child: Text(""));
    }
  }
}

List generarOpciones(List lista) {
  print("Entra al metodo");
  var _random = new Random();
  // var items;
  List<List<String>> items = List<List<String>>.empty(growable: true);

  print("Se empieza el ciclo");
  for (var i = 0; i < lista.length; i++) {
    // var temp;
    List<String> temp = List<String>.empty(growable: true);
    temp.add(lista[i].description);
    temp.add(checarOpciones(
        lista[_random.nextInt(lista.length)].description, temp, lista));
    temp.add(checarOpciones(
        lista[_random.nextInt(lista.length)].description, temp, lista));
    temp.add(checarOpciones(
        lista[_random.nextInt(lista.length)].description, temp, lista));
    shuffle(temp);
    items.add(temp);
  }

  print("Se acaba el ciclo");

  // for (var i = 0; i < lista.length; i++) {
  //   print("[");

  //   print(items[i][0]);
  //   print(items[i][1]);
  //   print(items[i][2]);
  //   print(items[i][3]);

  //   print("]");
  // }

  // var tituloOpciones = [
  //   respuesta,
  //   lista[_random.nextInt(lista.length)].description,
  //   lista[_random.nextInt(lista.length)].description,
  //   lista[_random.nextInt(lista.length)].description,
  // ];
  print("Termina el metodo");
  return items;
}

String checarOpciones(String elemento, List temp, List lista) {
  Random _random = new Random();
  while (temp.contains(elemento)) {
    elemento = lista[_random.nextInt(lista.length)].description;
  }
  return elemento;
}

class Tiles extends StatefulWidget {
  final String respuesta;
  final List<String> seleccionado;
  final int index;
  final List<dynamic> tituloOpciones;
  final List<dynamic> lista;
  final List<List<Opciones>> opciones;
  final List<bool?> botonHabilitado;
  final List<bool?> opcionesHabilitadas;
  Tiles(
      {Key? key,
      required this.lista,
      required this.index,
      required this.seleccionado,
      required this.opciones,
      required this.tituloOpciones,
      required this.respuesta,
      required this.botonHabilitado,
      required this.opcionesHabilitadas})
      : super(key: key);

  @override
  _TilesState createState() => _TilesState();
}

class _TilesState extends State<Tiles> {
  var boton;
  var enable;
  @override
  void initState() {
    super.initState();
    // boton = new List<bool?>.generate(widget.lista.length, (i) => false);
    // enable = new List<bool?>.generate(widget.lista.length, (i) => true);
    boton = widget.botonHabilitado;
    enable = widget.opcionesHabilitadas;
    // print(
    //     "1: ${widget.tituloOpciones[widget.index][0]} - 2: ${widget.tituloOpciones[widget.index][1]} - 3: ${widget.tituloOpciones[widget.index][2]} - 4: ${widget.tituloOpciones[widget.index][3]} LA CORRECTA ES: ${widget.respuesta}");
    // print(
    //     "_____________________________________________________________________________________________________________________________________");
  }

  setSelectedRadioTile(String val) {
    setState(() {
      widget.seleccionado[widget.index] = val;
      // selectedRadioTile = val;
    });
  }

  var sub = "";
  @override
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      RadioListTile(
        // tileColor: Color(0x00000000),
        tileColor: widget.opciones[widget.index][0].color,
        value: "${widget.tituloOpciones[widget.index][0]}",
        // value: 1,
        groupValue: widget.seleccionado[widget.index],
        title: Text(widget.tituloOpciones[widget.index][0]),
        subtitle: Text(widget.opciones[widget.index][0].subtitulo),
        onChanged: enable[widget.index]
            ? (val) {
                setSelectedRadioTile("$val");
                setState(() {
                  boton[widget.index] =
                      checarUltimo(widget.index, widget.lista.length);
                  widget.opciones[widget.index][0].subtitulo = "";
                  widget.opciones[widget.index][1].subtitulo = "";
                  widget.opciones[widget.index][2].subtitulo = "";
                  widget.opciones[widget.index][3].subtitulo = "";
                  if ("$val" == widget.respuesta) {
                    widget.opciones[widget.index][0].subtitulo =
                        "Respuesta correcta";
                    widget.opciones[widget.index][0].color = Colors.green;
                    puntaje = puntaje + 1;
                    print(puntaje);
                  } else {
                    widget.opciones[widget.index][0].subtitulo =
                        "Respuesta incorrecta";
                    widget.opciones[widget.index][0].color = Colors.red;
                    print(puntaje);
                  }
                  enable[widget.index] = false;
                });
              }
            : null,
        activeColor: widget.opciones[widget.index][0].color,
      ),
      RadioListTile(
        tileColor: widget.opciones[widget.index][1].color,
        value: "${widget.tituloOpciones[widget.index][1]}",
        // value: 2,
        groupValue: widget.seleccionado[widget.index],
        title: Text(widget.tituloOpciones[widget.index][1]),
        subtitle: Text(widget.opciones[widget.index][1].subtitulo),
        onChanged: enable[widget.index]
            ? (val) {
                setSelectedRadioTile("$val");
                setState(() {
                  boton[widget.index] =
                      checarUltimo(widget.index, widget.lista.length);
                  widget.opciones[widget.index][0].subtitulo = "";
                  widget.opciones[widget.index][1].subtitulo = "";
                  widget.opciones[widget.index][2].subtitulo = "";
                  widget.opciones[widget.index][3].subtitulo = "";
                  if ("$val" == widget.respuesta) {
                    widget.opciones[widget.index][1].subtitulo =
                        "Respuesta correcta";
                    puntaje = puntaje + 1;
                    print(puntaje);
                    widget.opciones[widget.index][1].color = Colors.green;
                  } else {
                    widget.opciones[widget.index][1].subtitulo =
                        "Respuesta incorrecta";
                    widget.opciones[widget.index][1].color = Colors.red;
                    print(puntaje);
                  }
                  enable[widget.index] = false;
                });
              }
            : null,
        activeColor: widget.opciones[widget.index][1].color,
      ),
      RadioListTile(
        tileColor: widget.opciones[widget.index][2].color,
        // value: 3,
        value: "${widget.tituloOpciones[widget.index][2]}",
        groupValue: widget.seleccionado[widget.index],
        title: Text(widget.tituloOpciones[widget.index][2]),
        subtitle: Text(widget.opciones[widget.index][2].subtitulo),
        onChanged: enable[widget.index]
            ? (val) {
                setSelectedRadioTile("$val");
                setState(() {
                  boton[widget.index] =
                      checarUltimo(widget.index, widget.lista.length);
                  widget.opciones[widget.index][0].subtitulo = "";
                  widget.opciones[widget.index][1].subtitulo = "";
                  widget.opciones[widget.index][2].subtitulo = "";
                  widget.opciones[widget.index][3].subtitulo = "";
                  if ("$val" == widget.respuesta) {
                    widget.opciones[widget.index][2].subtitulo =
                        "Respuesta correcta";
                    puntaje = puntaje + 1;
                    print(puntaje);
                    widget.opciones[widget.index][2].color = Colors.green;
                  } else {
                    widget.opciones[widget.index][2].subtitulo =
                        "Respuesta incorrecta";
                    widget.opciones[widget.index][2].color = Colors.red;
                    print(puntaje);
                  }
                  enable[widget.index] = false;
                });
              }
            : null,
        activeColor: widget.opciones[widget.index][2].color,
      ),
      RadioListTile(
        tileColor: widget.opciones[widget.index][3].color,
        // value: 4,
        value: "${widget.tituloOpciones[widget.index][3]}",
        groupValue: widget.seleccionado[widget.index],
        title: Text(widget.tituloOpciones[widget.index][3]),
        subtitle: Text(widget.opciones[widget.index][3].subtitulo),
        onChanged: enable[widget.index]
            ? (val) {
                setSelectedRadioTile("$val");
                setState(() {
                  boton[widget.index] =
                      checarUltimo(widget.index, widget.lista.length);
                  widget.opciones[widget.index][0].subtitulo = "";
                  widget.opciones[widget.index][1].subtitulo = "";
                  widget.opciones[widget.index][2].subtitulo = "";
                  widget.opciones[widget.index][3].subtitulo = "";
                  if ("$val" == widget.respuesta) {
                    widget.opciones[widget.index][3].subtitulo =
                        "Respuesta correcta";
                    puntaje = puntaje + 1;
                    print(puntaje);
                    widget.opciones[widget.index][3].color = Colors.green;
                  } else {
                    widget.opciones[widget.index][3].subtitulo =
                        "Respuesta incorrecta";
                    widget.opciones[widget.index][3].color = Colors.red;
                    print(puntaje);
                  }
                  enable[widget.index] = false;
                });
              }
            : null,
        // onChanged: null,
        activeColor: widget.opciones[widget.index][3].color,
      ),
      Visibility(
        visible: boton[widget.index],
        child: Container(
            padding: EdgeInsets.only(top: 20),
            child: ConstrainedBox(
                constraints: BoxConstraints.tightFor(height: 40, width: 120),
                child: ElevatedButton(
                    onPressed: () => {
                          _mostrarAlerta(
                              context, "Puntaje", puntaje, lista.length),
                        },
                    child: Text("Continuar", style: TextStyle(fontSize: 17))))),
      ),
    ]);
  }
}

void _mostrarAlerta(
    BuildContext context, String titulo, int puntaje, int puntajeMaximo) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return AlertDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        title: Text(titulo),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            puntaje > 1
                ? Text(
                    '??Tuviste un total de $puntaje puntos de $puntajeMaximo!')
                : Text('??Tuviste un total de $puntaje punto de $puntajeMaximo!')
            // FlutterLogo(size: 100.0)
          ],
        ),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 20),
            child: TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('Regresar')),
          ),
          Container(
            padding: EdgeInsets.only(right: 10),
            child: TextButton(
                onPressed: () {
                  int count = 0;
                  Navigator.of(context).popUntil((_) => count++ >= 3);
                },
                child: Text('Volver al inicio')),
          )
        ],
      );
    },
  );
}

bool checarUltimo(int index, int tam) {
  if (index == tam - 1) {
    print("ultimo");
    return true;
  } else {
    return false;
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

//Borrar
class RepasoPageView extends StatelessWidget {
  final List lista;

  const RepasoPageView({
    Key? key,
    required this.lista,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size.height;
    List listaShuffle = new List.from(lista);
    shuffle(listaShuffle);

    var visible = false;

    return Container(
      height: _screenSize * 0.8,
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
                  "??A que palabra pertenece esta se??a?",
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
