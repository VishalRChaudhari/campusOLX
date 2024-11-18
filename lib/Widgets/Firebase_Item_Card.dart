import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirebaseItemCard extends StatelessWidget {
  const FirebaseItemCard(
      {super.key,
      required this.height,
      required this.onTap,
      required this.width,
      required this.name,
      required this.price});

  final double height;
  final double width;
  final Function()? onTap;
  final int price;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.all(5),
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            border: Border.all(color: Colors.black26, style: BorderStyle.solid),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //image
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Colors.black54, width: 1.2)),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Image.network(
                    '',
                    width: double.infinity,
                    height: 120,
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //name
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                      //price

                      Text(
                        '₹ ${price.toString()}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      //add button
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.favorite_outline_sharp),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
