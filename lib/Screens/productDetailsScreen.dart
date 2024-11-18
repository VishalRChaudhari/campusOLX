import 'package:books/models/models/items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({
    super.key,
    required this.item,
  });

  final Items item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_outline_outlined)),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Image
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black54)),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Image.network(
                    item.url,
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Divider(
                  color: Colors.black,
                  thickness: 0.5,
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              //Item name
              Text(
                item.name,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 5,
              ),

              //price
              Text(
                '₹ ${item.price}',
                style:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Divider(
                  color: Colors.black,
                  thickness: 0.4,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Details',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                ),
              ),

              //brief Info
              //contition
              //brand               //date added

              //Description
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Divider(
                  color: Colors.black,
                  thickness: 0.4,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Description',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                ),
              ),

              const SizedBox(
                height: 20,
              ),
              //seller name                     //report option

              Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: Colors.black12, style: BorderStyle.solid),
                ),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 30,
                    ),
                    //image
                    const Icon(Icons.person_2_sharp),
                    const SizedBox(
                      width: 40,
                    ),
                    //name
                    const Text('User Name'),
                    const Spacer(),

                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_forward_ios),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),

              //AD id
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Divider(
                  color: Colors.black,
                  thickness: 0.4,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Text(
                    'AD id : ',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Report ad'),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),

              //buttons --> chat & add to favourites

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 360,
                    height: 60,
                    child: CupertinoButton(
                      onPressed: () {},
                      color: Colors.black,
                      child: const Icon(Icons.chat),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
