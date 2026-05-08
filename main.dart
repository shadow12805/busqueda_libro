import 'dart:io';
void main() {
  List<String> books = [];
  int option = 0;
do{
  print("MENU");
  print("1. Agregar libro.");
  print("2. Listar libros.");
  print("3. Buscar por índice y por nombre del libro.");
  print("4. Actualizar lista.");
  print("5. Eliminar libro.");
  print("6. Salir.");
  option = int.parse(stdin.readLineSync()!);

  switch(option){
      case 1:
        print("Ingrese el nombre del libro:");
        String name = stdin.readLineSync()!;
        print("Ingrese el autor del libro:");
        String author = stdin.readLineSync()!;
        print("Ingrese el año de publicación del libro:");
        int year = int.parse(stdin.readLineSync()!);
        // Agregar libro a la lista
        books.add("$name, $author, $year");
        break;
      case 2:
      // Listar libros
      print(books);
      break;
    case 3:
      // Buscar por índice y por nombre del libro
      break;
      case 4:
        // Actualizar lista
        break;
      case 5:
        // Eliminar libro
        print("Libros disponibles:");
        for (int i = 0; i < books.length; i++) {
          print("$i: ${books[i]}");
        }
        print("Ingrese el nombre del libro a eliminar:");
        String RemoveLibro = stdin.readLineSync()!;
        books.removeWhere((book) => book.contains(RemoveLibro));
        break;
        
        case 6:
        print("Saliendo del programa...");
        break;
      default:
        print("Opción no válida. Por favor, intente de nuevo.");
    }
  }while(option != 6);
}