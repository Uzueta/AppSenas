class LeccionesLista {
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

  List<Imagenes> abc = [
    Imagenes(imagePath: 'assets/abecedario/a.png', description: 'A'),
    Imagenes(imagePath: 'assets/abecedario/b.png', description: 'B'),
    Imagenes(imagePath: 'assets/abecedario/c.png', description: 'C'),
    Imagenes(imagePath: 'assets/abecedario/d.png', description: 'D'),
    Imagenes(imagePath: 'assets/abecedario/e.png', description: 'E'),
    Imagenes(imagePath: 'assets/abecedario/f.png', description: 'F'),
    Imagenes(imagePath: 'assets/abecedario/g.png', description: 'G'),
    Imagenes(imagePath: 'assets/abecedario/h.png', description: 'H'),
    Imagenes(imagePath: 'assets/abecedario/i.png', description: 'I'),
    Imagenes(imagePath: 'assets/abecedario/j.png', description: 'J'),
    Imagenes(imagePath: 'assets/abecedario/k.png', description: 'K'),
    Imagenes(imagePath: 'assets/abecedario/l.png', description: 'L'),
    Imagenes(imagePath: 'assets/abecedario/m.png', description: 'M'),
    Imagenes(imagePath: 'assets/abecedario/n.png', description: 'N'),
    Imagenes(imagePath: 'assets/abecedario/ni.png', description: 'Ñ'),
    Imagenes(imagePath: 'assets/abecedario/o.png', description: 'O'),
    Imagenes(imagePath: 'assets/abecedario/p.png', description: 'P'),
    Imagenes(imagePath: 'assets/abecedario/q.png', description: 'Q'),
    Imagenes(imagePath: 'assets/abecedario/r.png', description: 'R'),
    Imagenes(imagePath: 'assets/abecedario/s.png', description: 'S'),
    Imagenes(imagePath: 'assets/abecedario/t.png', description: 'T'),
    Imagenes(imagePath: 'assets/abecedario/u.png', description: 'U'),
    Imagenes(imagePath: 'assets/abecedario/v.png', description: 'V'),
    Imagenes(imagePath: 'assets/abecedario/w.png', description: 'W'),
    Imagenes(imagePath: 'assets/abecedario/x.png', description: 'X'),
    Imagenes(imagePath: 'assets/abecedario/y.png', description: 'Y'),
    Imagenes(imagePath: 'assets/abecedario/z.png', description: 'Z'),
  ];

  List<Imagenes> numeros = [
    Imagenes(imagePath: 'assets/numeros/01.png', description: '1'),
    Imagenes(imagePath: 'assets/numeros/02.png', description: '2'),
    Imagenes(imagePath: 'assets/numeros/03.png', description: '3'),
    Imagenes(imagePath: 'assets/numeros/04.png', description: '4'),
    Imagenes(imagePath: 'assets/numeros/05.png', description: '5'),
    Imagenes(imagePath: 'assets/numeros/06.png', description: '6'),
    Imagenes(imagePath: 'assets/numeros/07.png', description: '7'),
    Imagenes(imagePath: 'assets/numeros/08.png', description: '8'),
    Imagenes(imagePath: 'assets/numeros/09.png', description: '9'),
    Imagenes(imagePath: 'assets/numeros/10.png', description: '10'),
    Imagenes(imagePath: 'assets/numeros/11.png', description: '11'),
    Imagenes(imagePath: 'assets/numeros/12.png', description: '12'),
    Imagenes(imagePath: 'assets/numeros/13.png', description: '13'),
    Imagenes(imagePath: 'assets/numeros/14.png', description: '14'),
    Imagenes(imagePath: 'assets/numeros/15.png', description: '15'),
    Imagenes(imagePath: 'assets/numeros/16.png', description: '16'),
    Imagenes(imagePath: 'assets/numeros/17.png', description: '17'),
    Imagenes(imagePath: 'assets/numeros/18.png', description: '18'),
    Imagenes(imagePath: 'assets/numeros/19.png', description: '19'),
    Imagenes(imagePath: 'assets/numeros/20.png', description: '20'),
    Imagenes(imagePath: 'assets/numeros/30.png', description: '30'),
    Imagenes(imagePath: 'assets/numeros/40.png', description: '40'),
    Imagenes(imagePath: 'assets/numeros/50.png', description: '50'),
    Imagenes(imagePath: 'assets/numeros/60.png', description: '60'),
    Imagenes(imagePath: 'assets/numeros/70.png', description: '70'),
    Imagenes(imagePath: 'assets/numeros/80.png', description: '80'),
    Imagenes(imagePath: 'assets/numeros/90.png', description: '90'),
    Imagenes(imagePath: 'assets/numeros/100.png', description: '100'),
    Imagenes(imagePath: 'assets/numeros/1000.png', description: '1,000'),
    Imagenes(imagePath: 'assets/numeros/1m.png', description: '1,000,000'),
  ];

  List<Imagenes> dias = [
    Imagenes(imagePath: 'assets/dias/lunes.png', description: 'Lunes'),
    Imagenes(imagePath: 'assets/dias/martes.png', description: 'Martes'),
    Imagenes(imagePath: 'assets/dias/miercoles.png', description: 'Miércoles'),
    Imagenes(imagePath: 'assets/dias/jueves.png', description: 'Jueves'),
    Imagenes(imagePath: 'assets/dias/viernes.png', description: 'Viernes'),
    Imagenes(imagePath: 'assets/dias/sabado.png', description: 'Sábado'),
    Imagenes(imagePath: 'assets/dias/domingo.png', description: 'Domingo'),
  ];
}

class Imagenes {
  String imagePath;
  String description;

  Imagenes({required this.imagePath, required this.description});
}
