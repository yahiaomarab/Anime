abstract class api_States {}

class Intial_State extends api_States {}

class GettingRandomTitleDataSuccessState extends api_States {}

class GettingTenRandomTitleDataLoadingState extends api_States {}

class GettingRandomTitleDataErorrState extends api_States {
  final String erorr;
  GettingRandomTitleDataErorrState(this.erorr);
}

class GettingRandomNameDataSuccessState extends api_States {}

class GettingTenRandomNameDataSuccessState extends api_States {}

class GettingTenRandomTitleDataSuccessState extends api_States {}
