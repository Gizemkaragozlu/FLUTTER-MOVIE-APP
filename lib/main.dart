import 'package:flutter/material.dart';
import 'package:movie_app/DetaySayfa.dart';
import 'package:movie_app/Filmler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(),
    );
  }
}

List<Filmler> filmleriGetir() {
  //burası ne claas olusturdum ya onu ekrana cagırmak ıcın
  var filmlerListesi = <Filmler>[];

  var f1 = Filmler(1, "Avengers", "avengers.jpg", 15.99);
  var f2 = Filmler(2, "Black Adam", "black.jpg", 23.99);
  var f3 = Filmler(3, "Organize İşler", "organize.jpg", 32.99);
  var f4 = Filmler(4, "300 Sparta", "sparta.jpg", 12.99);
  var f5 = Filmler(5, "Venom", "venom.jpg", 15.99);
  var f6 = Filmler(6, "Yeşil Yol", "yesilyol.jpg", 42.99);

  filmlerListesi.add(f1);
  filmlerListesi.add(f2);
  filmlerListesi.add(f3);
  filmlerListesi.add(f4);
  filmlerListesi.add(f5);
  filmlerListesi.add(f6);
  return filmlerListesi;
}

var filmlerListesi = <Filmler>[];

class MyHomePage extends StatefulWidget {
  const MyHomePage();

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    filmlerListesi = filmleriGetir();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Movie")),
      ),
      body: GridView.builder(
        itemCount: filmlerListesi.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 2 / 3.5), //Oranlamamız
        itemBuilder: (context, index) {
          var film = filmlerListesi[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) =>
                          DetaySayfa(film: film))) //Veri nesnesi için yazılır
                  );
            },
            child: Card(
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly, //Aralarında boşuk olsun diye
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset("assets/${film.film_resim_adi}"),
                  ), //Dinamik olarak tüm resimlere erişiriz
                  Text(
                    film.film_adi,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${film.film_fiyat} \u{20BA}",
                    style: TextStyle(fontSize: 15),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
