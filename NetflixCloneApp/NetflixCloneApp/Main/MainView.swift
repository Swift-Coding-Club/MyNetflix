
import SwiftUI
import URLImage

struct MainView: View {
    @ObservedObject var viewModel = MovieViewModel()
    private let sectionTitle = ["몰아보기 추천! 긴장감 넘치는 해외 시리즈", "지금 뜨는 콘텐츠", "넷플릭스 인기 콘텐츠"]
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    MainHeaderView()
                        .onAppear {
                            viewModel.getTrandigMovies()
                        }
                        
                        
                    
                    ForEach (sectionTitle, id: \.self) { section in
                        VStack(alignment: .leading) {
                            Text(section)
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.horizontal, 5)
                            
                            ScrollView(.horizontal) {
                                HStack{
                                    if let movies = viewModel.movies {
                                        ForEach(movies) { movie in
                                            
                                            
                                            let url = URL(string:"https://image.tmdb.org/t/p/w500\(movie.poster_path!)")
                                            
                                            AsyncImage(url: url) { image in
                                                image
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fill)
                                                
                                            } placeholder: {
                                                Color.gray
                                            }
                                                .frame(width: 120, height: 180)
                                            
                                        }
                                    }
                                }
                            }
                            .frame(height: 180)
                            .foregroundColor(.green)
                        }
                    }
                    
                }
                .background(.black)
            }
            .ignoresSafeArea(.all, edges: .top)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
