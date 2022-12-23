import 'package:doctor_appointment_app/cells/category_cell.dart';
import 'package:doctor_appointment_app/cells/hd_cell.dart';
import 'package:doctor_appointment_app/cells/trd_cell.dart';
import 'package:doctor_appointment_app/models/category.dart';
import 'package:doctor_appointment_app/models/doctor.dart';
import 'package:doctor_appointment_app/pages/detail_page.dart';
import 'package:doctor_appointment_app/utils/custom_icons_icons.dart';
import 'package:doctor_appointment_app/utils/he_color.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Clinic> _hClinics = List<Clinic>();
  List<Category> _categories = List<Category>();
  List<Clinic> _trClinics = List<Clinic>();

  /// **********************************************
  /// ACTIONS
  /// **********************************************

  _onCellTap(Clinic clinic) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailPage(clinic: clinic),
        ));
  }

  /// **********************************************
  /// LIFE CYCLE METHODS
  /// **********************************************

  @override
  void initState() {
    super.initState();
    _hClinics = _getHClinics();
    _categories = _getCategories();
    _trClinics = _getTRClinics();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 32,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  _hClinicsSection(), //input field
                ],
              ),
            ),
            Padding(
              //description
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              child: Column(
                children: [
                  Text(
                    'Based on 2022 in HealthCare industry, there were only bla bas bla bla bal bal',
                    style: TextStyle(
                      backgroundColor: HexColor('#EDFDFA'),
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _categorySection(), //category section
                  SizedBox(
                    height: 32,
                  ),
                  _trClinicsSection(), // top rated section
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// **********************************************
  /// WIDGETS
  /// **********************************************

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: HexColor('#00C6AD'),
      elevation: 0,
      iconTheme: IconThemeData(color: HexColor('#150047')),
      leading: IconButton(
        icon: Icon(
          CustomIcons.menu,
          size: 14,
        ),
        onPressed: () => Navigator.pop(context), //back to login page
      ),
    );
  }

  /// Highlighted Clinics Section
  SizedBox _hClinicsSection() {
    return SizedBox(
      height: 100,
      width: 200,
      child: TextFormField(
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Enter your location',
        ),
      ),

      // child: ListView.separated(
      //   primary: false,
      //   shrinkWrap: true,
      //   scrollDirection: Axis.horizontal,
      //   padding: EdgeInsets.symmetric(horizontal: 24),
      //   itemCount: _hClinics.length,
      //   separatorBuilder: (BuildContext context, int index) =>
      //       Divider(indent: 16),
      //   itemBuilder: (BuildContext context, int index) => HDCell(
      //     clinic: _hClinics[index],
      //     onTap: () => _onCellTap(_hClinics[index]),
      //   ),
      // ),
    );
  }

  /// Category Section
  Column _categorySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Categories',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(
          height: 32,
        ),
        SizedBox(
          height: 100,
          child: ListView.separated(
            primary: false,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: _categories.length,
            separatorBuilder: (BuildContext context, int index) =>
                Divider(indent: 16),
            itemBuilder: (BuildContext context, int index) => CategoryCell(
              category: _categories[index],
              onTap: () => _onCellTap(_hClinics[index]),
            ), //go to categories page
          ),
        ),
      ],
    );
  }

  /// Top Rated Clinics Section
  Row _trClinicsSection() {
    return Row(
      children: [
        Expanded(
          /*1*/
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /*2*/
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: const Text(
                  'Detail of the application',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        /*3*/
        Icon(
          Icons.circle,
          color: Colors.red[500],
        ),
        Icon(
          Icons.circle,
          color: Colors.red[500],
        ),
      ],
    );
  }

  /// **********************************************
  /// DUMMY DATA
  /// **********************************************

  /// Get Highlighted Clinic List
  List<Clinic> _getHClinics() {
    List<Clinic> hClinics = List<Clinic>();

    hClinics.add(Clinic(
      firstName: 'X-ray',
      lastName: '',
      image: 'albert.png',
      type: 'Kidney',
      rating: 4.5,
    ));
    hClinics.add(Clinic(
      firstName: 'Hemodialysis',
      lastName: '',
      image: 'albert.png',
      type: 'Kidney',
      rating: 4.5,
    ));
    hClinics.add(Clinic(
      firstName: 'Blood Test',
      lastName: '',
      image: 'albert.png',
      type: 'Kidney',
      rating: 4.5,
    ));

    return hClinics;
  }

  /// Get Categories
  List<Category> _getCategories() {
    List<Category> categories = List<Category>();
    categories.add(Category(
      icon: CustomIcons.eyes,
      title: 'X-ray',
    ));
    categories.add(Category(
      icon: CustomIcons.cardiologist,
      title: 'Hemodialysis',
    ));
    categories.add(Category(
      icon: CustomIcons.pediatrician,
      title: 'Blood Test',
    ));
    return categories;
  }

  /// Get Top Rated Clinics List
  List<Clinic> _getTRClinics() {
    List<Clinic> trClinics = List<Clinic>();

    trClinics.add(Clinic(
      firstName: 'Mathew',
      lastName: 'Chambers',
      image: 'mathew.png',
      type: 'Bone',
      rating: 4.3,
    ));
    trClinics.add(Clinic(
        firstName: 'Cherly',
        lastName: 'Bishop',
        image: 'cherly.png',
        type: 'Kidney',
        rating: 4.7));
    trClinics.add(Clinic(
        firstName: 'Albert',
        lastName: 'Alexander',
        image: 'albert.png',
        type: 'Kidney',
        rating: 4.3));
    trClinics.add(Clinic(
      firstName: 'Elisa',
      lastName: 'Rose',
      image: 'albert.png',
      type: 'Kidney',
      rating: 4.5,
    ));
    return trClinics;
  }
}
