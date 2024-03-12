import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String? errorMessage;
  final String? code;

  const Failure({this.errorMessage, this.code});

  const Failure.generic({this.errorMessage ="An error has occurred", this.code});
  const Failure.network({this.errorMessage ="No internet, try connecting to a network", this.code});

  @override
  List<Object?> get props => [errorMessage, code];
}
