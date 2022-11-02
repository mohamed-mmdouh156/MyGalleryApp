abstract class LoginState{}

class InitialState extends LoginState{}

class UserLoginLoadingState extends LoginState{}
class UserLoginSuccessState extends LoginState{}
class UserLoginErrorState extends LoginState{}
