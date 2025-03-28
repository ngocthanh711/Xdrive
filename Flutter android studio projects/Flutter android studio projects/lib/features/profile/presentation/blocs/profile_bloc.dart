// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:dio/dio.dart';
// import '../../data/models/profile_model.dart';
// import 'profile_event.dart';
// import 'profile_state.dart';
//
// class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
//   final Dio _dio = Dio();
//
//   ProfileBloc() : super(ProfileInitial()) {
//     on<LoadProfile>(_onLoadProfile);
//   }
//
//   Future<void> _onLoadProfile(LoadProfile event, Emitter<ProfileState> emit) async {
//     emit(ProfileLoading());
//     try {
//       final response = await _dio.get('https://dummyjson.com/users/1');
//       final user = UserModel.fromJson(response.data);
//       emit(ProfileLoaded(user));
//     } catch (e) {
//       emit(ProfileError("Failed to load profile"));
//     }
//   }
// }
