abstract class Failure{
  final String errorMessage;
  Failure(this.errorMessage);
}

class DatabaseFailure extends Failure{
  DatabaseFailure(super.errorMessage);
}

class ServerFailure extends Failure{
  ServerFailure(super.errorMessage);
}