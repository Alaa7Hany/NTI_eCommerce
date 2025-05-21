import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_ecommerce/core/helper/responsive.dart';
import 'package:nti_ecommerce/core/utils/app_colors.dart';
import 'package:nti_ecommerce/core/utils/app_text_styles.dart';
import 'package:nti_ecommerce/core/widgets/my_appbar.dart';
import 'package:nti_ecommerce/core/widgets/svg_wrapper.dart';
import 'package:nti_ecommerce/features/my_orders/manager/my_orders_cubit/my_orders_cubit.dart';
import 'package:nti_ecommerce/features/my_orders/views/widgets/order_tile.dart';

import '../../../core/utils/app_assets.dart';
import '../manager/my_orders_cubit/my_orders_state.dart';
import 'widgets/empty_order_widget.dart';
import 'widgets/row_of_order_types.dart';

class MyOrdersView extends StatelessWidget {
  const MyOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyOrdersCubit()..loadOrders(),
      child: Builder(
        builder: (context) {
          var cubit = MyOrdersCubit.get(context);
          return Scaffold(
            appBar: MyAppBar.appBar(title: 'My Orders'),
            body: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: ResponsiveHelper.w(context, width: 15),
                  ),
                  child: BlocBuilder<MyOrdersCubit, MyOrdersState>(
                    builder: (context, state) {
                      return RowOfOrderTypes(cubit: cubit);
                    },
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: BlocBuilder<MyOrdersCubit, MyOrdersState>(
                      builder: (context, state) {
                        if (state is MyOrdersLoadingState) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primary,
                            ),
                          );
                        } else if (state is MyOrdersErrorState) {
                          return Center(
                            child: Text(
                              state.error,
                              style: AppTextStyles.f16w400(
                                context,
                                color: AppColors.primary,
                              ),
                            ),
                          );
                        } else {
                          return PageView.builder(
                            itemCount: MyOrdersViewType.values.length,
                            controller: cubit.pageController,
                            onPageChanged: (index) {
                              cubit.changeSelectedCategory(
                                MyOrdersViewType.values[index],
                              );
                            },
                            itemBuilder: (context, index) {
                              return cubit.currentOrders.isEmpty
                                  ? EmptyOrdersWidget()
                                  : ListView.builder(
                                    itemCount: cubit.currentOrders.length,
                                    itemBuilder: (context, index) {
                                      return OrderTile(
                                        orderModel: cubit.currentOrders[index],
                                        onCancelOrder: (orderId) {
                                          cubit.cancelOrder(orderId);
                                        },
                                        onTrackDriver: (orderId) {},
                                      );
                                    },
                                  );
                            },
                          );
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
