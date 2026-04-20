part of 'pagamento_bloc.dart';

sealed class PagamentoState extends Equatable {
  const PagamentoState();

  @override
  List<Object> get props => [];
}

final class PagamentoInitial extends PagamentoState {}
