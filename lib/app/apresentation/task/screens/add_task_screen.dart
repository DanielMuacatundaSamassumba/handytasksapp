import 'package:flutter/material.dart';
import 'package:handytasksapp/app/apresentation/home/screens/home_screen.dart';
import 'package:handytasksapp/app/core/colors/colors.dart';
import 'package:handytasksapp/app/core/widgets/button_custom_widget.dart';
import 'package:handytasksapp/app/core/widgets/text_input_widget.dart';

class AddTaskScreen extends StatefulWidget {
  AddTaskScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  final _title = TextEditingController();
  final _description = TextEditingController();
  final _date = TextEditingController();
  final _status = TextEditingController();
  @override
  State<AddTaskScreen>createState()=>_AddTaskScreen();
}

class _AddTaskScreen extends State<AddTaskScreen>  {
      int statusNumber = 0;
   void handleChangeStatus(int status){
    setState(() {
      statusNumber =  status;
    });
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColorDarkTwo,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(width: 3),
                    Container(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap:() {
                           Navigator.pop(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                        },
                         child: Icon(Icons.close, color: Colors.white, size: 30),
                      ),
                    ),
                    Container(
                      color: AppColors.primaryColorDarkTwo,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Text(
                        "Adicionar Task",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 19,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text("Titúlo", style: TextStyle(color: Colors.white)),
                ),
                SizedBox(height: 5),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextInputWidget(
                    hintText: "Titulo",
                    type: keyBoardType.text,
                    controller: widget._title,
                  ),
                ),

                SizedBox(height: 10),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text("Descrição", style: TextStyle(color: Colors.white)),
                ),
                SizedBox(height: 5),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextInputWidget(
                    hintText: "Descrição",
                    type: keyBoardType.textarea,
                    controller: widget._description,
                  ),
                ),


                SizedBox(height: 10),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text("Data de Vencimento", style: TextStyle(color: Colors.white)),
                ),
                SizedBox(height: 5),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextInputWidget(
                    hintText: "Data de Vencimento",
                    type: keyBoardType.date,
                    controller: widget._date,
                  ),
                ),

                SizedBox(height: 10),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text("Status", style: TextStyle(color: Colors.white)),
                ),
                SizedBox(height: 5),
                Container(
                  padding: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                     color: AppColors.primaryColorDarkOne,
                     borderRadius: BorderRadius.circular(17)
                  ),
                
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: [
                        InkWell(
                          onTap: () {
                             handleChangeStatus(0);
                          },
                           child: Container(
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(10),
                               color: statusNumber == 0 ? Colors.grey:AppColors.primaryColorDarkOne ,
                            ),
                             child: Text("Pendente",  style: TextStyle(color: Colors.white, 
                           
                             
                           ),),
                           ),
                        ),

                              InkWell(
                          onTap: () {
                             handleChangeStatus(1);
                          },
                           child: Container(
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(10),
                               color: statusNumber == 1 ? Colors.grey:AppColors.primaryColorDarkOne ,
                            ),
                             child: Text("Em Andamento",  style: TextStyle(color: Colors.white, 
                           
                             
                           ),),
                           ),
                        ),
                              InkWell(
                          onTap: () {
                             handleChangeStatus(2);
                          },
                           child: Container(
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(10),
                               color: statusNumber == 2 ? Colors.grey:AppColors.primaryColorDarkOne ,
                            ),
                             child: Text("Concluido",  style: TextStyle(color: Colors.white, 
                           
                             
                           ),),
                           ),
                        ),
                    
                     ],
                  )
                ),
                SizedBox(height: 230,),
                ButtonCustomWidget(text: "Adicionar", onpressed: ()=>  {})  
              ],
            ),
          ),
        ),
      ),
    );
  }

  }