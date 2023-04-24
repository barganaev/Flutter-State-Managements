part of 'store_bloc.dart';

@immutable
abstract class StoreEvent {}

class StoreGetEvent extends StoreEvent {
  StoreGetEvent();
}