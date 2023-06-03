abstract class AppStates {}

class AppInitialState extends AppStates {}

class HomeChangeBottomNavBarState extends AppStates {}

class GetPostsDataSuccess extends AppStates {}

class GetPostsDataLoading extends AppStates {}

class GetPostsDataError extends AppStates {
  final String error;

  GetPostsDataError(this.error);
}

class GetProfileDataSuccess extends AppStates {}

class GetProfileDataLoading extends AppStates {}

class GetProfileDataError extends AppStates {
  final String error;

  GetProfileDataError(this.error);
}
