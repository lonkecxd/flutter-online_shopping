import 'package:flutter/material.dart';
import 'package:online_shopping/bean/Product.dart';

class ProductDetails extends StatefulWidget {
  final Product product;

  ProductDetails({this.product});

  @override
  _ProductDetailsState createState() => new _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        children: <Widget>[
          Container(
            height: 300.0,
            child: GridTile(
              child: Hero(
                tag: widget.product.name,
                child: Container(
                  child: Image.network(widget.product.picture),
                ),
              ),
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text(
                    widget.product.name,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                  title: Row(
                    children: <Widget>[
                      Expanded(
                          child: Text(widget.product.old_price.toString())),
                      Expanded(child: Text(widget.product.price.toString()))
                    ],
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Size'),
                            content: Text('Choose the size'),
                            actions: <Widget>[
                              MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop(context);
                                },
                                child: Text('close'),
                              )
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: Text('Size')),
                      Expanded(child: Icon(Icons.arrow_drop_down)),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Color'),
                            content: Text('Choose the color'),
                            actions: <Widget>[
                              MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop(context);
                                },
                                child: Text('close'),
                              )
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: Text('Color')),
                      Expanded(child: Icon(Icons.arrow_drop_down)),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Qty'),
                            content: Text('Choose the Qty'),
                            actions: <Widget>[
                              MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop(context);
                                },
                                child: Text('close'),
                              )
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: Text('Qty')),
                      Expanded(child: Icon(Icons.arrow_drop_down)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.red,
                  textColor: Colors.white70,
                  elevation: 0.2,
                  child: Text('Buy Now'),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.add_shopping_cart,
                  color: Colors.red,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.favorite_border,
                  color: Colors.red,
                ),
                onPressed: () {},
              )
            ],
          ),
          Divider(),
          ListTile(
            title: Text('Product Details'),
            subtitle: Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
          ),
          Divider(),
          Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),child: Text('Product Name',style: TextStyle(color: Colors.grey),),),
              Padding(padding: const EdgeInsets.all(5.0),child: Text(widget.product.name),)
            ],
          ),
          Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),child: Text('Product Brand',style: TextStyle(color: Colors.grey),),),
              Padding(padding: const EdgeInsets.all(5.0),child: Text('Brand X'),)
            ],
          ),
          Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),child: Text('Product Condition',style: TextStyle(color: Colors.grey),),),
              Padding(padding: const EdgeInsets.all(5.0),child: Text('New'),)
            ],
          ),
          Divider(),
          Padding(padding: const EdgeInsets.all(15.0),child: Text('Similar Products',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0),),),
          Container(
            height: 250.0,
            child: Products(),
          )
        ],
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
    );
  }
}

