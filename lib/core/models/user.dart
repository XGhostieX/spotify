class User {
  final String? id;
  final String? name;
  final String? email;

  User({this.id, this.name, this.email});

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'] as String?,
    name: json['name'] as String?,
    email: json['email'] as String?,
  );

  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'email': email};
}
