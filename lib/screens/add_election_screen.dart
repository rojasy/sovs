import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/election_controller.dart';
import '../utils/constants.dart';

class AddElectionScreen extends StatefulWidget {
  const AddElectionScreen({super.key});

  @override
  State<AddElectionScreen> createState() => _AddElectionScreenState();
}

class _AddElectionScreenState extends State<AddElectionScreen> {

  String categoryValue = "";

  TextEditingController searchController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController yearController = TextEditingController();

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
      appBar: AppBar(title: Text("Add Election",style: TextStyle(color: whiteColor,fontFamily: "Poppins"),),centerTitle: true,backgroundColor: primaryColor,iconTheme: IconThemeData(color: whiteColor)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 25,),
            _buildDropdownElectionCategoryButton(ElectionCategory.values),
            SizedBox(height: 20,),
            TextFormField(
              controller: titleController,
              autofocus: false,
              decoration: InputDecoration(
                  hintText: "title",
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
                  hintText: "Description",
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
              controller: yearController,
              autofocus: false,
              decoration: InputDecoration(
                  hintText: "Year",
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

                  Map<String,dynamic>? output = await Provider.of<GetAllElectionController>(context, listen: false).
                  createElection(context, categoryValue, descriptionController.text, titleController.text, int.parse(yearController.text));

                  String message = output?['createElection']['message'];
                  bool error = output?['createElection']['error'];

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

                }, child: Text("Add Election",style: TextStyle(color: whiteColor),))
          ],
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