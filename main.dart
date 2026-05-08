import 'dart:io';
import 'models/books.dart';
import 'features/add.dart';
//import 'features/persona2_listar.dart';
//import 'features/persona2_buscar.dart';
import 'features/update.dart';
import 'features/delete.dart';

// ============================================
// PUNTO DE ENTRADA PRINCIPAL
// ============================================

void main() {
  List<Libro> books = [];
  int option = 0;

  // Instanciar features
  final persona1 = Persona1Agregar(books);
  //final persona2Listar = Persona2Listar(books);
  //final persona2Buscar = Persona2Buscar(books);
  final persona3Actualizar = Persona3Actualizar(books);
  final persona3Eliminar = Persona3Eliminar(books);

  do {
    print("\n" + "=" * 45);
    print("📚 MENÚ - GESTIÓN DE LIBROS");
    print("=" * 45);
    print("1. Agregar libro.        [Persona 1]");
    print("2. Listar libros.        [Persona 2]");
    print("3. Buscar libro.         [Persona 2]");
    print("4. Actualizar libro.     [Persona 3]");
    print("5. Eliminar libro.       [Persona 3]");
    print("6. Salir.");
    print("=" * 45);
    stdout.write("Seleccione una opción: ");

    final entrada = stdin.readLineSync();
    option = int.tryParse(entrada ?? '') ?? -1;

    switch (option) {
      case 1:
        persona1.ejecutar();
        break;
      case 2:
        //persona2Listar.ejecutar();
        break;
      case 3:
        //persona2Buscar.ejecutar();
        break;
      case 4:
        persona3Actualizar.ejecutar();  // ⭐ TU PARTE
        break;
      case 5:
        persona3Eliminar.ejecutar();    // ⭐ TU PARTE
        break;
      case 6:
        print("\n👋 Saliendo del programa...\n");
        break;
      default:
        print("\n❌ Opción no válida. Por favor, intente de nuevo.\n");
    }

  } while (option != 6);
}