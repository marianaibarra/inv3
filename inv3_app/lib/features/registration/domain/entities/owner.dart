import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Owner extends Equatable {
  final String? user;
  final String? name;
  final String? lastName;
  final List<Businesses>? businesses;
  final String? password;
  final String? email;
  final String? phone;

  const Owner({
  @required this.user, 
  @required this.name, 
  @required this.lastName, 
  @required this.businesses,
  @required this.password, 
  @required this.email, 
  @required this.phone
  });

  @override
  List<Object?> get props => [user, name, lastName, businesses, password, email, phone];

}

class Businesses {}
