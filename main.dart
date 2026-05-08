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
        if (books.isEmpty) {
          print(" No hay libros para buscar.");
          break;
        }
        print("\nBuscar por:");
        print("1. Índice");
        print("2. Nombre del libro");
        stdout.write("Seleccione método: ");
        String? searchType = stdin.readLineSync();
        
        if (searchType == "1") {
          stdout.write("Ingrese el índice (0 a ${books.length - 1}): ");
          String? idxInput = stdin.readLineSync();
          int idx = int.tryParse(idxInput ?? '') ?? -1;
          
          if (idx >= 0 && idx < books.length) {
            print(" Encontrado: [$idx] ${books[idx]}");
          } else {
            print(" Índice fuera de rango.");
          }
        } else if (searchType == "2") {
          stdout.write("Ingrese nombre o parte del nombre a buscar: ");
          String searchName = (stdin.readLineSync() ?? "").toLowerCase();
          
          List<String> found = books.where((b) => 
            b.toLowerCase().contains(searchName)
          ).toList();
          
          if (found.isEmpty) {
            print(" No se encontraron coincidencias.");
          } else {
            print(" Coincidencias encontradas:");
            for (var book in found) {
              print("  • $book");
            }
          }
        } else {
          print("Opción de búsqueda no válida.");
        }
        break;
      case 4:
        // Actualizar lista
        if (books.isEmpty) {
          print(" No hay libros para actualizar.");
          break;
        }
        print("\n Libros disponibles:");
        for (int i = 0; i < books.length; i++) {
          print("  [$i] ${books[i]}");
        }
        stdout.write("Ingrese el índice del libro a actualizar: ");
        String? updInput = stdin.readLineSync();
        int updIdx = int.tryParse(updInput ?? '') ?? -1;
        
        if (updIdx < 0 || updIdx >= books.length) {
          print(" Índice inválido.");
          break;
        }
        
        print("Libro actual: ${books[updIdx]}");
        stdout.write("Nuevo nombre: ");
        String newName = stdin.readLineSync() ?? "";
        stdout.write("Nuevo autor: ");
        String newAuthor = stdin.readLineSync() ?? "";
        stdout.write("Nuevo año: ");
        String? newYearInput = stdin.readLineSync();
        int newYear = int.tryParse(newYearInput ?? '') ?? 0;
        
        if (newName.isNotEmpty && newAuthor.isNotEmpty && newYear > 0) {
          books[updIdx] = "$newName | $newAuthor | $newYear";
          print(" Libro actualizado.");
        } else {
          print(" Datos incompletos. No se actualizó.");
        }
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