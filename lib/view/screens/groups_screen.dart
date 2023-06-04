import 'package:contactapp/view/widgets/contact_widget.dart';
import 'package:flutter/material.dart';

import '../../data/models/contact_model.dart';

class GrouopScreen extends StatefulWidget {
  const GrouopScreen({super.key});

  @override
  State<GrouopScreen> createState() => _GrouopScreenState();
}

class _GrouopScreenState extends State<GrouopScreen> {

  List<Contact> contacts = [
    Contact(
        name: 'Lokman Touil',
        email: 'touillokman14@gmail.com',
        phone: '0123456789',
        address: '221B Baker street',
        image: 'assets/images/contact.jpg'),
    Contact(
        name: 'Jalil Kizma',
        email: 'KizmaHood55@gmail.com',
        phone: '0169456789',
        address: 'West Coast Highway',
        image: 'assets/images/hood.jpg'),
    Contact(
        name: 'Oussama Bin Laden',
        email: 'binladenUwU@gmail.com',
        phone: '01234346789',
        address: 'World Trade Center',
        image: 'assets/images/binladen.jpg'),
    Contact(
        name: 'Anis Dhia',
        email: 'anis.dhia@gmail.com',
        phone: '0123456789',
        address: '222B Baker street',
        image: 'assets/images/contacts.jpg'),
    Contact(
        name: 'CONTACT 1',
        email: 'CONTACTEMAIL@gmail.com',
        phone: '0123456789',
        address: '222B Baker street',
        image: 'assets/images/contacts.jpg'),
    Contact(
        name: 'CONTACT 2',
        email: 'CONTACT2@gmail.com',
        phone: '0123456789',
        address: '222B Baker street',
        image: 'assets/images/contacts.jpg'),
    Contact(
        name: 'CONTACT 3',
        email: 'contact3@gmail.com',
        phone: '0123456789',
        address: '222B Baker street',
        image: 'assets/images/contacts.jpg'),
    Contact(
        name: 'CONTACT 4',
        email: 'contact4@gmail.com',
        phone: '0123456789',
        address: '222B Baker street',
        image: 'assets/images/contacts.jpg'),
    Contact(
        name: 'CONTACT 5',
        email: 'contact5@gmail.com',
        phone: '0123456789',
        address: '222B Baker street',
        image: 'assets/images/contacts.jpg'),
    Contact(
        name: 'CONTACT 6',
        email: 'contact6@gmail.com',
        phone: '0123456789',
        address: '222B Baker street',
        image: 'assets/images/contacts.jpg'),
    Contact(
        name: 'CONTACT 7',
        email: 'contact7@gmail.com',
        phone: '0123456789',
        address: '222B Baker street',
        image: 'assets/images/contacts.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Administration", style: TextStyle(fontSize: 20),),
          const SizedBox(height: 10,),
          ListView(
            shrinkWrap: true,
            children: [
              ContactWidget(contact: contacts[0]),
              ContactWidget(contact: contacts[3]),
            ],
          ),
          const Text("Professor", style: TextStyle(fontSize: 20),),
          const SizedBox(height: 10,),
          ListView(
            shrinkWrap: true,
            children: [
              ContactWidget(contact: contacts[1]),
              ContactWidget(contact: contacts[5]),
              ContactWidget(contact: contacts[8]),
            ],
          ),
          const Text("Student", style: TextStyle(fontSize: 20),),
          const SizedBox(height: 10,),
          ListView(
            shrinkWrap: true,
            children: [
              ContactWidget(contact: contacts[4]),
              ContactWidget(contact: contacts[6]),
              ContactWidget(contact: contacts[7]),
            ],
          ),
        ],
      ),
    );
  }
}