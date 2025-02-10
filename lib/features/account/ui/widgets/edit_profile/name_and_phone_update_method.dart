import 'package:hero_store_app/features/account/logic/cubits/profile_info_cubit.dart';
import 'package:toast/toast.dart';

Future<void> updateNameAndPhoneMethod(
  ProfileInfoCubit profileCubit,
) async {
  var phone = profileCubit.newPhone.text;
  var name = profileCubit.newName.text;

  if (name.isNotEmpty && phone.isNotEmpty) {
    await profileCubit.updateName();
    await profileCubit.updatePhone();

    Toast.show(
      'Update name and phone successfully ✅',
      gravity: Toast.bottom,
      duration: Toast.lengthLong,
    );
  } else if (name.isNotEmpty && phone.isEmpty) {
    await profileCubit.updateName();
    Toast.show(
      'Update name successfully ✅',
      gravity: Toast.bottom,
      duration: Toast.lengthLong,
    );
  } else if (name.isEmpty && phone.isNotEmpty) {
    await profileCubit.updatePhone();
    Toast.show(
      'Update phone successfully ✅',
      gravity: Toast.bottom,
      duration: Toast.lengthLong,
    );
  } else if (name.isNotEmpty && phone.isNotEmpty) {
    await profileCubit.updateName();
    await profileCubit.updatePhone();
    Toast.show(
      'Update name and phone successfully ✅',
      gravity: Toast.bottom,
      duration: Toast.lengthLong,
    );
  } else {
    Toast.show(
      'Please fill in the required fields ❌  ',
      gravity: Toast.bottom,
      duration: Toast.lengthLong,
    );
  }
}
