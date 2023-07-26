
part of 'store_bloc.dart';


enum StoreRequest {
  unknown,
  requestInProgress,
  requestSuccess,
  requestFailure,
}

class StoreState {
  const StoreState({
    this.products = const <Product>[],
    this.productsStatus = StoreRequest.unknown,
    this.cartIds = const <int>{},
  });
  final List<Product> products;
  final StoreRequest productsStatus;
  final Set<int> cartIds;

  StoreState copyWith({
    List<Product>? products,
    StoreRequest? productsStatus,
    Set<int>? cartIds,
  }) {
    print('StoreState copyWith runned');
    return StoreState(
      products: products ?? this.products,
      productsStatus: productsStatus ?? this.productsStatus,
      cartIds: cartIds ?? this.cartIds,
    );
  }
}
