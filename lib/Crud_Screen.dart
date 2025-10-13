import 'package:crud/controller/product_controller.dart';
import 'package:crud/model/prodcut_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final ProductController productController= ProductController();
  void onTapALertDialog() {
    final TextEditingController productNameController = TextEditingController();
    final TextEditingController productQTYController = TextEditingController();
    final TextEditingController productIMGController = TextEditingController();
    final TextEditingController productUnitPriceController =
        TextEditingController();
    final TextEditingController productPriceController =
        TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text('Add Product'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: productNameController,
                decoration: InputDecoration(
                  fillColor: Colors.grey[100],
                  filled: true,
                  labelText: 'Product Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: productQTYController,
                decoration: InputDecoration(
                  fillColor: Colors.grey[100],
                  filled: true,
                  labelText: 'Product Quantity',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: productIMGController,
                decoration: InputDecoration(
                  fillColor: Colors.grey[100],
                  filled: true,
                  labelText: 'Product Image URL',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: productUnitPriceController,
                decoration: InputDecoration(
                  fillColor: Colors.grey[100],
                  filled: true,
                  labelText: 'Product unit price',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: productPriceController,
                decoration: InputDecoration(
                  fillColor: Colors.grey[100],
                  filled: true,
                  labelText: 'Product Price',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.cyan,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {},
              child: Text('Add', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }
@override
  void initState(){
    // TODO: implement initState
    super.initState();
    productController.getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text('CRUD Application', style: TextStyle(color: Colors.white)),
      ),
      body: Consumer<ProductController>(
        builder:(context,controller,child)=>Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
          child: GridView.builder(
            itemCount: productController.products.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.9,
            ),
            itemBuilder: (context, index) {
              var product = controller.products[index];
              return Container(
                height: 150,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                              'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?_gl=1*phz8zp*_ga*MTAwMjY0MzM3My4xNzU0OTg5ODI2*_ga_8JE65Q40S6*czE3NjAyNTAwMjckbzMkZzAkdDE3NjAyNTAwMjckajYwJGwwJGgw',
                            ),
                      ),
                    ),
                      Text(product.productName.toString()),
                     SizedBox(height: 10,),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text('Price: ${product.totalPrice.toString()} Tk'),
                         Text('QTY 8')
                       ],
                     ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
                          IconButton(onPressed: ()async{
                            await controller.deleteData(product.sId!);
                          }, icon: Icon(Icons.delete)),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyan,
        onPressed: () => onTapALertDialog(),
        child: Icon(Icons.add_circle_outline_sharp),
      ),
    );
  }
}
