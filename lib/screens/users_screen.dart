import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/users_controller.dart';
import '../utils/constants.dart';
import 'add_user_screen.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Users",style: TextStyle(color: whiteColor,fontFamily: "Poppins"),),backgroundColor: primaryColor,iconTheme: IconThemeData(color: Colors.white),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        padding: EdgeInsets.all(10),
                        minimumSize: Size(MediaQuery.of(context).size.width * 0.4, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        )
                    ),
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddUserScreen()));
                    }, child: Text("Add User",style: TextStyle(color: Colors.white)))
              ],
            ),
            SizedBox(height: 10,),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Consumer<GetUsersController>(
                builder: (context,userData,_){
                  return userData.dataLoading == true ? Center(child: CircularProgressIndicator(),) :
                  userData.getAllUser.isEmpty ? Center(child: Text("No User available"),):
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: userData.getAllUser.length,
                      itemBuilder: (context,index){
                    return Material(
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text("Name: ${userData.getAllUser[index].fullName}",style: TextStyle(color: primaryColor,fontFamily: "Poppins"),),
                                SizedBox(width: 10,),
                                Text("COBA"),
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(onPressed: (){}, icon: Icon(Icons.visibility)),
                                IconButton(onPressed: (){
                                  showDialog(
                                      barrierDismissible: false,
                                      context: context,
                                      builder: (context){
                                        return AlertDialog(
                                          title: Text("Remove User",style: TextStyle(color: primaryColor,fontFamily: "Poppins",fontSize: 20),),
                                          content: Text("Click YES! To Remove as User"),
                                          actions: [
                                            ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor: errorColor,
                                                    padding: EdgeInsets.all(10),
                                                    minimumSize: Size(MediaQuery.of(context).size.width * 0.2, 50),
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                                    )
                                                ),
                                                onPressed: (){
                                                  Navigator.of(context).pop();
                                                }, child: Text("No",style: TextStyle(color: whiteColor),)),
                                            ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor: secondaryColor,
                                                    padding: EdgeInsets.all(10),
                                                    minimumSize: Size(MediaQuery.of(context).size.width * 0.2, 50),
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                                    )
                                                ),
                                                onPressed: (){}, child: Text("Yes",style: TextStyle(color: whiteColor),)),

                                          ],
                                        );
                                      });
                                }, icon: Icon(Icons.delete,color: errorColor,)),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  });
                },
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
