// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, avoid_print

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foods/src/utils/app_colors.dart';
import 'package:foods/src/utils/dimensions.dart';
import 'package:foods/src/widgets/app_column.dart';
import 'package:foods/src/widgets/big_text.dart';
import 'package:foods/src/widgets/icons_and_text_widget.dart';
import 'package:foods/src/widgets/small_text.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

class AddFoodPage extends StatefulWidget {
  final String? mealCode;
  final String? name;
  final String? category;
  final String? description;
  final String? image;
  final double? price;

  const AddFoodPage({
    Key? key,
    this.mealCode,
    this.name,
    this.category,
    this.description,
    this.image,
    this.price,
  }) : super(key: key);

  @override
  _AddFoodPageState createState() => _AddFoodPageState();
}

class _AddFoodPageState extends State<AddFoodPage> {
  late TextEditingController _mealCodeController;
  late TextEditingController _nameController;
  late TextEditingController _categoryController;
  late TextEditingController _descriptionController;
  late TextEditingController _priceController;
  String? _image;
  int _selectedIndex = 2;

  @override
  void initState() {
    super.initState();
    _mealCodeController = TextEditingController(text: widget.mealCode);
    _nameController = TextEditingController(text: widget.name);
    _categoryController = TextEditingController(text: widget.category);
    _descriptionController = TextEditingController(text: widget.description);
    _priceController =
        TextEditingController(text: widget.price?.toString() ?? '');
    _image = widget.image;
  }

  @override
  void dispose() {
    _mealCodeController.dispose();
    _nameController.dispose();
    _categoryController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  void _onItemTapped(BuildContext context, int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RestaurantMealsGrid1()),
      );
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RestaurantOrders()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('    Add Meal'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _mealCodeController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Meal Code',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _nameController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _categoryController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Category',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _descriptionController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _priceController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Price',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              _buildImagePicker(context),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  _saveMeal(context);
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Color.fromARGB(155, 8, 150, 81),
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text(
                  'Save',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 0,
        selectedFontSize: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showUnselectedLabels: false,
        showSelectedLabels: false,
        elevation: 0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add Meals',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) => _onItemTapped(context, index),
      ),
    );
  }

  void _saveMeal(BuildContext context) async {
    String mealCode = _mealCodeController.text;
    String name = _nameController.text;
    String category = _categoryController.text;
    String description = _descriptionController.text;
    double price = double.tryParse(_priceController.text) ?? 0.0;

    if (_image != null) {
      String imageName = basename(_image!);
      Reference firebaseStorageRef =
          FirebaseStorage.instance.ref().child('mealImages/$imageName');
      UploadTask uploadTask = firebaseStorageRef.putFile(File(_image!));

      uploadTask.snapshotEvents.listen((TaskSnapshot taskSnapshot) async {
        switch (taskSnapshot.state) {
          case TaskState.success:
            String downloadURL = await firebaseStorageRef.getDownloadURL();
            print("Download URL: $downloadURL");
            _saveToFirestore(context, mealCode, name, category, description,
                price, downloadURL);
            break;
          case TaskState.running:
            print("Upload is still running...");
            break;
          default:
            print("Error uploading file");
        }
      });
    } else {
      _saveToFirestore(
          context, mealCode, name, category, description, price, null);
    }
  }

  void _saveToFirestore(
      BuildContext context,
      String mealCode,
      String name,
      String category,
      String description,
      double price,
      String? downloadURL) async {
    if (widget.mealCode != null) {
      // Update meal logic
    } else {
      // Add meal logic
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('meals')
          .where('mealCode', isEqualTo: mealCode)
          .get();
      if (querySnapshot.docs.isEmpty) {
        FirebaseFirestore.instance.collection('meals').add({
          'userId': FirebaseAuth.instance.currentUser!.uid,
          'mealCode': mealCode,
          'name': name,
          'category': category,
          'description': description,
          'price': price,
          'imageURL': downloadURL,
        }).then((value) {
          print('Meal added successfully!');
          Navigator.pop(context);
        }).catchError((error) {
          print('Failed to add meal: $error');
        });
      } else {
        print('Meal code must be unique!');
      }
    }
  }

  Widget _buildImagePicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Meal Picture',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8.0),
        GestureDetector(
          onTap: () {
            _showImagePicker(context);
          },
          child: Container(
            width: 120.0,
            height: 120.0,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: _image != null
                ? Image.file(
                    File(_image!),
                    fit: BoxFit.cover,
                  )
                : Icon(
                    Icons.camera_alt,
                    size: 40.0,
                  ),
          ),
        ),
      ],
    );
  }

  Future<void> _showImagePicker(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = pickedFile.path;
      });
    }
  }
}

