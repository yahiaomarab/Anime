import 'package:anime/Data/data_resource/api_service.dart';
import 'package:anime/Data/repositories/quote_Repositories.dart';
import 'package:anime/View_Model/LayoutCubit/LayoutCubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Data/Model/QuoteModel.dart';
import 'api_States.dart';

class Api_Cubit extends Cubit<api_States> {
  Api_Cubit() : super(Intial_State());
  static Api_Cubit get(context) => BlocProvider.of(context);

  QuoteModel? quoteModel;
  final QuoteRepository quoteRepository = QuoteRepository(ApiService());
  List<QuoteModel> quotes = [];
  void _checkIncomingData() {
    if (quotes.isEmpty) {
      emit(GettingTenRandomTitleDataLoadingState());
    }
  }

  void getRequest(context) async {
    _checkIncomingData();
    try {
      if (LayoutCubit.get(context).CurrentIndex == 0) {
        _getListOfQuotes();
      } else if (LayoutCubit.get(context).CurrentIndex == 1) {
        _getOnlySpaceficQuote();
      }
    } catch (erorr) {
      emit(GettingRandomTitleDataErorrState(erorr.toString()));
    }
  }

  _getListOfQuotes() async {
    quotes = await quoteRepository.getTenRandomQuote() as List<QuoteModel>;
    emit(GettingTenRandomTitleDataSuccessState());
  }

  _getOnlySpaceficQuote() async {
    quoteModel = await quoteRepository.getRandomQuoteByTitle(title: 'naruto');
    emit(GettingRandomTitleDataSuccessState());
  }
}
