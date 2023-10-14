import 'package:dartz/dartz.dart';
import 'package:sunflower/core/error/failure.dart';

abstract class UseCase<In, Out> {
  Future<Either<Failure, Out>> call(In input);
}