class RestaurantOrders extends StatefulWidget {
  @override
  _RestaurantOrdersState createState() => _RestaurantOrdersState();
}

class _RestaurantOrdersState extends State<RestaurantOrders> {
  List<Map<String, dynamic>> _orders = [];

  @override
  void initState() {
    super.initState();
    _fetchOrders();
  }

  void _fetchOrders() async {
    // Get the logged-in user ID (restaurant)
    final String? userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId != null) {
      // Assuming a collection named 'orders' with a 'restaurantId' field
      final snapshot = await FirebaseFirestore.instance
          .collection('orders')
          .where('restaurantId', isEqualTo: userId)
          .get();
      setState(() {
        _orders = snapshot.docs
            .map((doc) => doc.data() as Map<String, dynamic>)
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Restaurant Orders'),
        ),
        body: Column(
          children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream:
                    FirebaseFirestore.instance.collection('orders').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  }
                  final orders = snapshot.data!.docs;
                  return ListView.builder(
                    itemCount: orders.length,
                    itemBuilder: (context, index) {
                      final order =
                          orders[index].data() as Map<String, dynamic>;
                      final orderId = orders[index].id;
                      final orderName = order['mealName'] ??
                          ''; // Provide default value for null
                      final orderStatus = order['status'] ??
                          ''; // Provide default value for null
                      final deliveryMethod = order['deliveryMethod'] ??
                          ''; // Provide default value for null
                      final dateUploaded = (order['dateUploaded'] as Timestamp)
                          .toDate()
                          .toString();
                      final mealCode = order['mealCode'] ??
                          ''; // Provide default value for null
                      return _buildOrderListTile(context, orderId, orderName,
                          orderStatus, deliveryMethod, dateUploaded, mealCode);
                    },
                  );
                },
              ),
            ),
          ],
        ));
  }

  ListTile _buildOrderListTile(
      BuildContext context,
      String orderId,
      String orderName,
      String orderStatus,
      String deliveryMethod,
      String dateUploaded,
      String mealCode) {
    return ListTile(
      title: Text('$orderName - $deliveryMethod'),
      subtitle: Text(orderStatus),
      onTap: () {
        _showOrderDetails(context, orderId, orderName, orderStatus,
            deliveryMethod, dateUploaded, mealCode);
      },
    );
  }

  void _showOrderDetails(
      BuildContext context,
      String orderId,
      String orderName,
      String orderStatus,
      String deliveryMethod,
      String dateUploaded,
      String mealCode) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Order Details'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Order No: $orderId'),
              Text('Meal Name: $orderName'),
              Text('Delivery Method: $deliveryMethod'),
              Text('Order Status: $orderStatus'),
              Text('Date Uploaded: $dateUploaded'),
              Text('Meal Code: $mealCode'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}

Widget _buildOrderCard(Map<String, dynamic> order) {
  // Implement logic to display order details here (e.g., order ID, customer details, items, total price, status)
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Order ID: ${order['orderId'] ?? 'N/A'}', // Handle case where orderId is null
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          // Add widgets to display other order details as needed
        ],
      ),
    ),
  );
}

class RestaurantMealsGrid extends StatefulWidget {
  @override
  _RestaurantMealsGridState createState() => _RestaurantMealsGridState();
}

class _RestaurantMealsGridState extends State<RestaurantMealsGrid> {
  List<Map<String, dynamic>> _meals = [];

  @override
  void initState() {
    super.initState();
    _fetchMeals();
  }

  void _fetchMeals() async {
    // Get the logged-in user ID
    final String? userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId != null) {
      final snapshot = await FirebaseFirestore.instance
          .collection('meals')
          .where('userId', isEqualTo: userId)
          .get();
      setState(() {
        _meals = snapshot.docs
            .map((doc) => doc.data() as Map<String, dynamic>)
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurant Meals'),
      ),
      body: GridView.count(
        crossAxisCount: 2, // Adjust number of columns as needed
        childAspectRatio: 1.2, // Adjust aspect ratio for card size
        children: _meals.map((meal) => _buildMealCard(meal)).toList(),
      ),
    );
  }

