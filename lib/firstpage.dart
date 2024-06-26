import 'package:flutter/material.dart';
import 'package:test_program/model/listmodel.dart';
import 'package:test_program/services/listservice.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  late Future<List<Data>> data;

  @override
  void initState() {
    super.initState();
    data = ListApi().listfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(backgroundColor: Colors.cyan,
        title:  Center(
          child: Text(
            'LIST',
            style: TextStyle(color: Colors.white),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor:Colors.cyanAccent,
                hintText: 'Search for Names',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),
          Expanded(
            child: Container(
              decoration: BoxDecoration(color: Colors.white,borderRadius:BorderRadius.only(topRight:Radius.circular(20),topLeft:Radius.circular(20))),
              child: FutureBuilder<List<Data>>(
                future: data,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: (){
                            
                          },
                          child:
                              Card(
                                margin: const EdgeInsets.all(8.0),
                                child: ListTile(
                                  title: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.network(
                                      "https://coinoneglobal.in/crm/${snapshot.data![index].imgUrlPath}",
                                      errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
                                    ),
                                  ),
                                  subtitle: Container(
                                    decoration:BoxDecoration(color: Colors.cyan,borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),bottomLeft: Radius.circular(10))),
                                    child: Center(
                                      child: Text(snapshot.data![index].name,style: TextStyle(fontSize: 15),),
                                    ),
                                  ),
                                ),
                              ),

                        );
                      },
                    );
                  } else {
                    return const Center(child: Text('No Data Available'));
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
