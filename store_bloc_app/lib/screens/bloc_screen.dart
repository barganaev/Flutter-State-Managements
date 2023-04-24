import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../store_bloc/store_bloc.dart';

class BlocScreen extends StatefulWidget {
  const BlocScreen({Key? key}) : super(key: key);

  @override
  State<BlocScreen> createState() => _BlocScreenState();
}

class _BlocScreenState extends State<BlocScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocBuilder<StoreBloc, StoreState>(
          builder: (context, state) {
            // BlocProvider.of<StoreBloc>(context, listen: false).add(StoreGetEvent());
            if (state is StoreLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is StoreLoadedState) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: state.storeModel?.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Container(
                        width: 40,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        child: Center(
                          child: Text(
                            '${index+1}', 
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          child: ListTile(
                            leading: Image.asset('assets/exp68.png', height: 40,),
                            title: Text('${state.storeModel?[index].title}'),
                            subtitle: Text('${state.storeModel?[index].description}'),
                            trailing: Text('${state.storeModel?[index].rating?.rate}⭐️'),
                          ),
                        ),
                      ),
                    ],
                  );
                }
              );;
            } else if (state is StoreErrorState) {
              return const Center(
                child: Text(
                  'Bloc in ErrorState'
                ),
              );
            } else {
              return const Center(child: Text('Error'),);
            }
          },
        )
      ),
    );
  }
}