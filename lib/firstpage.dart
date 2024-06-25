import 'package:flutter/material.dart';

class firstpage extends StatefulWidget {
  const firstpage({super.key});

  @override
  State<firstpage> createState() => _firstpageState();
}

class _firstpageState extends State<firstpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'LIST',
          style: TextStyle(color: Colors.orange),
        ),
        actions: [
          IconButton(onPressed:(){
            Navigator.pop(context);
          }, icon: Icon(
           Icons.logout,
           color: Colors.orange,
          ))
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for Names',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Food>>(
              future: data,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  var filteredData = snapshot.data!
                      .where((food) => food.type.toLowerCase() == label1.toLowerCase())
                      .toList();
                  print(filteredData);
                  if (filteredData.isEmpty) {
                    return Center(child: Text('No Food for this category'));
                  }
                  return ListView.builder(
                    itemCount: filteredData.length,
                    itemBuilder: (context, index) {
                      return FoodCard(
                        food: filteredData[index],
                        addBookedFood: addBookedFood, // Pass the addBookedFood method to FoodCard
                      );
                    },
                  );
                } else {
                  return Center(child: Text('No Food available'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
