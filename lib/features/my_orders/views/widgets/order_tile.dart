import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_ecommerce/core/helper/nav_helper.dart';
import 'package:nti_ecommerce/core/helper/responsive.dart';
import 'package:nti_ecommerce/core/utils/app_colors.dart';
import 'package:nti_ecommerce/core/widgets/my_button.dart';
import 'package:nti_ecommerce/features/my_orders/data/models/oreders_response_model.dart';
import 'package:nti_ecommerce/features/my_orders/manager/my_orders_cubit/my_orders_cubit.dart';
import 'package:nti_ecommerce/features/my_orders/views/widgets/order_tile_button.dart';

import '../../../../core/utils/app_text_styles.dart';
import '../../manager/my_orders_cubit/my_orders_state.dart';
import '../order_details_view.dart';

class OrderTile extends StatelessWidget {
  const OrderTile({
    super.key,
    required this.orderModel,
    required this.onCancelOrder,
    required this.onTrackDriver,
  });
  final OrderModel orderModel;
  final void Function(int orderId) onCancelOrder;
  final void Function(int orderId) onTrackDriver;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: AppColors.white,

      child: Column(
        children: [
          ListTile(
            leading: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),

              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  orderModel.items![0].imagePath!,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),

            title: Text(
              '${orderModel.items![0].name}',
              style: AppTextStyles.f16w500(context, color: AppColors.black),
            ),
            subtitle: Text(
              orderModel.orderDate == null
                  ? 'NA'
                  : orderModel.orderDate!.split(' ').sublist(0, 4).join(' '),
              style: AppTextStyles.f10w400(context, color: AppColors.black),
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '\$ ${orderModel.total}',
                  style: AppTextStyles.f12w500(context, color: AppColors.black),
                ),
                Text(
                  '${orderModel.items!.length} item',
                  style: AppTextStyles.f10w400(context, color: AppColors.black),
                ),
              ],
            ),
            splashColor: Colors.transparent,

            onTap: () {
              NavHelper.push(() => OrderDetailsView(orderModel: orderModel));
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ResponsiveHelper.w(context, width: 20),
              vertical: ResponsiveHelper.h(context, height: 5),
            ),
            child: _buildTileFooter(context),
          ),
        ],
      ),
    );
  }

  Widget _buildTileFooter(BuildContext context) {
    if (orderModel.status == 0) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        spacing: ResponsiveHelper.w(context, width: 10),
        children: [
          Expanded(
            child: BlocBuilder<MyOrdersCubit, MyOrdersState>(
              builder: (context, state) {
                return OrderTileButton(
                  isLoading:
                      state is MyOrdersCancelLoadingState &&
                      state.orderId == orderModel.id,
                  title: 'Cancel',
                  onPressed: () {
                    onCancelOrder(orderModel.id!);
                  },
                );
              },
            ),
          ),
          Expanded(
            child: OrderTileButton(
              title: 'Track Driver',
              onPressed: () {
                onTrackDriver(orderModel.id!);
              },
            ),
          ),
        ],
      );
    } else if (orderModel.status == 1) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.check_circle_outline,
            color: AppColors.primary.withAlpha(150),
            size: ResponsiveHelper.w(context, width: 17),
          ),
          SizedBox(width: ResponsiveHelper.w(context, width: 5)),
          Text(
            'Order delivered',
            style: AppTextStyles.f14w300(context, color: AppColors.primary),
          ),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.cancel_outlined,
            color: AppColors.primary.withAlpha(150),
            size: ResponsiveHelper.w(context, width: 17),
          ),
          SizedBox(width: ResponsiveHelper.w(context, width: 5)),
          Text(
            'Order canceled',
            style: AppTextStyles.f14w300(context, color: AppColors.primary),
          ),
        ],
      );
    }
  }
}
