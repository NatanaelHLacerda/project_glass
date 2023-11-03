class BudgetModel {
  final String name;
  final String phone;
  final String id;

  BudgetModel({
    required this.name,
    required this.phone,
    required this.id,
  });

  factory BudgetModel.fromMap(dynamic map) {
    return BudgetModel(
      name: map['name'],
      phone: map['phone'],
      id: map['id'],
    );
  }
}

toMap(BudgetModel contactModel){
  return {
    'name': contactModel.name,
    'phone': contactModel.phone,
    'id': contactModel.id,
  };
}
