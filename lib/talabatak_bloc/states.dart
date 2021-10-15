abstract class AppStates{

}

class intailstate extends AppStates{

}

class SelectedPlaceState extends AppStates{

}

class AppAddItemToUserOredersState extends AppStates {}

class AppRemoveItemFromUserOredersState extends AppStates {}
class AppGetTotalPriceState extends AppStates {}
class AppCreateDatabaseState extends AppStates {}
class AppInsertDatabaseState extends AppStates {}
class AppInsertDatabaseLoadingState extends AppStates {}
class AppGetDatabaseState extends AppStates {}
class AppDeleteDatabaseState extends AppStates {}





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

class AppGetPizzaBolaSuccessState extends AppStates{

}


class AppGetPizzaBolaErrorState extends AppStates{

}

class AppGetHatyeEltakiaSuccessState extends AppStates{

}


class AppGetHatyeEltakiaErrorState extends AppStates{

}

class AppGetMenusSuccessState extends AppStates{}
class AppGetMenusErrorState extends AppStates{}

class AppCreateInfoSuccessState extends AppStates{}
class AppCreateInfoErrorState extends AppStates{}

class AppGetInfoSuccessState extends AppStates{}
class AppGetInfoErrorState extends AppStates{}


class AppCreateOrderSuccessState extends AppStates{}
class AppCreateOrderErrorState extends AppStates{}

class AppGetOrderSuccessState extends AppStates{}
class AppGetOrderErrorState extends AppStates{}

class ClearDataState extends AppStates{}
