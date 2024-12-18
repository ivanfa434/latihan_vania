import 'dart:io';
import 'package:vania/vania.dart';
import 'create_users_table.dart';
import 'create_product_table.dart';
import 'create_items_table.dart';
import 'create_todos_table.dart';
import 'orderitems.dart';
import 'orders.dart';
import 'product.dart';
import 'productnotes.dart';
import 'vendors.dart';

void main(List<String> args) async {
  await MigrationConnection().setup();
  if (args.isNotEmpty && args.first.toLowerCase() == "migrate:fresh") {
    await Migrate().dropTables();
  } else {
    await Migrate().registry();
  }
  await MigrationConnection().closeConnection();
  exit(0);
}

class Migrate {
  registry() async {
		 await CreateUserTable().up();
		 await CreateProductTable().up();
		 await CreateItemsTable().up();
		 await CreateTodosTable().up();
		 await Orderitems().up();
		 await Orders().up();
		 await Product().up();
		 await Productnotes().up();
		 await Vendors().up();
	}

  dropTables() async {
		 await Vendors().down();
		 await Productnotes().down();
		 await Product().down();
		 await Orders().down();
		 await Orderitems().down();
		 await CreateTodosTable().down();
		 await CreateItemsTable().down();
		 await CreateProductTable().down();
		 await CreateUserTable().down();
	 }
}
