import 'package:books/Widgets/Firebase_Item_Card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

class FirebaseRetrive extends StatefulWidget {
  const FirebaseRetrive({super.key});

  @override
  State<FirebaseRetrive> createState() => _FirebaseRetriveState();
}

class _FirebaseRetriveState extends State<FirebaseRetrive> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 1,
        ),
        body: Container(
          margin: const EdgeInsets.all(8),
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('Items').snapshots(),
            builder: (context, itemsnapshot) {
              if (itemsnapshot.connectionState == ConnectionState.waiting) {
                return Container(
                  child: CircularProgressIndicator(),
                );
              } else {
                final itemDocs = itemsnapshot.data!.docs;
                return ListView.builder(
                  itemBuilder: (context, index) => FirebaseItemCard(
                      height: 90,
                      onTap: () {},
                      width: 90,
                      name: itemDocs[index]['title'],
                      price: 45),
                  itemCount: itemDocs.length,
                );
              }
            },
          ),
        ));
  }
}
