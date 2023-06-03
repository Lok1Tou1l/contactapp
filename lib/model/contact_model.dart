class Contact {
  final String name;
  final String email;
  final String phone;
  final String address;
  final String image;
  bool isFavorite = false;

  Contact(
      {required this.email,
      required this.phone,
      required this.address,
      required this.name,
      required this.image});
}