  Widget _buildMealCard(Map<String, dynamic> meal) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              meal['imageURL'] ?? '', // Handle case where imageURL is null
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 8.0),
            Text(
              meal['name'],
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            Text(
              '\$${meal['price']?.toStringAsFixed(2)}', // Format price with 2 decimals
              style: TextStyle(fontSize: 14.0),
            ),
          ],
        ),
      ),
    );
  }
}

class RestaurantMealsGrid1 extends StatefulWidget {
  @override
  _RestaurantMealsGrid1State createState() => _RestaurantMealsGrid1State();
}

class _RestaurantMealsGrid1State extends State<RestaurantMealsGrid1> {
  List<Map<String, dynamic>> _meals = [];

  @override
  void initState() {
    super.initState();
    _fetchMeals();
  }

  void _fetchMeals() async {
    // Get the logged-in user ID
    final String? userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId != null) {
      final snapshot = await FirebaseFirestore.instance
          .collection('meals')
          .where('userId', isEqualTo: userId)
          .get();
      setState(() {
        _meals = snapshot.docs
            .map((doc) => doc.data() as Map<String, dynamic>)
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Restaurant Meals'),
        ),
        body: _buildListView(_meals));

    //_meals.map((meal) => _buildListView(_meal)).toList(),

    // children: _meals.map((meal) => _buildListView(meal)).toList(),
  }

//   Widget _buildMealCard(List<Map<String, dynamic>> meals) {
//     return Card(
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Image.network(
//               meals['imageURL'] ?? '', // Handle case where imageURL is null
//               height: 100,
//               width: double.infinity,
//               fit: BoxFit.cover,
//             ),
//             SizedBox(height: 8.0),
//             Text(
//               meal['name'],
//               style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
//             ),
//             Text(
//               '\$${meal['price']?.toStringAsFixed(2)}', // Format price with 2 decimals
//               style: TextStyle(fontSize: 14.0),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

  Widget _buildListView(List<Map<String, dynamic>> meals) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: meals.length,
        itemBuilder: ((context, index) {
          return GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                  bottom: Dimensions.height10),
              child: Row(
                children: [
                  //image section in a row
                  Container(
                      height: Dimensions.ListViewImgSize,
                      width: Dimensions.ListViewImgSize,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20),
                        color: Colors.white30,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            meals[index]['imageURL'] ?? '',
                          ),
                        ),
                      ))
                  //text container
                  ,
                  Expanded(
                    child: Container(
                        height: Dimensions.ListViewtextContSize,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(
                              Dimensions.radius20,
                            ),
                            bottomRight: Radius.circular(Dimensions.radius20),
                          ),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: Dimensions.width10,
                              right: Dimensions.width10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BigText(
                                text: meals[index]['name'],
                                size: Dimensions.font16,
                              ),
                              SizedBox(
                                height: Dimensions.height10,
                              ),
                              SmallText(text: meals[index]['description']),
                              SizedBox(
                                height: Dimensions.height10,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: Dimensions.width10,
                                  ),
                                  SmallText(
                                      text:
                                          '\$${meals[index]['price']?.toStringAsFixed(2)}'),
                                  SizedBox(
                                    width: Dimensions.width10,
                                  ),
                                  SmallText(text: "1287"),
                                  SizedBox(
                                    width: Dimensions.width10,
                                  ),
                                  SmallText(text: "Comments"),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconAndtextWidget(
                                      icon: Icons.circle_sharp,
                                      text: "Normal",
                                      iconColor: AppColors.iconColor1),
                                  IconAndtextWidget(
                                      icon: Icons.location_on,
                                      text: "1.8km",
                                      iconColor: AppColors.mainColor),
                                  IconAndtextWidget(
                                      icon: Icons.access_time_rounded,
                                      text: "32min",
                                      iconColor: AppColors.iconColor2),
                                ],
                              )
                            ],
                          ),
                        )),
                  ),
                ],
              ),
            ),
          );
        }));
  }
}
