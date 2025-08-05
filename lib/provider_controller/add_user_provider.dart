import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Model/user_address_model.dart';

class AddUserProvider with ChangeNotifier{
  List<UserDetailsModel> listUserDetails = [];
  var keyForm=GlobalKey<FormState>();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var shreetController = TextEditingController();
  var villageNameController = TextEditingController();
  var pinCodeController = TextEditingController();
  var districtController = TextEditingController();
  var stateController = TextEditingController();

  clickBottonDetailsAdd(BuildContext context){
    if(keyForm.currentState!.validate()){
      var nameConvertText = nameController.text.toString();
      var phoneConvertText = phoneController.text.toString();
      var shreetConvertText = shreetController.text.toString();
      var villageConvertText = villageNameController.text.toString();
      var pinCodeConvertText = pinCodeController.text.toString();
      var districtConvertText = districtController.text.toString();
      var stateConvertText = stateController.text.toString();

      nameController.text="";
      phoneController.text="";
      shreetController.text="";
      villageNameController.text="";
      pinCodeController.text="";
      districtController.text="";
      stateController.text="";


      listUserDetails.add(UserDetailsModel(
          name: nameConvertText,
          phone: phoneConvertText,
          shreet: shreetConvertText,
          villageName: villageConvertText,
          pinCode: pinCodeConvertText,
          district: districtConvertText,
          state: stateConvertText));
      Navigator.pop(context);
      notifyListeners();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.blueGrey, content: Text("Add New Details Successfly")));

    }
  }
}