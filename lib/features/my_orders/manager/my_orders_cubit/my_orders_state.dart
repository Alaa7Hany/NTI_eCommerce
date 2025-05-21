import '../../data/models/oreders_response_model.dart';

abstract class MyOrdersState {}

class MyOrdersInitialState extends MyOrdersState {}

class MyOrdersLoadingState extends MyOrdersState {}

class MyOrdersLoadedState extends MyOrdersState {
  Orders orders;
  MyOrdersLoadedState({required this.orders});
}

class MyOrdersErrorState extends MyOrdersState {
  String error;
  MyOrdersErrorState({required this.error});
}

class MyOrdersPageChanged extends MyOrdersState {}

class MyOrdersCancelLoadingState extends MyOrdersState {
  int orderId;
  MyOrdersCancelLoadingState(this.orderId);
}

class MyOrdersCancelLoadedState extends MyOrdersState {
  String message;
  MyOrdersCancelLoadedState({required this.message});
}

class MyOrdersCancelErrorState extends MyOrdersState {
  String error;
  MyOrdersCancelErrorState({required this.error});
}
