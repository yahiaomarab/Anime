import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:anime/Layout/cubit/LayoutCubit.dart';
import '../../Data/Data_resources/ApiHelper.dart';
import '../../Data/Model/Model.dart';
import '../../Data/repo/repo.dart';
import 'States.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(Intial_State());
  static AppCubit get(context) => BlocProvider.of(context);

  QuoteModel? quoteModel;
  final QuoteRepository quoteRepository = QuoteRepository(ApiService());
  List<QuoteModel> quotes = [];

  void getRequest(context) async {
    if (LayoutCubit.get(context).CurrentIndex == 0) {
      quotes = await quoteRepository.getTenRandomQuote();
      emit(GettingTenRandomTitleDataSuccessState());
    } else if (LayoutCubit.get(context).CurrentIndex == 1) {
      quoteModel = await quoteRepository.getRandomQuoteByTitle(title: 'naruto');
      emit(GettingRandomTitleDataSuccessState());
    }
  }
}
