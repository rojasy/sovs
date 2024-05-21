import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sovs/controllers/candidate_controller.dart';

import '../controllers/election_controller.dart';
import '../controllers/users_controller.dart';
import '../models/all_election_model.dart';
import '../models/get_all_users_model.dart';
import '../utils/constants.dart';

class AddCandidateScreen extends StatefulWidget {
  const AddCandidateScreen({super.key});

  @override
  State<AddCandidateScreen> createState() => _AddCandidateScreenState();
}

class _AddCandidateScreenState extends State<AddCandidateScreen> {

  String userValue = "";
  String electionValue = "";
  String categoryValue = "";

  TextEditingController searchController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  ScrollController scrollController = ScrollController();

  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          const CircularProgressIndicator(),
          Container(
              margin: const EdgeInsets.only(left: 7),
              child: Text("Loading!!")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Candidate",style: TextStyle(color: whiteColor,fontFamily: "Poppins"),),centerTitle: true,backgroundColor: primaryColor,iconTheme: IconThemeData(color: whiteColor)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 25,),
            Consumer<GetUsersController>(
              builder: (context, usersData, __) {
                return _buildDropdownUsersButton(usersData.getAllUser);
              },
            ),
            SizedBox(height: 20,),

            Consumer<GetAllElectionController>(
              builder: (context, electionData, __) {
                return _buildDropdownElectionButton(electionData.getAllElection);
              },
            ),
            // _buildDropdownElectionCategoryButton(ElectionCategory.values),
            SizedBox(height: 20,),
            TextFormField(
              controller: titleController,
              autofocus: false,
              decoration: InputDecoration(
                  hintText: "Policy title",
                  isDense: true,
                  filled: true,
                  fillColor: primaryColor.withOpacity(0.3),
                  contentPadding: EdgeInsets.all(20),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none
                  )
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              controller: descriptionController,
              autofocus: false,
              decoration: InputDecoration(
                  hintText: "Policy Description",
                  isDense: true,
                  filled: true,
                  fillColor: primaryColor.withOpacity(0.3),
                  contentPadding: EdgeInsets.all(20),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none
                  )
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    padding: EdgeInsets.all(10),
                    minimumSize: Size(MediaQuery.of(context).size.width * 0.9, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    )
                ),
                onPressed: ()async{

                  showLoaderDialog(context);

                  Map<String,dynamic>? output = await Provider.of<CandidateController>(context, listen: false).
                  createCandidate(context, descriptionController.text, electionValue, titleController.text, userValue);

                  String message = output?['createCandidate']['message'];
                  bool error = output?['createCandidate']['error'];

                  if(error == false){
                    Navigator.pop(context);
                    ScaffoldMessenger.of(
                        context)
                        .showSnackBar(
                        SnackBar(content: Text(message)));
                    Navigator.of(
                        context)
                        .pop();

                  }else{
                    Navigator.pop(context);

                    ScaffoldMessenger.of(
                        context)
                        .showSnackBar(
                        SnackBar(content: Text(message),backgroundColor: errorColor,));
                    Navigator.of(
                        context)
                        .pop();
                  }

                }, child: Text("Add Candidate",style: TextStyle(color: whiteColor),))
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownUsersButton(List<AllUsers> items) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      // padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: DropdownButtonFormField2<String>(
        isExpanded: true,
        decoration: InputDecoration(
            hintText: "Select User",
            // Add Horizontal padding using menuItemStyleData.padding so it matches
            // the menu padding when button's width is not specified.
            contentPadding: const EdgeInsets.symmetric(vertical: 10),
            border: const OutlineInputBorder(
              // borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
            fillColor: primaryColor.withOpacity(0.3),
            filled: true,
            // Add more decoration..
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(15),
            )),
        hint: Text("Select User"),
        items: items
            .map((item) => DropdownMenuItem<String>(
          value: item.uuid,
          child: Text(
            '${item.fullName}',
            style: const TextStyle(color: Colors.black),
          ),
        ))
            .toList(),
        validator: (value) {
          if (value == null) {
            return "User needed";
          }
          return null;
        },
        onChanged: (value) {
          setState(() {
            userValue = value!;
            // dropdownValue = value;
          });
        },
        onSaved: (value) {
          setState(() {
            userValue = value.toString();
          });
          // dropdownValue = value.toString();
        },
        buttonStyleData: const ButtonStyleData(
          padding: EdgeInsets.only(right: 8),
        ),
        iconStyleData: const IconStyleData(
          icon: Icon(
            Icons.arrow_drop_down,
            color: Colors.black45,
          ),
          iconSize: 24,
        ),
        dropdownSearchData: DropdownSearchData(
            searchController: searchController,
            searchInnerWidgetHeight: 50,
            searchInnerWidget: Container(
              height: 50,
              padding: const EdgeInsets.only(
                top: 8,
                bottom: 4,
                right: 8,
                left: 8,
              ),
              child: TextFormField(
                expands: true,
                maxLines: null,
                controller: searchController,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 8,
                  ),
                  hintText: "Search User",
                  hintStyle: const TextStyle(fontSize: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            searchMatchFn: (item, searchValue) {
              final myItem = items.firstWhere(
                      (element) => element.fullName == item.value,
                  orElse: () =>
                      AllUsers(active: true, email: '', firstName: '', lastName: '',
                          middleName: null, phone: '', uuid: '', username: '', fullName: '', id: 0));
              return myItem.fullName.contains(searchValue);
            }

          // searchMatchFn: (item, searchValue) {
          //   final myItem = items.firstWhere(
          //         (element) => element.name == item.value,
          //     orElse: () => DataList(active: false, id: 0, name: '', uuid: ''), // Return null if no element is found
          //   );
          //
          //   if (myItem != null) {
          //     return myItem.name.toLowerCase().contains(searchValue.toLowerCase()) ||
          //         item.value.toString().contains(searchValue.toLowerCase());
          //   }
          //   return false; // If no element is found, return false
          // },

        ),
        onMenuStateChange: (isOpen) {
          if (!isOpen) {
            searchController.clear();
          }
        },
        dropdownStyleData: DropdownStyleData(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          padding: EdgeInsets.symmetric(horizontal: 16),
        ),
      ),
    );
  }

  Widget _buildDropdownElectionButton(List<AllElection> items) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      // padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: DropdownButtonFormField2<String>(
        isExpanded: true,
        decoration: InputDecoration(
            hintText: "Select Election",
            // Add Horizontal padding using menuItemStyleData.padding so it matches
            // the menu padding when button's width is not specified.
            contentPadding: const EdgeInsets.symmetric(vertical: 10),
            border: const OutlineInputBorder(
              // borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
            fillColor: primaryColor.withOpacity(0.3),
            filled: true,
            // Add more decoration..
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(15),
            )),
        hint: Text("Select Election"),
        items: items
            .map((item) => DropdownMenuItem<String>(
          value: item.uuid,
          child: Text(
            '${item.name}',
            style: const TextStyle(color: Colors.black),
          ),
        ))
            .toList(),
        validator: (value) {
          if (value == null) {
            return "Election needed";
          }
          return null;
        },
        onChanged: (value) {
          setState(() {
            electionValue = value!;
            // dropdownValue = value;
          });
        },
        onSaved: (value) {
          setState(() {
            electionValue = value.toString();
          });
          // dropdownValue = value.toString();
        },
        buttonStyleData: const ButtonStyleData(
          padding: EdgeInsets.only(right: 8),
        ),
        iconStyleData: const IconStyleData(
          icon: Icon(
            Icons.arrow_drop_down,
            color: Colors.black45,
          ),
          iconSize: 24,
        ),
        dropdownSearchData: DropdownSearchData(
            searchController: searchController,
            searchInnerWidgetHeight: 50,
            searchInnerWidget: Container(
              height: 50,
              padding: const EdgeInsets.only(
                top: 8,
                bottom: 4,
                right: 8,
                left: 8,
              ),
              child: TextFormField(
                expands: true,
                maxLines: null,
                controller: searchController,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 8,
                  ),
                  hintText: "Search Election",
                  hintStyle: const TextStyle(fontSize: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            searchMatchFn: (item, searchValue) {
              final myItem = items.firstWhere(
                      (element) => element.name == item.value,
                  orElse: () =>
                      AllElection(active: true, category: '', description: '', id: 0, name: '', uuid: '', year: 2024));
              return myItem.name.contains(searchValue);
            }

          // searchMatchFn: (item, searchValue) {
          //   final myItem = items.firstWhere(
          //         (element) => element.name == item.value,
          //     orElse: () => DataList(active: false, id: 0, name: '', uuid: ''), // Return null if no element is found
          //   );
          //
          //   if (myItem != null) {
          //     return myItem.name.toLowerCase().contains(searchValue.toLowerCase()) ||
          //         item.value.toString().contains(searchValue.toLowerCase());
          //   }
          //   return false; // If no element is found, return false
          // },

        ),
        onMenuStateChange: (isOpen) {
          if (!isOpen) {
            searchController.clear();
          }
        },
        dropdownStyleData: DropdownStyleData(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          padding: EdgeInsets.symmetric(horizontal: 16),
        ),
      ),
    );
  }


  Widget _buildDropdownElectionCategoryButton(List<ElectionCategory> items) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      // padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: DropdownButtonFormField2<String>(
        isExpanded: true,
        decoration: InputDecoration(
            hintText: "Select Category",
            // Add Horizontal padding using menuItemStyleData.padding so it matches
            // the menu padding when button's width is not specified.
            contentPadding: const EdgeInsets.symmetric(vertical: 10),
            border: const OutlineInputBorder(
              // borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
            fillColor: Colors.white,
            filled: true,
            // Add more decoration..
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(15),
            )),
        hint: Text("Select Category"),
        items: items
            .map((item) => DropdownMenuItem<String>(
          value: item.name,
          child: Text(item.name,
            style: const TextStyle(color: Colors.black),
          ),
        ))
            .toList(),
        validator: (value) {
          if (value == null) {
            return "Category needed";
          }
          return null;
        },
        onChanged: (value) {
          setState(() {
            categoryValue = value!;
            // dropdownValue = value;
          });
          //_controller.getFinancialHighLeastProjectConsumingRateGraph(selectedValue);
          //Do something when selected item is changed.
        },
        onSaved: (value) {
          setState(() {
            categoryValue = value.toString();
          });
          // dropdownValue = value.toString();
        },
        buttonStyleData: const ButtonStyleData(
          padding: EdgeInsets.only(right: 8),
        ),
        iconStyleData: const IconStyleData(
          icon: Icon(
            Icons.arrow_drop_down,
            color: Colors.black45,
          ),
          iconSize: 24,
        ),
        dropdownStyleData: DropdownStyleData(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          padding: EdgeInsets.symmetric(horizontal: 16),
        ),
      ),
    );
  }

}

enum ElectionCategory{
  COBA_PARLIAMENT,
  COET_PARLIAMENT,
  PRESIDENT
}