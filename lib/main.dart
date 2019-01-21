import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:online_shopping/bean/Product.dart';
import 'package:online_shopping/pages/product_details.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget image_carousel = new Container(
      height: 200.0,
      width: double.infinity,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          NetworkImage('https://picsum.photos/800/600?image=1002'),
          NetworkImage('https://picsum.photos/800/600?image=1004'),
          NetworkImage('https://picsum.photos/800/600?image=1006'),
        ],
        animationCurve: Curves.fastOutSlowIn,
        indicatorBgPadding: 10,
        dotSize: 4.0,
        autoplay: false,
        animationDuration: Duration(milliseconds: 1000),
      ),
    );
    Widget catagories = Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Catagories'),
        ),
        Container(
            height: 80.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Catagory(
                  imageLocation: Icon(Icons.account_balance),
                  imageCaption: 'City',
                ),
                Catagory(
                  imageLocation: Icon(Icons.account_balance),
                  imageCaption: 'City',
                ),
                Catagory(
                  imageLocation: Icon(Icons.account_balance),
                  imageCaption: 'City',
                ),
                Catagory(
                  imageLocation: Icon(Icons.account_balance),
                  imageCaption: 'City',
                ),
                Catagory(
                  imageLocation: Icon(Icons.account_balance),
                  imageCaption: 'City',
                ),
                Catagory(
                  imageLocation: Icon(Icons.account_balance),
                  imageCaption: 'City',
                ),
              ],
            ))
      ],
    );
    Widget products = Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(20.0),
          child: Text('Products'),
        ),
        Container(
          height: 220.0,
          child: Products(),
        )
      ],
    );
    return new Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.white70,
        elevation: 2.0,
        child: Container(
          height: 15.0,
          child: Row(
            children: <Widget>[
              Expanded(child: MaterialButton(onPressed: (){},child: Text('Explore'),)),
              Expanded(child: MaterialButton(onPressed: (){},child: Text('Home'),)),
              Expanded(child: MaterialButton(onPressed: (){},child: Text('Me'),)),

            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){},child: Icon(Icons.menu),),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      appBar: new AppBar(
        backgroundColor: Colors.redAccent,
        elevation: 1.5,
        title: Text('Online Shopping'),
        centerTitle: true,
        actions: <Widget>[
          new IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: null),
          new IconButton(
              icon: Icon(Icons.search, color: Colors.white), onPressed: null),
        ],
      ),
      body: ListView(
        children: <Widget>[image_carousel, catagories, products],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            //header
            UserAccountsDrawerHeader(
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person, color: Colors.white),
                ),
              ),
              accountName: Text('Samul Smith'),
              accountEmail: Text('feelingcxd@126.com'),
              decoration: new BoxDecoration(
                image: new DecorationImage(
                    image: NetworkImage(
                        'https://picsum.photos/800/450?random&&blur')),
              ),
            ),
            //Drawer body
            InkWell(
              onTap: () {},
              child: ListTile(
                leading: Icon(Icons.home),
                title: Text('Home Page'),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                leading: Icon(Icons.apps),
                title: Text('Catagories'),
              ),
            ),
            Divider(),
            InkWell(
              onTap: () {},
              child: ListTile(
                leading: Icon(Icons.help),
                title: Text('About'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Catagory extends StatelessWidget {
  final dynamic imageLocation;
  final String imageCaption;

  Catagory({this.imageLocation, this.imageCaption});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 100.0,
          child: ListTile(
            title: imageLocation,
            subtitle: Center(child: Text(imageCaption)),
          ),
        ),
      ),
    );
  }
}

// 产品列表 GridView
class Products extends StatefulWidget {
  @override
  _ProductsState createState() => new _ProductsState();
}

class _ProductsState extends State<Products> {
  var product_list = [
    new Product(
      'Ben',
      'https://picsum.photos/600/400?image=800',
       1000,
       899
    ),
  new Product(
      'Sam',
      'https://picsum.photos/600/400?image=802',
      800,
      699
  ),
  new Product(
      'William',
      'https://picsum.photos/600/400?image=804',
      3000,
      2999
  ),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (BuildContext context, int index) {
        return DisplayProduct(
          product: product_list[index],
        );
      },
      itemCount: product_list.length,
    );
  }
}

class DisplayProduct extends StatelessWidget {
  final Product product;


  DisplayProduct({this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: product.name,
        child: Material(
          child: InkWell(
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new ProductDetails(
              product: product,
            ))),
            child: GridTile(
              footer:  Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text(product.name,style: TextStyle(fontWeight: FontWeight.bold),),
                  title: Text('\$'+product.price.toString(),style: TextStyle(color: Colors.redAccent,fontWeight: FontWeight.w800),),
                  subtitle: Text('\$'+product.old_price.toString(),style: TextStyle(color: Colors.black54,fontWeight: FontWeight.w800,decoration: TextDecoration.lineThrough),),
                ),
              ),
              child: Image.network(product.picture,fit: BoxFit.cover,),
            ),
          ),
        ),
      ),
    );
  }
}


