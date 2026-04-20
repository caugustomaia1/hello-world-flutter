part of '{{feature_name.snakeCase()}}_bloc.dart';

sealed class {{feature_name.pascalCase()}}State extends Equatable {
  const {{feature_name.pascalCase()}}State();

  @override
  List<Object> get props => [];
}

final class {{feature_name.pascalCase()}}Initial extends {{feature_name.pascalCase()}}State {}
