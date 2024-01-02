import SwiftUI

struct Car: Identifiable {
    var id = UUID()
    var title: String
    var subtitle: String
    var price: String
    var excerpt: String
    var image: String
}

struct Cars: View {
    @State private var searchText = ""
    
    var sampleArticles = [
        Car(title: "1987 Porsche 928 S",
            subtitle: "New Caanan, CT",
            price: "$57000",
                excerpt: "Porsche 928 with a 5.4 Litre Engine. Powerhouse representing the best of Stuttgart.",
                image: "Porsche 928S"),
        Car(title: "Test Car Ad",
            subtitle: "Test Car, Ad",
            price: "$24,500",
                excerpt: "Used as a test car for future models ",
                image: "Test Car"),
        Car(title: "2000 Mercedes CLK",
            subtitle: "Moonachie, NJ",
            price: "$16995",
            excerpt: "Perfect First clasic? Well , Automatic, well trimmed,  understated styling, need I go on?",
            image: "Mercedes CLK"),
        Car(title: "1983 Porsche 928",
            subtitle: "New Canaan, CT",
            price: "$34000",
            excerpt: "Series 1 example that is getting rarer and rarer",
            image: "Porsche 928")
                ]
    @State private var articles: [Car]
    
    init() {
        articles = sampleArticles
    }
    
    var body: some View {
    NavigationStack {
        List(articles.indices) { index in
            FullCarRow(articles: articles[index])
        }
        }
    }
}
#Preview {
    Cars()
}

struct FullCarRow: View {
    @State private var show = false
    var articles: Car
    var body: some View {
            VStack {
                
                Image(articles.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .padding()
                    .frame(height: 200)
                    .cornerRadius(10)
                    .overlay(
                        Rectangle()
                            .foregroundColor(.black)
                            .cornerRadius(10)
                            .opacity(0.2)
                    )
                    .overlay(
                        Text(articles.title)
                            .font(.system(.title))
                            .fontWeight(.black)
                            .foregroundColor(.white)
                            .font(.system(.largeTitle, design: .rounded))
                            .bold()
                            .foregroundColor(.white)
                    )
                        Text(articles.subtitle)
                            .font(.system(.title))
                            .fontWeight(.black)
                            .foregroundColor(.black)
                            .font(.system(.title, design: .rounded))
                            .bold()
                            .foregroundColor(.white)

                if show {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 300, height: 300)
                        .foregroundColor(.white)
                        .overlay(
                            Text(articles.excerpt)
                                .font(.system(.title2, design: .rounded))
                                .foregroundColor(.gray)
                                .font(.system(.largeTitle, design: .rounded))
                                .bold()
                                .foregroundColor(.white)
                        )
                        .transition(.scaleAndOffset)
                    Text(articles.price)
                        .font(.system(.title2, design: .rounded))
                        .foregroundColor(.gray)
                        .font(.system(.largeTitle, design: .rounded))
                        .bold()
                        .foregroundColor(.white)
                }
            }
            .navigationTitle("Cars")
            .onTapGesture {
                withAnimation(.spring()) {
                    show.toggle()
                }
            }
        }
    }

    extension AnyTransition {
        static var offsetScaleOpacity: AnyTransition {
            .offset(x: -600, y:0).combined(with: .scale).combined(with: .opacity)
        }
        static var scaleAndOffset: AnyTransition {
            .asymmetric(insertion: .scale(scale: 0, anchor: .bottom), removal: .offset(x: -600, y: 0))
        }
    }
