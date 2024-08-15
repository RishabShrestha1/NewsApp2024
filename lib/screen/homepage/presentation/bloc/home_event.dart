abstract class NewsEvent {}

class FetchNews extends NewsEvent {}

class FetchNewsByCategory extends NewsEvent {
  final String category;
  FetchNewsByCategory(this.category);
}
