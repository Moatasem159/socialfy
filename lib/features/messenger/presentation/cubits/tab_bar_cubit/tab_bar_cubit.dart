import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialfy/features/messenger/presentation/cubits/tab_bar_cubit/tab_bar_state.dart';

class TabBarCubit extends Cubit<TabBarStates> {
  TabBarCubit() : super(TabBarInitialState());
  static TabBarCubit get(context)=>BlocProvider.of(context);
  int index=1;
  change(index){

    this.index=index;
    emit(ChangeSuccessState());
  }
}
