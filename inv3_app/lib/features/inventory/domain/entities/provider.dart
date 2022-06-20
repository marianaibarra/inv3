import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
///
///
///
class Provider extends Equatable
// Equatable helps to value equality such as dart only supports referential equality
{
  final int? id;
  final String? name;
  final String? address;
  final String? phone;

  const Provider({
  @required this.id, 
  @required this.name, 
  @required this.address, 
            this.phone, 
  });

  @override
  List<Object?> get props => [id, name, address, phone];
}
