import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class Failure extends Equatable  {

 final String ?message;

  const Failure({required this.message});
  @override
  List<Object> get props => [message!];
}

// General failures
class ServerFailure extends Failure {
  const ServerFailure({required super.message});
  @override
  List<Object> get props => [message!];
}
//
// class CacheFailure extends Failure {}


class FireBaseFailures extends FirebaseAuthException{
  FireBaseFailures({required super.code,required super.message});

}


class RegisterFailures extends Failure{
  const RegisterFailures({required super.message});
  @override
  List<Object> get props => [message!];

}

class FireBaseNetworkFailure extends FireBaseFailures{
  FireBaseNetworkFailure({required super.code,required super.message});

}

class LoginFailures extends Failure{
  const LoginFailures({required super.message});
  @override
  List<Object> get props => [message!];
}
class CreatePostFailures extends Failure{
  const CreatePostFailures({required super.message});
  @override
  List<Object> get props => [message!];
}
class DeletePostFailures extends Failure{
  const DeletePostFailures({required super.message});
  @override
  List<Object> get props => [message!];
}
class CreateCommentFailures extends Failure{
  const CreateCommentFailures({required super.message});
  @override
  List<Object> get props => [message!];
}
class DeleteCommentFailures extends Failure{
  const DeleteCommentFailures({required super.message});
  @override
  List<Object> get props => [message!];
}
class GetProfileFailures extends Failure{
  const GetProfileFailures({required super.message});
  @override
  List<Object> get props => [message!];
}
class GetNewsFeedFailures extends Failure{
  const GetNewsFeedFailures({required super.message});
  @override
  List<Object> get props => [message!];
}
class GetPostCommentFailures extends Failure{
  const GetPostCommentFailures({required super.message});
  @override
  List<Object> get props => [message!];
}
class AddLikeFailures extends Failure{
  const AddLikeFailures({required super.message});
  @override
  List<Object> get props => [message!];
}
class DisLikeFailures extends Failure{
  const DisLikeFailures({required super.message});
  @override
  List<Object> get props => [message!];
}

class AddLikeToCommentFailures extends Failure{
  const AddLikeToCommentFailures({required super.message});
  @override
  List<Object> get props => [message!];
}
class DisCommentLikeFailures extends Failure{
  const DisCommentLikeFailures({required super.message});
  @override
  List<Object> get props => [message!];
}


