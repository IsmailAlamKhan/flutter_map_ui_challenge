import 'package:freezed_annotation/freezed_annotation.dart';

part 'adventure_item.freezed.dart';
part 'adventure_item.g.dart';
// {
//     "image": "burj_khalifa.jpg",
//     "name": "Burj Khalifa",
//     "location": "Dubai",
//     "title": "The Burj Khalifa",
//     "description": "Veniam deleniti quod perferendis impedit consequatur sit laboriosam consequatur. Commodi ex quia eaque aut molestias minima quis expedita voluptatum. Ut blanditiis corrupti. Sint porro voluptatibus. Quia voluptatem rerum enim. Minima ad eos quae id sit quia eligendi nisi. Unde amet et quis accusamus autem. Error quis voluptas ullam quo quis totam et. Voluptatem atque alias natus reprehenderit blanditiis. Possimus voluptatibus non doloribus corporis.Praesentium illo voluptatum et est vel voluptas ad sunt consequuntur. Consequatur labore est sint a dolor laudantium. Eos consequuntur facere laboriosam consequatur eum sed cumque. Ut eius dolorum odit nihil est. Et optio deserunt est repudiandae ullam optio quia aperiam qui."
//   },

@freezed
class AdventureItem with _$AdventureItem {
  const AdventureItem._();
  factory AdventureItem({
    required String image,
    required String name,
    required String location,
    required String title,
    required String description,
  }) = _AdventureItem;

  String get imageUrl => 'assets/images/$image';

  factory AdventureItem.fromJson(Map<String, dynamic> json) => _$AdventureItemFromJson(json);
}
