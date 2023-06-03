import 'package:contactapp/data/models/contact_model.dart';
import 'package:flutter/material.dart';
import '../screens/details_screen.dart';

class ContactWidget extends StatefulWidget {
  final Contact contact;
  const ContactWidget({super.key , required this.contact});
  

  @override
  State<ContactWidget> createState() => _ContactWidgetState();

}

class _ContactWidgetState extends State<ContactWidget> {


  @override
  Widget build(BuildContext context) {
    return ListTile(
                    trailing: IconButton(
                      onPressed: () {
                        setState(() {
                          widget.contact.isFavorite =
                              !widget.contact.isFavorite;
                        });
                      },
                      icon: Icon(
                        widget.contact.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: widget.contact.isFavorite
                            ? Colors.redAccent
                            : Colors.white,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.contact.email),
                        Text(widget.contact.phone),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailsScreen(
                                    contact: widget.contact,
                                  )));
                    },
                    title: Text(widget.contact.name),
                    leading: CircleAvatar(
                      backgroundImage: Image(
                        image: AssetImage(widget.contact.image),
                      ).image,
                      backgroundColor: Colors.redAccent,
                    ),
                  );
  }
}