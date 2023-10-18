class ContactModel {
  final String name;
  final String phone;
  final String id;

  ContactModel({
    required this.name,
    required this.phone,
    required this.id,
  });

  factory ContactModel.fromMap(dynamic map) {
    return ContactModel(
      name: map['name'],
      phone: map['phone'],
      id: map['id'],
    );
  }
}

toMap(ContactModel contactModel){
  return {
    'name': contactModel.name,
    'phone': contactModel.phone,
    'id': contactModel.id,
  };
}
