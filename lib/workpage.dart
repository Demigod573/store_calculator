// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:store_calculator/setting.dart';
import 'calculator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'setting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/src/material/colors.dart';

class WorkPage extends StatefulWidget {
  const WorkPage({super.key});

  @override
  State<WorkPage> createState() => _WorkPageState();
}

////INSTANTIATIN THE CONTROLLERS SO THAT I CAN USE IT IN THE MAI CODE THUS FOR MANIPULATIONS
final Syarn = TextEditingController();
final Byarn = TextEditingController();
final Amount = TextEditingController();
final Shine = TextEditingController();
final Charges = TextEditingController();

////THE BALANE WILL BE DISPLAYED ON THE SCREEN, BUT INITIALLY SHOULD DISPLAY A ZERO
double balance = 0;
double Total = 0;
double num1 = 1;
double num2 = 2;

double num3 = 3;



class _WorkPageState extends State<WorkPage> {
  Future<void> _readFromStorage() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
     num1 = localStorage.getDouble("SHINE")!;
     num2 = localStorage.getDouble('HARD')!;
     num3 = localStorage.getDouble("SOFT")!;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _readFromStorage();
  }

  @override
  Widget build(BuildContext context) {
    _readFromStorage();
   
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 74, 74, 74),
      appBar: AppBar( 
        title: const Text("Jane's Yarn Calculator", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,letterSpacing: 5)),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 81, 83, 83),
        
        
      ),


      ////DRAWER DOWN HERE
      ///
      ///
      ///
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text("Janet Ahorlu", style: TextStyle(fontSize: 35, letterSpacing: 2),),
              accountEmail: Text("janetahorlu12@gmail.com", style: TextStyle(fontSize: 20, letterSpacing: 2),),
              decoration: BoxDecoration(color: Color.fromARGB(255, 59, 59, 59)),
            ),
            ListTile(
              leading: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Setting()));
                  },
                  icon: const Icon(Icons.settings)),
              title: const Text(
                'Set Prices',
                style: TextStyle(fontSize: 16,letterSpacing: 2, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              leading: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.production_quantity_limits_outlined)),
              title: const Text(
                'Yarns to Stock', 
               style: TextStyle(fontSize: 16,letterSpacing: 2, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              leading: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.payments_sharp)),
              title: const Text(
                ' Sales Person Salary Slip',
               style: TextStyle(fontSize: 16,letterSpacing: 2, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              leading: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.card_membership_rounded)),
              title: const Text(
                ' About the shop',
               style: TextStyle(fontSize: 16,letterSpacing: 2, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),




      ////// DRAWER ENDS HERE
      ///
      ///
      ///
      ///
      ///AND THE BODY COMES
      ///
      ///
      ///
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //////
                ///
                /////
                Column(
                  children: [
                    Row(
                      children: [
                        Card(
                          elevation: 18,
                          child: Container(
                            width: 140,
                            height: 100,
                            color: Color.fromARGB(255, 102, 113, 113),
                            child: Center(
                              ///
                              /// THIS IS WHERE THE BALANCE IS SHOWN IN THE APP
                              ///
                              ///
                              child: Column(
                                children: [
                                  SizedBox(height: 20,),
                                  Center(
                                    child: Text(
                                      'GH₵' + Total.toString() + '0',
                                      style: const TextStyle(color: Colors.white,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  const Text("Total Amount", style: TextStyle(color: Colors.white,letterSpacing: 2, fontWeight: FontWeight.bold),)
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Card(
                          elevation: 16,
                          child: Container(
                            width: 140,
                            height: 100,
                            color: Color.fromARGB(255, 167, 205, 210),
                            child: Center(
                              ////
                              /// THIS IS WHERE THE BALANCE IS SHOWN IN THE APP
                              ///
                              ///
                              child: Column(
                                children: [
                                  SizedBox(height: 20,),
                                  Center(
                                    child: Text(
                                      'GH₵' + balance.toString() + '0',
                                      style: const TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,),
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  const Text('Balance' , style: TextStyle(letterSpacing: 2, fontWeight: FontWeight.bold),)
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
        
                // EXPANDED
        
                Column(
                  children: [
                    // TEXTFIELD TO TAKE SMALL YARNS
                    TextField(style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                      keyboardType: TextInputType.number,
                      controller: Syarn,
                      decoration: InputDecoration(
                          label: const Text("          Number Small Cones", style: TextStyle(color: Colors.white),),
                          contentPadding: const EdgeInsets.all(0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(width: 0,)),
                          suffix: IconButton(
                            onPressed: () {
                              setState(() {
                                Syarn.clear();
                              });
                            },
                            icon: const Icon(Icons.cancel),
                            color: Colors.white,
                          )),
                    ),
        
                    const SizedBox(
                      height: 14,
                    ),
        
                    // TEXTFIELD TO TAKE BIG YARNS
                    TextField(style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      controller: Byarn,
                      decoration: InputDecoration(
                          label: const Text("         Number Hard Cones", style: TextStyle(color: Colors.white),),
                          contentPadding: const EdgeInsets.all(0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(width: 30)),
                          suffix: IconButton(
                            onPressed: () {
                              setState(() {
                                Byarn.clear();
                              });
                            },
                            icon: const Icon(Icons.cancel),
                            color: Colors.white,
                          )),
                    ),
                    const SizedBox(
                      height: 13,
                    ),
        
                    /// TEXTFIELD FOR NUMBER OF SHINE
        
                    TextField(
                      style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      controller: Shine,
                      decoration: InputDecoration(
                          label: const Text("         Number of Shine", style: TextStyle(color: Colors.white),),
                          contentPadding: const EdgeInsets.all(0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2),
                              borderSide: const BorderSide(width: 1)),
                          suffix: IconButton(
                            onPressed: () {
                              setState(() {
                                Byarn.clear();
                              });
                            },
                            icon: const Icon(Icons.cancel),
                            color: const Color.fromARGB(255, 248, 246, 246),
                          )),
                    ),
        
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      controller: Charges,
                      decoration: InputDecoration(
                          label: const Text("          Additional Charges", style: TextStyle(color: Colors.white),),
                          contentPadding: const EdgeInsets.all(1),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          prefix: const Text("G H ¢ ", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                          suffix: IconButton(
                            onPressed: () {
                              setState(() {
                                Charges.clear();
                              });
                            },
                            icon: const Icon(Icons.cancel),
                            color: Colors.white,
                          )),
                    ),
        
                    const SizedBox(
                      height: 40,
                    ),
                    const Text(
                      "AMOUNT PAYED",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25 , letterSpacing: 2, color: Colors.white)
                    ),

                    SizedBox(height: 25,),
                    //TEXTFIELD FOR AMOUNT RECIEVED
                    TextField(style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      controller: Amount,
                      decoration: InputDecoration(
                          label: const Text("                             Payed", style: TextStyle(color: Colors.white, fontSize: 20),),
                          contentPadding: const EdgeInsets.all(0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(80),
                          ),
                          prefix: const Text(" G H ¢ ",style: const TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),),
                          suffix: IconButton(
                            onPressed: () {
                              setState(() {
                                Amount.clear();
                              });
                            },
                            icon: const Icon(Icons.cancel),
                            color: Colors.white,
                          )),
                    ),
        
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
        
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //// CALCULATE BUTTON
                    ///
                    ///
                    ElevatedButton(style: ElevatedButton.styleFrom(primary: Color.fromARGB(0, 38, 55, 60)) ,
                        onPressed: () {
                          // ignore: avoid_print
        
                          setState(() {
                            _readFromStorage();
        
                            //// CHANGING THE CONTROLLER VALUE FROM TEXT TO AN INTEGER
                            double p1 = double.parse(Syarn.text);
                            double p2 = double.parse(Byarn.text);
                            double p3 = double.parse(Amount.text);
                            double ps = double.parse(Shine.text);
                            double cs = double.parse(Charges.text);
        
                            balance = p3 -
                                ((p1 * num3) + (p2 * num2) + (ps * num1) + (cs));
                            Total =
                                (p1 * num3) + (p2 * num2) + (ps * num1) + (cs);
                          });
        
                          setState(() {});
                        },
                        child: const Text(
                          "Calculate",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        )),
                    const SizedBox(
                      width: 70,
                    ),
        
                    ////RESET BUTTON
                    ElevatedButton(style: ElevatedButton.styleFrom(primary: Color.fromARGB(0, 32, 54, 54)) ,
                        onPressed: () {
                          setState(() {
                            balance = 0;
                            Total = 0;
                            Amount.clear();
                            Syarn.clear();
                            Byarn.clear();
                            Shine.clear();
                            Charges.clear();
                          });
                        },
                        child: const Icon(Icons.reset_tv,)),
                  ],
                ),
        
                const SizedBox(
                  height: 70,
                ),
                ElevatedButton(style: ElevatedButton.styleFrom(primary: Color.fromARGB(0, 46, 81, 78)) ,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Calculator()));
                  },
                  
                  child: const Text(
                    "Calculator",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, letterSpacing: 2),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
