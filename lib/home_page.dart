import 'package:flutter/material.dart';
import 'package:pokedex_exe/template_detail.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, this.name});
  final String? name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  //hallo text
                  Container(
                    padding: EdgeInsets.only(top: 65, left: 20),
                    child: RichText(
                      text: TextSpan(
                          text: 'Hallo, ',
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                                text: '$name',
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 42, 154, 237)))
                          ]),
                    ),
                  ),

                  //photo profile
                  Container(
                    margin: EdgeInsets.only(top: 70, left: 190),
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black12, width: 1)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        'assets/images/pokemon-trainer.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(left: 20),
                child: const Text(
                  "Pokedex",
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 219, 5),
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none),
                      filled: true,
                      fillColor: Colors.grey[200],
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 14.0),
                      hintText: 'Search Pokemon',
                      hintStyle: const TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.normal),
                      prefixIcon: const Icon(Icons.search)),
                ),
              ),
              Column(
                children: const <Widget> [
                  TempDetail(
                      image:
                          'https://assets.pokemon.com/assets/cms2/img/pokedex/full/063.png',
                      number: '#0063',
                      name: 'Abra',
                      desc:
                          'This Pokémon uses its psychic powers while it sleeps. The contents of Abra’s dreams affect the powers that the Pokémon wields.'
                  ),
                  TempDetail(
                      image:
                          'https://assets.pokemon.com/assets/cms2/img/pokedex/full/064.png',
                      number: '#0064',
                      name: 'Kadabra',
                      desc:
                          'Using its psychic power, Kadabra levitates as it sleeps. It uses its springy tail as a pillow.'
                  ),
                  TempDetail(
                      image:
                          'https://assets.pokemon.com/assets/cms2/img/pokedex/full/065.png',
                      number: '#0065',
                      name: 'Alakazam',
                      desc:
                          'It has an incredibly high level of intelligence. Some say that Alakazam remembers everything that ever happens to it, from birth till death.'
                  ),
                  TempDetail(
                      image:
                          'https://assets.pokemon.com/assets/cms2/img/pokedex/full/065_f2.png',
                      number: '#0066',
                      name: 'Mega Alakazam',
                      desc:
                          "It's adept at precognition. When attacks completely miss Alakazam, that’s because it’s seeing the future."
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
