abstract class AppStates{

}

class intailstate extends AppStates{

}

class SelectedPlaceState extends AppStates{

}

class AppChangeTabsState extends AppStates{}

class SelectedAreaState extends AppStates{

}

class PlusNumberOfItemState extends AppStates{

}

class MinesNumberOfItemState extends AppStates{

}

class AppGetUserLoadingState extends AppStates {


}
class AppGetUserSuccessState extends AppStates {


}
class AppGetUserErrorState extends AppStates {
  final String error;

  AppGetUserErrorState(this.error);
}

class AppGetItemDetailLoadingState extends AppStates {


}
class AppGetItemDetailSuccessState extends AppStates {


}
class AppGetItemDetailErrorState extends AppStates {
  final String error;

  AppGetItemDetailErrorState(this.error);
}

class AppGetKosharyHamadaSuccessState extends AppStates{

}

class AppGetKosharyHamadaErrorState extends AppStates{

}

class AppGetAbuMariamFishSuccessState extends AppStates{

}


class AppGetAbuMariamFishErrorState extends AppStates{

}