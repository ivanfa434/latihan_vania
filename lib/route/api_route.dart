import 'package:latihan_vania/app/http/controllers/product_controller.dart';
import 'package:vania/vania.dart';

class ApiRoute implements Route {
  @override
  void register() {
    Router.basePrefix('api');

    Router.post('/product', productController.create);
    Router.get('/product', productController.show);
    Router.put('/product/{id}', productController.update);
    Router.delete('/product/{id}', productController.destroy);
  }
}