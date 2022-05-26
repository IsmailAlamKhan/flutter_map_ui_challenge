//  {
//         "id": "kNPN3c-8-2sC",
//         "title": "Fibrilación y flutter auricular",
//         "authors": [
//             "Julián Pérez Villacastín",
//             "Josep Lluís Mont Girbau"
//         ],
//         "publisher": "MARGE BOOKS",
//         "publishedDate": "2007-03-01",
//         "description": "Esta obra coordinada por el doctor Lluís Mont y el doctor Julián Pérez Villascastín es un título de la colección «Arritmias y estimulación cardíaca » cuya finalidad es difundir el conocimiento sobre las técnicas más novedosas y los últimos avances en el tratamiento de diversas patologías. El objetivo de la obra Fibrilación y flutter auricular es contribuir a la difusión didáctica y asequible de los conocimientos más novedosos en este campo para que el lector pueda hallar en sus páginas una herramienta práctica para el tratamiento de esta patología. El Dr. Lluís Mont i Girbau es jefe de la Sección de Arritmias del Institut del Tòrax y del Hospital Clínic de Barcelona. El Dr. Julián Pérez-Villacastín es jefe de la Unidad de Arritmias del Instituto Cardiovascular y del Hospital Clínico San Carlos de Madrid.",
//         "language": "es",
//         "smallThumbnail": "http://books.google.com/books/content?id=kNPN3c-8-2sC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api",
//         "thumbnail": "http://books.google.com/books/content?id=kNPN3c-8-2sC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api",
//         "previewLink": "http://books.google.com.mx/books?id=kNPN3c-8-2sC&pg=PA185&dq=flutter&hl=&cd=1&source=gbs_api",
//         "infoLink": "https://play.google.com/store/books/details?id=kNPN3c-8-2sC&source=gbs_api",
//         "canonicalVolumeLink": "https://play.google.com/store/books/details?id=kNPN3c-8-2sC"
//     },

import 'package:freezed_annotation/freezed_annotation.dart';

part 'book.freezed.dart';
part 'book.g.dart';

@freezed
class Book with _$Book {
  const factory Book({
    required String id,
    required String title,
    required List<String>? authors,
    required String? publisher,
    required String? publishedDate,
    required String? description,
    required String language,
    required String smallThumbnail,
    required String thumbnail,
    required String previewLink,
    required String infoLink,
    required String canonicalVolumeLink,
  }) = _Book;

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
}
