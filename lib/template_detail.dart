import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TempDetail extends StatelessWidget {
  const TempDetail({
    super.key,
    required this.image,
    required this.number,
    required this.name,
    required this.desc,
  });

  final String image;
  final String number;
  final String name;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20),
          padding: const EdgeInsets.only(left: 20, right: 5),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 7,
                spreadRadius: 5,
                offset: const Offset(0, 3),
              )
            ],
          ),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 20),
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color.fromARGB(255, 242, 242, 242),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(image),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(left: 10),
                child: Column(children: [
                  SizedBox(
                    width: 250,
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(right: 5),
                          child: Text(
                            number,
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ),
                        Container(
                          child: Text(
                            name,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(3),
                    width: 250,
                    height: 18,
                    child: Row(
                      children: [
                        Container(
                          width: 60,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(5),
                              color: Color.fromARGB(255, 255, 107, 184)),
                          padding: const EdgeInsets.only(left: 5),
                          child: const Text(
                            'Psychic',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(0),
                    width: 250,
                    child: Text(
                      desc,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 15
                        ),
                    ),
                  )
                ]),
              )
            ],
          ),
        ),
      ],
    );
  }
}
