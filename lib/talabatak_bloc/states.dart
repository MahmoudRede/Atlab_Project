abstract class AppStates{

}

class intailstate extends AppStates{

}

class SelectedPlaceState extends AppStates{

}

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