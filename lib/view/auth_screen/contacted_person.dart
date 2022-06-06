import 'package:flutter/material.dart';
import 'package:tranvision_customer_app/utils/constant/text.dart';

class ContactedPerson extends StatelessWidget {
  const ContactedPerson({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.orange[300],
          title: const WeightText(
              text: "Contacted Person", size: 20.0, color: Colors.black),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Column(children: [
              Image.asset("assets/images/contact.png"),
              const WeightText(
                  text: "Contact Person", size: 25.0, color: Colors.black),
              Padding(
                padding:
                    const EdgeInsets.only(left: 10.0, right: 10.0, top: 15.0),
                child: Column(
                  children: [
                    TextField(
                      readOnly: true,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          // labelText: "Contacted person",
                          hintText: "contactperson",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          )),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextField(
                      readOnly: true,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          // labelText: "Mobile No",
                          hintText: "contno",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 25.0, right: 25.0, bottom: 10.0, top: 50.0),
                      child: Row(
                        children: [
                          Expanded(
                              child: InkWell(
                            onTap: (() {}),
                            child: Container(
                              alignment: Alignment.center,
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(9),
                                  color: Colors.orange[300]),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Icon(Icons.system_update_alt,
                                      color: Colors.black),
                                  WeightText(
                                      text: "Update",
                                      size: 18.0,
                                      color: Colors.black),
                                ],
                              ),
                            ),
                          )),
                          const SizedBox(
                            width: 20.0,
                          ),
                          Expanded(
                              child: InkWell(
                            onTap: () {},
                            child: Container(
                              alignment: Alignment.centerRight,
                              height: 50,
                              padding: const EdgeInsets.only(left: 20),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(9),
                                  color: Colors.green[400]),
                              child: Row(
                                children: const [
                                  Icon(Icons.edit, color: Colors.black),
                                  WeightText(
                                      text: "Edit",
                                      size: 18.0,
                                      color: Colors.black),
                                ],
                              ),
                            ),
                          )),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ])
          ],
        ));
  }
}
