// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:store_calculator/setting.dart';
import 'calculator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'setting.dart';
import 'package:google_fonts/google_fonts.dart';

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
      backgroundColor: const Color.fromARGB(255, 99, 237, 242),
      appBar: AppBar(
        title: const Text(" Jane's Customized Calculator"),
        centerTitle: true,
        backgroundColor: Colors.blue[400],
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
              accountName: Text("Janet Ahorlu"),
              accountEmail: Text("janetahorlu12@gmail.com"),
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
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                          elevation: 8,
                          child: Container(
                            width: 140,
                            height: 90,
                            color: const Color.fromARGB(255, 101, 223, 244),
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
                                      style: const TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  const Text("Total Amount")
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Card(
                          elevation: 8,
                          child: Container(
                            width: 140,
                            height: 90,
                            color: const Color.fromARGB(255, 48, 188, 212),
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
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  const Text('Balance')
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
                  height: 30,
                ),
        
                // EXPANDED
        
                Column(
                  children: [
                    // TEXTFIELD TO TAKE SMALL YARNS
                    TextField(
                      keyboardType: TextInputType.number,
                      controller: Syarn,
                      decoration: InputDecoration(
                          label: const Text("Number Small Cones"),
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
                      height: 10,
                    ),
        
                    // TEXTFIELD TO TAKE BIG YARNS
                    TextField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      controller: Byarn,
                      decoration: InputDecoration(
                          label: const Text("Number Hard Cones"),
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
                      height: 10,
                    ),
        
                    /// TEXTFIELD FOR NUMBER OF SHINE
        
                    TextField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      controller: Shine,
                      decoration: InputDecoration(
                          label: const Text("Number of Shine"),
                          contentPadding: const EdgeInsets.all(0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
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
                      height: 5,
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      controller: Charges,
                      decoration: InputDecoration(
                          label: const Text("Additional Charges"),
                          contentPadding: const EdgeInsets.all(1),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          prefix: const Text("G H ¢ "),
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
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    //TEXTFIELD FOR AMOUNT RECIEVED
                    TextField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      controller: Amount,
                      decoration: InputDecoration(
                          label: const Text("Payed"),
                          contentPadding: const EdgeInsets.all(4),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(60),
                          ),
                          prefix: const Text("G H ¢ "),
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
                    ElevatedButton(
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
                                ((p1 * num1) + (p2 * num2) + (ps * num1) + (cs));
                            Total =
                                (p1 * num3) + (p2 * num2) + (ps * num3) + (cs);
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
                    ElevatedButton(
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
                        child: const Icon(Icons.change_circle)),
                  ],
                ),
        
                const SizedBox(
                  height: 140,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Calculator()));
                  },
                  child: const Text(
                    "Calculator",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
