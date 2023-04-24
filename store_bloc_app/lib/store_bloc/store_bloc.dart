import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:store_bloc_app/api_request/api_req.dart';
import 'package:store_bloc_app/models/store_model.dart';

part 'store_event.dart';
part 'store_state.dart';

class StoreBloc extends Bloc<StoreEvent, StoreState> {
  StoreBloc() : super(StoreInitialState()) {
    on<StoreGetEvent>((event, emit) async {
      emit(StoreLoadingState());
      print('Hello bloc');
      List<StoreModel>? _storeModel = await ApiProvider().requestPost(RequestNames.store_products);
      // print('Bye bye bloc');
      print(_storeModel.toString());
      emit(StoreLoadedState(storeModel: _storeModel));
    });
  }

  // @override
  // Stream<StoreState> mapEventToState(StoreEvent event) async* {
  //   if (event is StoreGetEvent) {
  //     yield StoreLoadingState();
  //     try {
  //       List<StoreModel> _storeModel = await ApiProvider().requestPost(RequestNames.store_products);
        
  //       yield StoreLoadedState(storeModel: _storeModel);
  //     } catch (e) {
  //       yield StoreErrorState();
  //     }
  //   }
  // }
}