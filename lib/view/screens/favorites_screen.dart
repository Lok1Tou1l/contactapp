import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../data/models/contact_model.dart';
import '../widgets/contact_widget.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<Contact> contacts = [
    Contact(
        name: 'Lokman Touil',
        email: 'touillokman14@gmail.com',
        phone: '0123456789',
        address: '221B Baker street',
        image: 'assets/images/contact.jpg',
        isFavorite: true),
    Contact(
        name: 'Jalil Kizma',
        email: 'KizmaHood55@gmail.com',
        phone: '0169456789',
        address: 'West Coast Highway',
        image: 'assets/images/hood.jpg',
        isFavorite: true),
    Contact(
        name: 'Oussama Bin Laden',
        email: 'binladenUwU@gmail.com',
        phone: '01234346789',
        address: 'World Trade Center',
        image: 'assets/images/binladen.jpg',
        isFavorite: true),
    Contact(
        name: 'Anis Dhia',
        email: 'anis.dhia@gmail.com',
        phone: '0123456789',
        address: '222B Baker street',
        image: 'assets/images/contacts.jpg',
        isFavorite: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  return ContactWidget(contact: contacts[index]);
                }),
          )
        ],
      ),
    );
  }
}