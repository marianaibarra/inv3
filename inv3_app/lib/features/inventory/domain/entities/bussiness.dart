import 'package:decimal/decimal.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../registration/domain/entities/owner.dart';

class Bussiness extends Equatable
// Equatable helps to value equality such as dart only supports referential equality
{
  final int? id;
  final String? name;
  final Owner? owner;
  final Decimal? finance;
  final bool? isCountBalance;

  const Bussiness
  ({
    @required this.id,
    @required this.name,
    @required this.owner,
              this.finance,
              this.isCountBalance,
  });

  @override
  List<Object?> get props => [id, name, owner, finance, isCountBalance];
}
