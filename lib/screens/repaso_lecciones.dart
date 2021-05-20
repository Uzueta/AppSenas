import 'dart:math';

import 'package:flutter/material.dart';

class Repaso extends StatelessWidget {
  final List lista;
  final String titulo;
  const Repaso({Key? key, required this.titulo, required this.lista})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Repaso de ${this.titulo.toLowerCase()}")),
      body: Column(
        children: [
          RepasoPageView(
            lista: this.lista,
            // palabra: 'A',
            // ruta: 'assets/jobs.png',
          ),
          Container(
              padding: EdgeInsets.only(top: 70),
              child: ConstrainedBox(
                  constraints: BoxConstraints.tightFor(height: 40, width: 120),
                  child: ElevatedButton(
                      onPressed: () => {
                            // _mostrarAlerta(context),
                          },
                      child:
                          Text("Continuar", style: TextStyle(fontSize: 17))))),
        ],
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
    return Container(
      height: _screenZise * 0.5,
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
            ],
          );
        },
      ),
    );
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
