import 'package:corona_app/Korona/Model/Corona.dart';
import 'package:equatable/equatable.dart';

abstract class CoronaEvent extends Equatable {
  const CoronaEvent();
}

class GetCoronaData extends CoronaEvent {
  String url;

  GetCoronaData(this.url);

  @override
  // TODO: implement props
  List<Object> get props => [url];
}
