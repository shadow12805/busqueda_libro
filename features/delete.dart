import '../models/books.dart';
import '../utils/valodation.dart';

// ============================================
// PERSONA 3: ELIMINAR LIBRO
// ============================================

class Persona3Eliminar {
  final List<Libro> books;

  Persona3Eliminar(this.books);

  void ejecutar() {
    print("\n--- ELIMINAR LIBRO ---");

    if (books.isEmpty) {
      print("\n⚠️  No hay libros para eliminar.\n");
      return;
    }

    // Mostrar libros disponibles
    print("\n📖 Libros disponibles:");
    print("-" * 45);
    for (int i = 0; i < books.length; i++) {
      print(" [$i] ${books[i]}");
    }

    // Solicitar índice
    final indice = Validaciones.leerEntero("\nIngrese el índice del libro a eliminar: ");
    if (indice == null) return;
    if (!Validaciones.indiceValido(indice, books.length)) return;

    final libro = books[indice];
    print("\n📖 Libro a eliminar: ${libro.titulo} | ${libro.autor} | ${libro.anio}");

    // Confirmación para evitar eliminaciones accidentales
    final confirmado = Validaciones.confirmar("¿Estás seguro de eliminar este libro?");

    if (confirmado) {
      books.removeAt(indice);
      print("\n✅ Libro eliminado exitosamente.\n");
    } else {
      print("\n❌ Operación cancelada. El libro no fue eliminado.\n");
    }
  }
}