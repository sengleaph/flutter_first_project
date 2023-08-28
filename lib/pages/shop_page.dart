import 'package:flutter/material.dart';
import 'package:flutter01/components/coffee_tile.dart';

// import 'package:flutter/cupertino.dart';
import 'package:flutter01/models/coffee.dart';
import 'package:flutter01/models/coffee_shop.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {

  //add coffee to cart
  void addToCart(Coffee coffee){
  //add coffee to cart
  Provider.of<CoffeeShop> (context, listen: false).addItemToCart(coffee);

  //let user know it add been successfully added
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title:  Text("Successfully Added to cart"),
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
        builder: (context,value,child)=>SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children:[
              const Text(
                "how would you like your coffee?",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height:25),
              // list of coffee to buy
              Expanded(
                  child: ListView.builder(
                    itemCount: value.coffeeShop.length,
                     itemBuilder: (context,index){
                    // get individual coffee
                    Coffee eachCoffee = value.coffeeShop[index];
                    //return the tile for this coffee
                    return CoffeeTile(
                    coffee: eachCoffee,
                      icon: Icon(Icons.add),
                      onpressed: () => addToCart(eachCoffee),
                    );
                  },
                ),
              ),
            ],
          )
        )
        )
    );


  }
}
