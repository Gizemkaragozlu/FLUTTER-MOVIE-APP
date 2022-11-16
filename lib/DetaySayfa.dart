import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Filmler.dart';

class DetaySayfa extends StatefulWidget {
  Filmler film; //Filmlere erişebilmek için yazılır
  DetaySayfa({required this.film});

  @override
  State<DetaySayfa> createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child:
                Text(widget.film.film_adi)), //Filmin adını app bara yazdırdık.
      ),
      body: Center(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Image.asset("assets/${widget.film.film_resim_adi}"),
          Text(
            " ${widget.film.film_fiyat}\u{20BA}",
            style: TextStyle(fontSize: 48, color: Colors.grey.shade400),
          ),
          SizedBox(
            width: 200,
            height: 50,
            child: ElevatedButton(
              child: Text("KİRALA"),
              // color:Colors.red,
              //textColor:Colors.white,
              onPressed: () {
                print("${widget.film.film_adi}");
              },
            ),
          ),
        ]),
      ),
    );
  }
}
