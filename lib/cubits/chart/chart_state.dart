part of 'chart_cubit.dart';

abstract class ChartState extends Equatable {
  const ChartState();

  @override
  List<Object> get props => [];
}

class ChartInitial extends ChartState {}

class ChartLoading extends ChartState {}

class ChartSuccess extends ChartState {
  const ChartSuccess(this.data);

  final DatasetDto data;

  @override
  List<Object> get props => [data];
}

class ChartError extends ChartState {
  const ChartError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}

class ChartNetworkError extends ChartState {
  const ChartNetworkError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
