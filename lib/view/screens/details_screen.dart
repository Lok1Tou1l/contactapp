import 'package:flutter/material.dart';
import '../../data/models/contact_model.dart';

class DetailsScreen extends StatefulWidget {
  final Contact contact;
  const DetailsScreen({required this.contact, super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.edit))],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                    width: double.infinity,
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage(widget.contact.image),
                    backgroundColor: Colors.blue,
                    radius: 50,
                  ),
                  const SizedBox(height: 20),
                  Text(widget.contact.name, style: const TextStyle(fontSize: 30)),
                  const SizedBox(height: 20),
                  Text(widget.contact.phone,
                      style:
                          TextStyle(fontSize: 18, color: Colors.grey.shade400)),
                  const SizedBox(height: 10),
                  Text(widget.contact.email,
                      style: const TextStyle(fontSize: 14, color: Colors.grey)),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        highlightColor: Colors.green,
                        onPressed: () {},
                        icon: const Icon(Icons.call_rounded),
                        color: Colors.green,
                      ),
                      IconButton(
                        highlightColor: Colors.blue,
                        onPressed: () {},
                        icon: const Icon(Icons.message_rounded),
                        color: Colors.blue,
                      ),
                      IconButton(
                        highlightColor: Colors.redAccent,
                        onPressed: () {},
                        icon: const Icon(Icons.video_call),
                        color: Colors.redAccent,
                      ),
                    ],
                  ),
                  const SizedBox(height: 35),
                  const Align(
                      alignment: Alignment.center,
                      child: Text('Notes',
                          style: TextStyle(fontFamily: 'Arial', fontSize: 20))),
                  const SizedBox(height: 10),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: const Padding(
                      padding: EdgeInsets.all(64.0),
                      child: Text('Notes', style: TextStyle(fontSize: 20)),
                    ),
                  ),
                ]),
          ),
        ));
  }
}
