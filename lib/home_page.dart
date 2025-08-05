import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_test2/Model/user_address_model.dart';
import 'package:task_test2/add_new_user_page.dart';
import 'package:task_test2/provider_controller/add_user_provider.dart';
import 'package:task_test2/provider_controller/edit_user_provider.dart';

import 'edit_details_address_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var _showDetailsProvider = Provider.of<AddUserProvider>(context);
    var _editDetailsProvider = Provider.of<EditDetailProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "All Details",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        actions: [
          PopupMenuButton(
            child: Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
            ),
            onSelected: (value) {
              if (value == "Add") {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddNewUserPage(),
                    ));
              } else if (value == "LogOut") {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.blueGrey,
                  content: Text("You are LogOut"),
                  showCloseIcon: true,
                ));
              }
            },
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                    value: "Add",
                    child: Row(
                      children: [
                        Icon(CupertinoIcons.add),
                        SizedBox(
                          width: 5,
                        ),
                        Text("Add New Address")
                      ],
                    )),
                PopupMenuItem(
                    value: "LogOut",
                    child: Row(
                      children: [
                        Icon(
                          Icons.exit_to_app,
                          color: Colors.blue,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "LogOut",
                          style: TextStyle(color: Colors.blue),
                        )
                      ],
                    ))
              ];
            },
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10, left: 15, right: 15),
        child: _showDetailsProvider.listUserDetails.isEmpty
            ? Center(
                child: Text(
                  "No Data Added",
                  style: TextStyle(fontSize: 18, color: Colors.black54),
                ),
              )
            : ListView.separated(
                itemCount: _showDetailsProvider.listUserDetails.length,
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                  height: 10,
                ),
                itemBuilder: (BuildContext context, int index) {
                  // yaha sirf data build hoga agar list me item hai
                  return Container(
                    height: 250,
                    decoration: BoxDecoration(
                        color: Color(0xb0c6edff),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Color(0xec5198a6))),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 35),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "${_showDetailsProvider.listUserDetails[index].name}"),
                          Row(
                            children: [
                              Text(
                                  "${_showDetailsProvider.listUserDetails[index].villageName}, "),
                              Text(
                                  "${_showDetailsProvider.listUserDetails[index].shreet}, "),
                              Text(
                                  "${_showDetailsProvider.listUserDetails[index].pinCode}"),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                  "${_showDetailsProvider.listUserDetails[index].district}, "),
                              Text(
                                  "${_showDetailsProvider.listUserDetails[index].state}"),
                            ],
                          ),
                          Row(
                            children: [
                              Text("Phone Number:- "),
                              Text(
                                  "${_showDetailsProvider.listUserDetails[index].phone}"),
                            ],
                          ),
                          SizedBox(height: 40),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, right: 50),
                            child: SizedBox(
                              height: 45,
                              width: double.infinity,
                              child: OutlinedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                onPressed: () {
                                  var name = _editDetailsProvider.nameUpdateController.text = _showDetailsProvider.listUserDetails[index].name;
                                  var phone = _editDetailsProvider.phoneUpdateController.text = _showDetailsProvider.listUserDetails[index].phone;
                                  var street = _editDetailsProvider.shreetUpdateController.text = _showDetailsProvider.listUserDetails[index].shreet;
                                  var village = _editDetailsProvider.villageNameUpdateController.text = _showDetailsProvider.listUserDetails[index].villageName;
                                  var pincode = _editDetailsProvider.pinCodeUpdateController.text = _showDetailsProvider.listUserDetails[index].pinCode;
                                  var district = _editDetailsProvider.districtUpdateController.text = _showDetailsProvider.listUserDetails[index].district;
                                  var state = _editDetailsProvider.stateUpdateController.text = _showDetailsProvider.listUserDetails[index].state;

                                  _editDetailsProvider.ind = index;

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          EditDetailsAddressPage(
                                        name: '$name',
                                        phone: '$phone',
                                        shreet: "$street",
                                        village: "$village",
                                        pincode: '$pincode',
                                        district: '$district',
                                        state: '$state',
                                      ),
                                    ),
                                  );
                                  setState(() {});
                                },
                                child: Text(
                                  "Edit Details",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddNewUserPage(),
              ));
        },
        child: Icon(
          CupertinoIcons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
