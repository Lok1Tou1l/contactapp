import 'package:contactapp/model/contact_model.dart';
import 'package:contactapp/view/screens/details_screen.dart';
import 'package:contactapp/view/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  List<Contact> contacts = [
    Contact(
        name: 'Lokman Hakim Bin Mohd Nor',
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
        name: 'Hakim Bin Laden',
        email: 'binladenUwU@gmail.com',
        phone: '01234346789',
        address: 'World Trade Center',
        image: 'assets/images/binladen.jpg'),
    Contact(
        name: 'Anis Syafiqah Binti Mohd Nor',
        email: 'anis.dhia@gmail.com',
        phone: '0123456789',
        address: '222B Baker street',
        image: 'assets/images/contacts.jpg'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          SearchWidget(text: 'Search', hintText: 'Search'),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(contacts[index].phone),
                        Text(contacts[index].email),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailsScreen(
                                    contact: contacts[index],
                                  )));
                    },
                    title: Text('${contacts[index].name}'),
                    leading: CircleAvatar(
                      backgroundImage: Image(
                        image: AssetImage(contacts[index].image),
                      ).image,
                      backgroundColor: Colors.redAccent,
                    ),
                  );
                }),
          )
        ]),
      ),
    );
  }
}
