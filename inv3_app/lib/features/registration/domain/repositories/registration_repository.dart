import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/owner.dart';

abstract class RegistrationRepository {

  Future<Either<Failure, Owner>> signIn (List<String> credentials);
  Future<Either<Failure, Owner>> signUp (List<String> credentials);
  
}
