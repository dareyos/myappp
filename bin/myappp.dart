// кол-во продуктов в наличии
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

void main(List<String> arguments) async { // программа начинает выполняться после того как все зарегистрированные зависимости загрузятся
  final url = Uri.https( // из строк ниже мы собираем URL
    'dummyjson.com',
    '/products',
  );
  final response = await http.get(url); // отправляем запрос
  
  Map<String, dynamic> jsonData = convert.jsonDecode(response.body); // преобразовываем JSON в массив 
 //map(ключ, значение) функция которая не мутирует массив а возвращает итератор(новый массив)

  List<dynamic> products = jsonData["products"]; // массив продуктов
  int sum = 0; // сумма кол-ва продуктов

  List<int> instock = products.map((p) => p["stock"] as int).toList(); // массив кол-ва продуктов в наличии
  
  sum = instock.reduce((acc, p) => acc + p); // сумма кол-ва продуктов в наличии
  print("in stock: $sum"); // в консоль выведет кол-во продуктов
}
 