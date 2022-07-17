import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_file/open_file.dart';
import 'package:tranvision_customer_app/utils/constant/sized_box.dart';
import 'package:tranvision_customer_app/utils/constant/text.dart';

class BLDetails extends StatelessWidget {
  const BLDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      ExpansionTile(
        title: NormalText(
            text: "Enter Shipper/Consignee details",
            size: 15.sp,
            color: Colors.black),
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 8.h),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Shipper",
                        style: TextStyle(fontSize: 15.sp, color: Colors.black),
                      ),
                      SizeBox.customHeight(10.h),
                      TextField(
                          // keyboardType: TextInputType.multiline,
                          // maxLines: 5,
                          // minLines: 1,
                          decoration: InputDecoration(
                        hintText: "Enter Shipper",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9.r)),
                      )),
                      SizeBox.customHeight(10.h),
                      TextField(
                          // keyboardType: TextInputType.multiline,
                          // maxLines: 5,
                          // minLines: 1,
                          decoration: InputDecoration(
                        hintText: "Enter Address",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9.r)),
                      ))
                    ],
                  ),
                ),
                SizeBox.customWidth(10.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Consignee",
                        style: TextStyle(fontSize: 15.sp, color: Colors.black),
                      ),
                      SizeBox.customHeight(10.h),
                      TextField(
                          // keyboardType: TextInputType.multiline,
                          // maxLines: 5,
                          // minLines: 1,
                          decoration: InputDecoration(
                        hintText: "Enter Consignee",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9)),
                      )),
                      SizeBox.customHeight(10.h),
                      TextField(
                          keyboardType: TextInputType.multiline,
                          maxLines: 5,
                          minLines: 1,
                          decoration: InputDecoration(
                            hintText: "Enter Address",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(9.r)),
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      ExpansionTile(
          title: NormalText(
              text: "Enter the Notify/Marks No Details",
              size: 15.sp,
              color: Colors.black),
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 8.h),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Notify",
                          style:
                              TextStyle(fontSize: 15.sp, color: Colors.black),
                        ),
                        SizeBox.customHeight(10.h),
                        TextField(
                            keyboardType: TextInputType.multiline,
                            maxLines: 2,
                            minLines: 1,
                            decoration: InputDecoration(
                              hintText: "Enter Notify",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(9.r)),
                            )),
                      ],
                    ),
                  ),
                  SizeBox.customWidth(10.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Marks No",
                          style:
                              TextStyle(fontSize: 15.sp, color: Colors.black),
                        ),
                        SizeBox.customHeight(10.h),
                        TextField(
                            keyboardType: TextInputType.multiline,
                            maxLines: 5,
                            minLines: 1,
                            decoration: InputDecoration(
                              hintText: "Enter Marks No",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(9.r)),
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ]),
      ExpansionTile(
        title: NormalText(
            text: "Enter the Emails of Shipper/Notify",
            size: 15.sp,
            color: Colors.black),
        iconColor: Colors.blueAccent,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 8.h),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Consignee Email",
                        style: TextStyle(fontSize: 15.sp, color: Colors.black),
                      ),
                      SizeBox.customHeight(10.h),
                      TextField(
                          keyboardType: TextInputType.multiline,
                          maxLines: 2,
                          minLines: 1,
                          decoration: InputDecoration(
                            hintText: "Consignee Email",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(9.r)),
                          )),
                    ],
                  ),
                ),
                SizeBox.customWidth(10.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Notify Email",
                        style: TextStyle(fontSize: 15.sp, color: Colors.black),
                      ),
                      SizeBox.customHeight(10.h),
                      TextField(
                          keyboardType: TextInputType.multiline,
                          maxLines: 2,
                          minLines: 1,
                          decoration: InputDecoration(
                            hintText: "Notify Email",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(9.r)),
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      ExpansionTile(
        title: NormalText(
            text: "Enter the Details of Port/Place",
            size: 15.sp,
            color: Colors.black),
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 8.h),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Place Of Acceptance",
                        style: TextStyle(fontSize: 15.sp, color: Colors.black),
                      ),
                      SizeBox.customHeight(10.h),
                      TextField(
                          decoration: InputDecoration(
                        hintText: "Enter Place Of Acceptance",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9.r)),
                      )),
                    ],
                  ),
                ),
                SizeBox.customWidth(10.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Place Of Discharge",
                        style: TextStyle(fontSize: 15.sp, color: Colors.black),
                      ),
                      SizeBox.customHeight(10.h),
                      TextField(
                          decoration: InputDecoration(
                        hintText: "Enter Place Of Discharge",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9.r)),
                      )),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizeBox.customHeight(10.h),
          Padding(
            padding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 8.h),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Port Of Loading",
                        style: TextStyle(fontSize: 15.sp, color: Colors.black),
                      ),
                      SizeBox.customHeight(10.h),
                      TextField(
                          decoration: InputDecoration(
                        hintText: "Enter Port Of Loading",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9.r)),
                      )),
                    ],
                  ),
                ),
                SizeBox.customWidth(10.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Port Of Delivery",
                        style: TextStyle(fontSize: 15.sp, color: Colors.black),
                      ),
                      SizeBox.customHeight(10.h),
                      TextField(
                          decoration: InputDecoration(
                        hintText: "Enter Port Of Delivery",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9.r)),
                      )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      ExpansionTile(
        title: NormalText(
            text: "Enter the Details of Vessel/Routes",
            size: 15.sp,
            color: Colors.black),
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 8.h),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Vessel & Voyage",
                        style: TextStyle(fontSize: 15.sp, color: Colors.black),
                      ),
                      SizeBox.customHeight(10.h),
                      TextField(
                          decoration: InputDecoration(
                        hintText: "Enter Vessel & Voyage",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9.r)),
                      )),
                    ],
                  ),
                ),
                SizeBox.customWidth(10.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Route/Transhipment",
                        style: TextStyle(fontSize: 15.sp, color: Colors.black),
                      ),
                      SizeBox.customHeight(10.h),
                      TextField(
                          decoration: InputDecoration(
                        hintText: "Enter Route/Place Of Transhipment",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9.r)),
                      )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      ExpansionTile(
        title: NormalText(
            text: "Enter the Details of Mode/Package/Weight",
            size: 15.sp,
            color: Colors.black),
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 8.h),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Mode/Means Of",
                        style: TextStyle(fontSize: 15.sp, color: Colors.black),
                      ),
                      SizeBox.customHeight(10.h),
                      TextField(
                          decoration: InputDecoration(
                        hintText: "Enter Mode/Means Of",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9.r)),
                      )),
                    ],
                  ),
                ),
                SizeBox.customWidth(10.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Packages",
                        style: TextStyle(fontSize: 15.sp, color: Colors.black),
                      ),
                      SizeBox.customHeight(10.h),
                      TextField(
                          decoration: InputDecoration(
                        hintText: "Enter Packages",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9.r)),
                      )),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizeBox.customHeight(10.h),
          Padding(
            padding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 8.h),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Net Weight",
                        style: TextStyle(fontSize: 15.sp, color: Colors.black),
                      ),
                      SizeBox.customHeight(10.h),
                      TextField(
                          decoration: InputDecoration(
                        hintText: "Enter Net Weight",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9.r)),
                      )),
                    ],
                  ),
                ),
                SizeBox.customWidth(10.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Gross Weight",
                        style: TextStyle(fontSize: 15.sp, color: Colors.black),
                      ),
                      SizeBox.customHeight(10.h),
                      TextField(
                          decoration: InputDecoration(
                        hintText: "Gross Weight",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9.r)),
                      )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      ExpansionTile(
        title: NormalText(
            text: "Enter the Details of Measurement",
            size: 15.sp,
            color: Colors.black),
        subtitle: NormalText(
            text: "BL's Qty/Freight Payable", size: 15.sp, color: Colors.black),
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 8.h),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Measurement",
                        style: TextStyle(fontSize: 15.sp, color: Colors.black),
                      ),
                      SizeBox.customHeight(10),
                      TextField(
                          decoration: InputDecoration(
                        hintText: "Measurement",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9.r)),
                      )),
                    ],
                  ),
                ),
                SizeBox.customWidth(10.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Freight Pay",
                        style: TextStyle(fontSize: 15.sp, color: Colors.black),
                      ),
                      SizeBox.customHeight(10.h),
                      TextField(
                          decoration: InputDecoration(
                        hintText: "Freight",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9.r)),
                      )),
                    ],
                  ),
                ),
                SizeBox.customWidth(10.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "BL's Qty",
                        style: TextStyle(fontSize: 15.sp, color: Colors.black),
                      ),
                      SizeBox.customHeight(10.h),
                      TextField(
                          decoration: InputDecoration(
                        hintText: "BL's Qty.",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9.r)),
                      )),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
      ExpansionTile(
        title: NormalText(
            text: "Enter the Details of FreeDay",
            size: 15.sp,
            color: Colors.black),
        subtitle: NormalText(
            text: "Place/Freight Amount", size: 13.sp, color: Colors.black),
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 8.h),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "FreeDays Agree",
                        style: TextStyle(fontSize: 15.sp, color: Colors.black),
                      ),
                      SizeBox.customHeight(10.h),
                      TextField(
                          decoration: InputDecoration(
                        hintText: "Free Days Agreed",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9.r)),
                      )),
                    ],
                  ),
                ),
                SizeBox.customWidth(10.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Freight Amount",
                        style: TextStyle(fontSize: 15.sp, color: Colors.black),
                      ),
                      SizeBox.customHeight(10.h),
                      TextField(
                          decoration: InputDecoration(
                        hintText: "Freight Amount",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9.r)),
                      )),
                    ],
                  ),
                ),
                SizeBox.customWidth(10.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Place",
                        style: TextStyle(fontSize: 15.sp, color: Colors.black),
                      ),
                      SizeBox.customHeight(10.h),
                      TextField(
                          decoration: InputDecoration(
                        hintText: "Place",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9.r)),
                      )),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
      ExpansionTile(
        title: NormalText(
            text: "Enter the Details of Date of Issue",
            size: 15.sp,
            color: Colors.black),
        subtitle:
            NormalText(text: "Date/Type", size: 15.sp, color: Colors.black),
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 8.h),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Date",
                        style: TextStyle(fontSize: 15.sp, color: Colors.black),
                      ),
                      SizeBox.customHeight(10.h),
                      TextField(
                          decoration: InputDecoration(
                        hintText: "Enter Date",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9.r)),
                      )),
                    ],
                  ),
                ),
                SizeBox.customWidth(10.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Date Of Issue",
                        style: TextStyle(fontSize: 15.sp, color: Colors.black),
                      ),
                      SizeBox.customHeight(10.h),
                      TextField(
                          decoration: InputDecoration(
                        hintText: "Date Of Issue",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9.r)),
                      )),
                    ],
                  ),
                ),
                SizeBox.customWidth(10.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Type",
                        style: TextStyle(fontSize: 15.sp, color: Colors.black),
                      ),
                      SizeBox.customHeight(10.h),
                      TextField(
                          decoration: InputDecoration(
                        hintText: "Enter Type",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9.r)),
                      )),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
      ExpansionTile(
        title: NormalText(
            text: "Enter the Description of Good",
            size: 15.sp,
            color: Colors.black),
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 8.h),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Description of Good",
                        style: TextStyle(fontSize: 15.sp, color: Colors.black),
                      ),
                      SizeBox.customHeight(10.h),
                      TextField(
                          keyboardType: TextInputType.multiline,
                          maxLines: 7,
                          minLines: 1,
                          decoration: InputDecoration(
                            hintText: "Enter Description of Good",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(9.r)),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NormalText(
                text: "Documents Upload", size: 25.sp, color: Colors.blueGrey)
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.only(left: 8.w, right: 10.w, top: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                NormalText(text: "VGM", size: 20.sp, color: Colors.blueGrey),
                Row(
                  children: [
                    Expanded(
                        child: ElevatedButton(
                      onPressed: () {
                        pickFile();
                      },
                      child: NormalText(
                          text: "Choose File",
                          size: 12.sp,
                          color: Colors.black),
                    )),
                    SizeBox.customWidth(5.w),
                    Expanded(
                        child: ElevatedButton(
                            onPressed: () {},
                            child: NormalText(
                                text: "Save",
                                size: 12.sp,
                                color: Colors.black))),
                    SizeBox.customWidth(5.w),
                    Expanded(
                        child: ElevatedButton(
                            onPressed: () {},
                            child: NormalText(
                                text: "Download",
                                size: 12.sp,
                                color: Colors.black))),
                  ],
                ),
                NormalText(
                    text: "Shipping Instruction (SI)",
                    size: 20.sp,
                    color: Colors.blueGrey),
                Row(
                  children: [
                    Expanded(
                        child: ElevatedButton(
                      onPressed: () {
                        pickFile();
                      },
                      child: NormalText(
                          text: "Choose File",
                          size: 12.sp,
                          color: Colors.black),
                    )),
                    SizeBox.customWidth(5.w),
                    Expanded(
                        child: ElevatedButton(
                            onPressed: () {},
                            child: NormalText(
                                text: "Save",
                                size: 12.sp,
                                color: Colors.black))),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Expanded(
                        child: ElevatedButton(
                            onPressed: () {},
                            child: NormalText(
                                text: "Download",
                                size: 12.sp,
                                color: Colors.black))),
                  ],
                ),
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: NormalText(
                          text: "Save", size: 15.sp, color: Colors.black),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      )
    ]);
  }
}

void pickFile() async {
  FilePickerResult? result = await FilePicker.platform
      .pickFiles(allowMultiple: true, dialogTitle: "FilePath");
  if (result == null) return;

  PlatformFile file = result.files.first;
  viewFile(file);
}

void viewFile(PlatformFile file) {
  OpenFile.open(file.path.toString());
}
