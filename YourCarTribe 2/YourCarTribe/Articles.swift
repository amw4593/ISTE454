import SwiftUI

struct Article: Identifiable {
    var id = UUID()
    var title: String
    var author: String
    var rating: Int
    var excerpt: String
    var image: String
}

struct Articles: View {
    @State private var searchText = ""

    var sampleArticles = [
                Article(title: "Is a Lotus Elan Truly Magical?",
                        author: "Amrit Wanasundera",
                        rating: 3,
                        excerpt: "Many friendships have been put under strain when debating the “best handling sports car, ever.” A definitive answer is impossible because objective measures alone are insufficient for judgement. Subjective terms like “steering feel”, “pointiness” and more tend to muddy the waters. That said, there is little argument that modern cars have lost handling finesse due to electric steering, extra weight and overlarge wheels and tires.No less an authority as Gordon Murray, designer of the fabled McLaren F1 and the upcoming T50 supercar claims that the Lotus Elan stands as a true benchmark for supreme handling and responsiveness. So, having never had the privilege to drive an Elan, your humble scribe jumped at the chance when a well restored S3 Elan became available for sampling.",
                        image: "Lotus Elan"),
                Article(title: "Noble M12 GTO 3R",
                        author: "Amrit Wanasundera",
                        rating: 4,
                        excerpt: "Find out more about the Noble by clicking here.",
                        image: "Noble M12"),
                Article(
                    title: "The Pleasures of Driving Your Classic",
                    author: "Amrit Wanasundera",
                    rating: 4,
                    excerpt: "You do not need to go far to enjoy great roads wherever you may live. As the following video shows, the YCT teams enjoys a nice drive on scenic roads",
                    image: "Acura NSX"),
                Article(title: "YCT Top 5 Car Checklist",
                        author: "Amrit Wanasundera",
                        rating: 5,
                        excerpt: "Everyone's Top 5 is different, but no one can ever have too many lists. Let's take a gander at our for a minute.",
                        image: "Porsche 917"),
    ]

    @State private var articles: [Article]

    init() {
        articles = sampleArticles
    }

    var body: some View {
        NavigationView {
            List(articles) { article in
                NavigationLink(destination: ArticleDetailView(article: article)) {
                    ArticleRow(article: article)
                        .padding(.vertical, 8)
                }
            }
            .navigationTitle("Articles")
        }
    }
}

struct ArticleRow: View {
    var article: Article

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(article.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 150)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.black)
                        .opacity(0.2)
                )

            Text(article.title)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.primary)

            Text(article.author)
                .font(.subheadline)
                .foregroundColor(.gray)

            HStack {
                ForEach(1...article.rating, id: \.self) { _ in
                    Image(systemName: "star.fill")
                        .font(.caption)
                        .foregroundColor(.yellow)
                }
            }

            Text(article.excerpt)
                .font(.body)
                .foregroundColor(.secondary)
                .lineLimit(2)
        }
        .padding(.horizontal)
    }
}

struct ArticleDetailView: View {
    var article: Article

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Image(article.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)

                Text(article.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)

                Text(article.author)
                    .font(.subheadline)
                    .foregroundColor(.gray)

                HStack {
                    ForEach(1...article.rating, id: \.self) { _ in
                        Image(systemName: "star.fill")
                            .font(.caption)
                            .foregroundColor(.yellow)
                    }
                }

                Text(article.excerpt)
                    .font(.body)
                    .foregroundColor(.secondary)
            }
            .padding()
        }
        .navigationBarTitle("", displayMode: .inline)
    }
}

#Preview{
    Articles()
}
