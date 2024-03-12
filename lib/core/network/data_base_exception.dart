class LocalErrorException implements Exception{
  final String errorMessage;
  LocalErrorException({required this.errorMessage});
}