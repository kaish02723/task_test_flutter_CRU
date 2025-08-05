import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_test2/provider_controller/add_user_provider.dart';
import '../home_page.dart';

class EditDetailProvider with ChangeNotifier {
  int ind = -1;

  var keyForm = GlobalKey<FormState>();
  var nameUpdateController = TextEditingController();
  var phoneUpdateController = TextEditingController();
  var shreetUpdateController = TextEditingController();
  var villageNameUpdateController = TextEditingController();
  var pinCodeUpdateController = TextEditingController();
  var districtUpdateController = TextEditingController();
  var stateUpdateController = TextEditingController();

  clickBottonUpdateDetailsAdd(BuildContext context) {
    var p = Provider.of<AddUserProvider>(context, listen: false);

    if (keyForm.currentState!.validate()) {
      var nameConvertText = nameUpdateController.text.toString();
      var phoneConvertText = phoneUpdateController.text.toString();
      var shreetConvertText = shreetUpdateController.text.toString();
      var villageConvertText = villageNameUpdateController.text.toString();
      var pinCodeConvertText = pinCodeUpdateController.text.toString();
      var districtConvertText = districtUpdateController.text.toString();
      var stateConvertText = stateUpdateController.text.toString();

      p.listUserDetails[ind].name = nameConvertText;
      p.listUserDetails[ind].phone = phoneConvertText;
      p.listUserDetails[ind].shreet = shreetConvertText;
      p.listUserDetails[ind].villageName = villageConvertText;
      p.listUserDetails[ind].pinCode = pinCodeConvertText;
      p.listUserDetails[ind].district = districtConvertText;
      p.listUserDetails[ind].state = stateConvertText;

      notifyListeners();

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),(route) => false,
      );
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.blueGrey, content: Text("Update User Details Successfly")));

    }
  }
}
