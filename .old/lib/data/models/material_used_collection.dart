// class MaterialUsedCollection {
//   final String name;
//   final String partNumber;
//
//   MaterialUsedCollection({required this.name, required this.partNumber});
//
//   factory MaterialUsedCollection.empty() {
//     return MaterialUsedCollection(
//       name: '',
//       partNumber: '',
//     );
//   }
//
//   MaterialUsedCollection copyWith({
//     String? name,
//     String? partNumber,
//   }) {
//     return MaterialUsedCollection(
//       name: name ?? this.name,
//       partNumber: partNumber ?? this.partNumber,
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return <String, dynamic>{
//       'name': name,
//       'partNumber': partNumber,
//     };
//   }
//
//   factory MaterialUsedCollection.fromJson(Map<String, dynamic> map) {
//     return MaterialUsedCollection(
//       name: map['name'] ?? "",
//       partNumber: map['partNumber'] ?? "",
//     );
//   }
// }
