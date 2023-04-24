part of 'store_bloc.dart';

@immutable
abstract class StoreState {}

class StoreInitialState extends StoreState {}

class StoreLoadingState extends StoreState {}

class StoreLoadedState extends StoreState {
  List<StoreModel>? storeModel;
  StoreLoadedState({required this.storeModel});
}

class StoreErrorState extends StoreState {}