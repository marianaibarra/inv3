import 'package:decimal/decimal.dart';
import 'package:equatable/equatable.dart';
import 'package:inv3_app/features/inventory/domain/entities/client.dart';
import 'package:inv3_app/features/inventory/domain/entities/product.dart';
import 'package:meta/meta.dart';

class Sale extends Equatable
// Equatable helps to value equality such as dart only supports referential equality
{
  final int? id;
  final DateTime? date;
  final String? payMethod;
  final Client? client;
  final Decimal? income;
  final Product? product;

  const Sale({
  @required this.id, 
  @required this.date, 
  @required this.payMethod, 
            this.client, 
  @required this.income, 
            this.product
  });

  @override
  List<Object?> get props => [id, date, payMethod, client, income, product];
}
