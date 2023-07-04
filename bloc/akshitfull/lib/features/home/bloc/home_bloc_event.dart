part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeProductWishListButtonClickedEvent extends HomeEvent {}

class HomeProductCartButtonClickedEvent extends HomeEvent {}

class HomeProductWishListButtonNavigateEvent extends HomeEvent {}

class HomeProductWishCartButtonNavigateEvent extends HomeEvent {}
