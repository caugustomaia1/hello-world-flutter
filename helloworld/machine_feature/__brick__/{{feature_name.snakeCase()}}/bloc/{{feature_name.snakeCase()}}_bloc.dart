import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part '{{feature_name.snakeCase()}}_event.dart';
part '{{feature_name.snakeCase()}}_state.dart';

class {{feature_name.pascalCase()}}Bloc
    extends Bloc<{{feature_name.pascalCase()}}Event, {{feature_name.pascalCase()}}State> {
  {{feature_name.pascalCase()}}Bloc() : super({{feature_name.pascalCase()}}Initial()) {
    // on<MeuEvento>(_onMeuEvento);
  }
}
