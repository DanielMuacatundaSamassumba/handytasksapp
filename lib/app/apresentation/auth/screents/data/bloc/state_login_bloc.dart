class StateLoginBloc {
   final bool? success;
   final bool? failed;
   final String? message;
    final bool?   loading;
   const StateLoginBloc({  this.failed=false,  this.success=false,   this.message="", this.loading});
}