import 'package:corona_app/Korona/Bloc/CoronaEvent.dart';
import 'package:corona_app/Korona/Bloc/CoronaState.dart';
import 'package:corona_app/Korona/Model/Corona.dart';
import 'package:corona_app/Korona/Repository/Repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoronaBloc extends Bloc<CoronaEvent, CoronaState> {
  @override
  // TODO: implement initialState
  CoronaState get initialState => CoronaInitial();

  @override
  Stream<CoronaState> mapEventToState(CoronaEvent event) async* {
    //  yield CoronaLoading();

    if (event is GetCoronaData) {
      Future<List<Corona>> loadData = LoadRepository().loadAllData(event.url);

      if (loadData == null) {
        yield CoronaLoading();
      } else {
        yield CoronaLoaded(loadData);
      }
    }
  }
}
