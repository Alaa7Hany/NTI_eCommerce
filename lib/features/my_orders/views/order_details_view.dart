import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_ecommerce/core/helper/my_snackbar.dart';
import 'package:nti_ecommerce/core/helper/nav_helper.dart';
import 'package:nti_ecommerce/core/helper/responsive.dart';
import 'package:nti_ecommerce/core/utils/app_text_styles.dart';
import 'package:nti_ecommerce/core/widgets/my_appbar.dart';
import 'package:nti_ecommerce/features/my_orders/manager/my_orders_cubit/my_orders_cubit.dart';
import 'package:nti_ecommerce/features/my_orders/views/widgets/order_tile_button.dart';

import '../../../core/utils/app_colors.dart';
import '../data/models/oreders_response_model.dart';
import '../manager/my_orders_cubit/my_orders_state.dart';
import 'widgets/order_details_tile.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({super.key, required this.orderModel});
  final OrderModel orderModel;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyOrdersCubit(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: MyAppBar.appBar(title: 'Order Details'),
            body: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ResponsiveHelper.w(context, width: 20),
              ),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Order No. ${orderModel.id}',
                            style: AppTextStyles.f20w500(
                              context,
                              color: AppColors.black,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            getStatusText(),
                            style: AppTextStyles.f20w500(
                              context,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Text(
                        orderModel.orderDate!
                            .split(':')
                            .sublist(0, 2)
                            .join(':'),
                        style: AppTextStyles.f14w300(
                          context,
                          color: AppColors.black,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  SizedBox(height: ResponsiveHelper.h(context, height: 10)),
                  Expanded(
                    child: ListView.builder(
                      itemCount: orderModel.items!.length,
                      itemBuilder: (context, index) {
                        return OrderDetailsTile(
                          orderItemModel: orderModel.items![index],
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  Column(
                    children: [
                      _buildRow(
                        context,
                        left: 'Subtotal',
                        right: orderModel.subtotal.toString(),
                      ),
                      _buildRow(
                        context,
                        right: orderModel.tax.toString(),
                        left: 'Tax',
                      ),
                      _buildRow(
                        context,
                        right: orderModel.shipping.toString(),
                        left: 'Shipping',
                      ),
                      Divider(color: AppColors.lightLightGrey, thickness: 1),
                      _buildRow(
                        context,
                        right: orderModel.total.toString(),
                        left: 'Order Total',
                        rightColor: AppColors.primary,
                      ),
                      SizedBox(height: ResponsiveHelper.h(context, height: 10)),
                      orderModel.status == 0
                          ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            spacing: ResponsiveHelper.w(context, width: 10),
                            children: [
                              Expanded(
                                child: BlocConsumer<
                                  MyOrdersCubit,
                                  MyOrdersState
                                >(
                                  listener: (context, state) {
                                    if (state is MyOrdersCancelLoadedState) {
                                      MySnackbar.success(
                                        context,
                                        state.message,
                                      );
                                    } else if (state
                                        is MyOrdersCancelErrorState) {
                                      MySnackbar.error(context, state.error);
                                    } else if (state is MyOrdersLoadedState) {
                                      NavHelper.pop();
                                    }
                                  },
                                  builder: (context, state) {
                                    return OrderTileButton(
                                      title: 'Cancel',
                                      isLoading:
                                          state is MyOrdersCancelLoadingState &&
                                          state.orderId == orderModel.id,
                                      onPressed: () {
                                        MyOrdersCubit.get(
                                          context,
                                        ).cancelOrder(orderModel.id!);
                                      },
                                    );
                                  },
                                ),
                              ),

                              Expanded(
                                child: OrderTileButton(
                                  title: 'Track Driver',
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          )
                          : SizedBox(),
                      SizedBox(height: ResponsiveHelper.h(context, height: 15)),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildRow(
    BuildContext context, {
    required String right,
    required String left,
    rightColor = AppColors.black,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(left, style: AppTextStyles.f16w400(context)),
        Text(right, style: AppTextStyles.f16w600(context, color: rightColor)),
      ],
    );
  }

  String getStatusText() {
    switch (orderModel.status) {
      case 0:
        return 'Active';
      case 1:
        return 'Completed';
      case 2:
        return 'Canceled';
      default:
        return 'Unknown';
    }
  }
}
