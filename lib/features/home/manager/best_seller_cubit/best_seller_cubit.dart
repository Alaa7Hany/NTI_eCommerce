import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_ecommerce/features/home/manager/best_seller_cubit/best_seller_state.dart';

import '../../data/repo/best_seller_repo.dart';

class BestSellerCubit extends Cubit<BestSellerState> {
  BestSellerCubit() : super(BestSellerInitialState());

  static BestSellerCubit get(context) => BlocProvider.of(context);

  void getBestSellers() async {
    emit(BestSellerLoadingState());
    var result = await BestSellerRepo().getBestSellers();
    result.fold(
      (error) {
        emit(BestSellerErrorState(error));
      },
      (bestSellers) {
        emit(BestSellerLoadedState(bestSellers));
      },
    );
  }
}
