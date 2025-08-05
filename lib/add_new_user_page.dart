import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_test2/provider_controller/add_user_provider.dart';

class AddNewUserPage extends StatefulWidget {
  const AddNewUserPage({super.key});

  @override
  State<AddNewUserPage> createState() => _AddNewUserPageState();
}

class _AddNewUserPageState extends State<AddNewUserPage> {

  @override
  Widget build(BuildContext context) {
    var _addProvider=Provider.of<AddUserProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("Add New Details", style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0,left: 20,right: 20),
        child: Form(
            key: _addProvider.keyForm,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _addProvider.nameController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.person,
                          size: 25,
                        ),
                        isDense: true,
                        hintText: "Enter Name",
                        label: Text("Name"),
                        border: OutlineInputBorder()),
                    validator: (value) {
                      final nameFirstLaterUper=RegExp(r"^[A-Z][a-z]+$");
                      if (value!.isEmpty) {
                      return "please enter name";
                      }
                      else if(!nameFirstLaterUper.hasMatch(value)){
                        return "First Latter Must be UpperCase";
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    maxLength: 10,
                    controller: _addProvider.phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.phone,
                          size: 25,
                        ),
                        isDense: true,
                        hintText: "Enter Phone",
                        label: Text("Phone"),
                        border: OutlineInputBorder()),
                    validator: (value) {
                      final number=RegExp(r'^[6-9]\d{9}$');
                      if (value!.isEmpty) {
                        return "Please Fill Phone";
                      }
                      else if(!number.hasMatch(value)){
                        return "Enter a valid 10-digit";
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _addProvider.shreetController,
                    keyboardType: TextInputType.streetAddress,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.ac_unit,
                          size: 25,
                        ),
                        isDense: true,
                        hintText: "Enter Shreet",
                        label: Text("Shreet"),
                        border: OutlineInputBorder()),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Fill Shreet";
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _addProvider.villageNameController,
                    keyboardType: TextInputType.streetAddress,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.holiday_village,
                          size: 25,
                        ),
                        isDense: true,
                        hintText: "Enter Village Name",
                        label: Text("Village Name"),
                        border: OutlineInputBorder()),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Fill Village Name";
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    maxLength: 6,
                    controller: _addProvider.pinCodeController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.pin_outlined,
                          size: 25,
                        ),
                        isDense: true,
                        hintText: "Enter Pin code",
                        label: Text("Pin code"),
                        border: OutlineInputBorder()),
                    validator: (value) {
                      final pin=RegExp(r'^[1-9][0-9]{5}$');
                      if (value!.isEmpty) {
                        return "Please Fill Pin code";
                      }
                      else if(!pin.hasMatch(value)){
                        return "Enter a valid 6-Digit PIN code";
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _addProvider.districtController,
                    keyboardType: TextInputType.streetAddress,
                    decoration: InputDecoration(
                        isDense: true,
                        prefixIcon: Icon(
                          Icons.real_estate_agent_outlined,
                          size: 25,
                        ),
                        hintText: "Enter District",
                        label: Text("District"),
                        border: OutlineInputBorder()),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Fill District";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _addProvider.stateController,
                    keyboardType: TextInputType.streetAddress,
                    decoration: InputDecoration(
                        isDense: true,
                        prefixIcon: Icon(
                          Icons.account_balance_outlined,
                          size: 25,
                        ),
                        hintText: "Enter State",
                        label: Text("State"),
                        border: OutlineInputBorder()),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Fill State";
                      }
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 45,
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueGrey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5))),
                        onPressed: () {
                          _addProvider.clickBottonDetailsAdd(context);
                        },
                        child: Text(
                          "Add Now",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              )),
      ),
    );
  }
}
