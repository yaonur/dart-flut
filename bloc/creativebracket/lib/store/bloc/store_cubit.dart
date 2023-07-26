import 'package:creativebracket/store/store.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoreCubit extends Cubit<StoreState>{
  StoreCubit() : super(const StoreState());
  final StoreRepository api=StoreRepository();

  void getProducts() async {
        try {
      emit(
        state.copyWith(productsStatus: StoreRequest.requestInProgress),
      );
      final response = await api.getProducts();
      emit(
        state.copyWith(
          products: response,
          productsStatus: StoreRequest.requestSuccess,
        ),
      );
    } catch (e) {
      emit(state.copyWith(
        productsStatus: StoreRequest.requestFailure,
      ));
      
    }

  }

  void addToCart(int productId) {
  }

  void removeFromCart(int productId) {
  }
}