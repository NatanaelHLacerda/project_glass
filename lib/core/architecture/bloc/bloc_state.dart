abstract class BlocState<T> {
  T? data;
  BlocState({required this.data});
}

class BlocStableState extends BlocState {
  BlocStableState({required super.data});
}

class BlocEmptyState extends BlocState {
  BlocEmptyState({required super.data});
}

class BlocLoadingState extends BlocState {
  BlocLoadingState({required super.data});
}

class BlocErrorState extends BlocState {
  BlocErrorState({required super.data});
}
