import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class Order{
  DateTime _dt;
  String _description;
  double _total;

  Order(this._dt, this._description, this._total);

  double get total => _total;
  String get description => _description;
  DateTime get dt => _dt;
}

class Customer{
  String _name;
  String _location;
  List<Order> _orders;

  Customer(this._name, this._location, this._orders);

  List<Order> get orders => _orders;
  String get location => _location;
  String get name => _name;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePageWidget(),
    );
  }
}

class HomePageWidget extends StatelessWidget{
  final List<Customer> _customerList = [
    Customer('Bike Corp', 'Atlanta', [
      Order(DateTime(2018, 11, 17), 'Bicycle parts', 197.02),
      Order(DateTime(2018, 12, 1), 'Bicycle parts', 107.45)
    ]),

    Customer('Trust Corp', 'Atlanta', [
      Order(DateTime(2017, 1, 3), 'Shredder parts', 97.02),
      Order(DateTime(2018, 3, 13), 'Shredder blade', 7.45),
      Order(DateTime(2018, 5, 2), 'Shredder blade', 7.45),
    ]),

    Customer('Jilly Boutique', 'Birmingham', [
      Order(DateTime(2018, 1, 3), 'Display unit', 97.01),
      Order(DateTime(2018, 3, 3), 'Desk unit', 12.25),
      Order(DateTime(2018, 3, 21), 'Clothes rack', 97.15)
    ]),
  ];


  HomePageWidget({Key key}) : super(key: key);

  void navigateToCustomer(BuildContext context, Customer customer){
    Navigator.push(
      context, 
      MaterialPageRoute(builder: (context) => CustomerWidget(customer))
    );
  }

  ListTile createCustomerWidget(BuildContext context, Customer customer){
    return ListTile(
      title: Text(customer.name),
      subtitle: Text(customer._location),
      trailing: Icon(Icons.arrow_right),
      onTap: () => navigateToCustomer(context, customer),
    );
  }

  @override 
  Widget build(BuildContext context){
    List<Widget> customerList = List.from(_customerList.map((Customer customer) => createCustomerWidget(context, customer)));
    return Scaffold(
      appBar: AppBar(
        title: Text('Customers'),
      ),
      body: Center(
        child: ListView(
          children: customerList,
        ),
      ),
    );
  }
}

class CustomerWidget extends StatelessWidget{
  final Customer _customer;

  CustomerWidget(this._customer);

  void navigateToOrder(BuildContext context, Customer customer, Order order){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => OrderWidget(customer, order))
    );
  }

  ListTile createOrderListWidget(BuildContext context, Customer customer, Order order){
    return ListTile(
      title: Text(order.description),
      subtitle: Text('${order.dt.month}/${order.dt.day}/${order.dt.year}: \$${order.total}'),
      trailing: Icon(Icons.arrow_right),
      onTap: () => navigateToOrder(context, customer, order),
    );
  }

  @override 
  Widget build(BuildContext context){
    List<Widget> widgetList = List.from(_customer.orders.map((Order order) => createOrderListWidget(context, _customer, order)));
    widgetList.insert(
      0,
      Container(
        child: Column(
          children: <Widget>[
            Text(
              _customer.name,
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold
              ),
            ),

            Text(
              _customer.location,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold
              ),
            ),

            Text(
              '${_customer.orders.length}',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        padding: EdgeInsets.all(20.0),
      )
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Customer Info'),
      ),
      body: Center(
        child: ListView(
          children: widgetList,
        ),
      ),
    );
  }
}

class OrderWidget extends StatelessWidget{
  final Customer _customer;
  final Order _order;

  OrderWidget(this._customer, this._order);

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Info'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            Text(
              _customer.name,
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
            ),
            
            Text(
              _customer._location,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
            ),

            Text(''),

            Text(
              _order.description,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
            ),

            Text(
              '${_order.dt.month}/${_order.dt.day}/${_order.dt.year}: \$${_order.total}',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}