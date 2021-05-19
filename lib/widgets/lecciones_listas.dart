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
}

class Imagenes {
  String imagePath;
  String description;

  Imagenes({required this.imagePath, required this.description});
}
