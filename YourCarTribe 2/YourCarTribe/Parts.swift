import SwiftUI

struct Part: Identifiable {
    var id = UUID()
    var title: String
    var author: String
    var price: String
    var excerpt: String
    var image: String
}

struct Parts: View {
    @State private var searchText = ""
    var sampleArticles = [

                Part(title: "Porsche Steering Wheel",
                        author: "Dharshan Wanasundera",
                        price: "$0.00",
                        excerpt: "Used Porsche Cayman R Steering Wheel",
                        image: "Wheel"),
                Part(title: "EK10 Civic Coilovers by HyperStreet",
                        author: "Dharshan Wanasundera",
                        price: "$399.99",
                        excerpt: "Seller Does Not Accept Returns",
                        image: "Suspension"),
                Part(
                    title: "Car Jump Starter",
                    author: "Dharshan Wanasundera",
                    price: "$47.89",
                    excerpt: "Seller Does not Accept Returns",
                    image: "Car Battery"),
                Part(
                    title: "Wheel Seal Motorcraft BRS-88",
                        author: "Dharshan Wanasundera",
                        price: "$22.92",
                     excerpt: "Seller Does Not Accept Returns", image: "Seal"
                )

    ]
    @State private var filteredArticles: [Part]

    init() {
        _filteredArticles = State(initialValue: sampleArticles)
    }

    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText, placeholder: "Search Parts")

                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                    ForEach(filteredArticles) { article in
                        NavigationLink(destination: PartDetailView(article: article)) {
                            PartGridView(articles: article)
                        }
                    }
                }
                .padding()
                .navigationTitle("Car Parts")
            }
        }
    }
}

struct PartGridView: View {
    var articles: Part

    var body: some View {
        VStack {
            Image(articles.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 150)
                .cornerRadius(10)
                .overlay(
                    Rectangle()
                        .foregroundColor(.black)
                        .cornerRadius(10)
                        .opacity(0.2)
                )

            Text(articles.title)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.top, 8)

            Text(articles.price)
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.top, 4)
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 2)
    }
}

struct PartDetailView: View {
    var article: Part

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Image(article.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
                .padding(.bottom, 16)

            Text(article.title)
                .font(.title)
                .fontWeight(.bold)

            Text(article.author)
                .font(.subheadline)
                .foregroundColor(.gray)

            Text(article.price)
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.top, 4)

            Text(article.excerpt)
                .font(.body)
                .foregroundColor(.gray)
                .padding(.top, 8)
        }
        .padding()
        .navigationBarTitle("", displayMode: .inline)
    }
}

struct SearchBar: View {
    @Binding var text: String
    var placeholder: String

    var body: some View {
        HStack {
            TextField(placeholder, text: $text)
                .padding(8)
                .background(Color(.systemGray6))
                .cornerRadius(10)

            if !text.isEmpty {
                Button(action: {
                    withAnimation {
                        text = ""
                    }
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                }
                .padding(.trailing, 8)
                .transition(.move(edge: .trailing))
            }
        }
        .padding(.horizontal)
        .padding(.top, 8)
    }
}

#Preview {
    Parts()
}

