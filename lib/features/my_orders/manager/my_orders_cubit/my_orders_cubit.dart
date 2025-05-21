import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_ecommerce/core/helper/my_logger.dart';
import 'package:nti_ecommerce/core/helper/nav_helper.dart';
import 'package:nti_ecommerce/features/my_orders/data/repo/my_orders_repo.dart';

import '../../data/models/oreders_response_model.dart';
import 'my_orders_state.dart';

enum MyOrdersViewType { active, completed, cancelled }

class MyOrdersCubit extends Cubit<MyOrdersState> {
  MyOrdersCubit() : super(MyOrdersInitialState());
  static MyOrdersCubit get(context) => BlocProvider.of(context);
  MyOrdersViewType orderType = MyOrdersViewType.active;
  PageController pageController = PageController();
  // int currentPage = 0;
  List<OrderModel> active = [];
  List<OrderModel> completed = [];
  List<OrderModel> cancelled = [];

  List<OrderModel> get currentOrders {
    switch (orderType) {
      case MyOrdersViewType.active:
        return active;
      case MyOrdersViewType.completed:
        return completed;
      case MyOrdersViewType.cancelled:
        return cancelled;
    }
  }

  void changeSelectedCategory(MyOrdersViewType type) {
    orderType = type;
    emit(MyOrdersPageChanged());
  }

  void loadOrders() async {
    emit(MyOrdersLoadingState());
    var result = await MyOrdersRepo().getOrders();
    result.fold(
      (error) {
        emit(MyOrdersErrorState(error: error));
      },
      (orders) {
        active = orders.active!;
        completed = orders.completed!;
        cancelled = orders.canceled!;
        emit(MyOrdersLoadedState(orders: orders));
      },
    );
  }

  void cancelOrder(int orderId) async {
    emit(MyOrdersCancelLoadingState(orderId));
    var result = await MyOrdersRepo().cancelOrder(orderId);
    result.fold(
      (error) {
        emit(MyOrdersCancelErrorState(error: error));
      },
      (message) {
        loadOrders();
        emit(MyOrdersCancelLoadedState(message: message));
      },
    );
  }
}
