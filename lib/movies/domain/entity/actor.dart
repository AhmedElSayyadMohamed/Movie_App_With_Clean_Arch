import 'package:equatable/equatable.dart';

class Actor extends Equatable {
  final String? photo;
  final String? name;

  const Actor({
    required this.photo,
    required this.name,
  });

  @override
  List<Object?> get props => [photo, name];
}
