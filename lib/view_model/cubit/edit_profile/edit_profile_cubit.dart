import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(EditProfileInitial());

  EditProfileCubit get(context) => BlocProvider.of(context);

  var key = GlobalKey<FormState>();
  TextEditingController newNameController = TextEditingController();
  TextEditingController newPhoneController = TextEditingController();
  TextEditingController newBrandNameController = TextEditingController();
  TextEditingController newMinimumChargeController = TextEditingController();
  TextEditingController newDescController = TextEditingController();
  TextEditingController newLocationController = TextEditingController();
}
