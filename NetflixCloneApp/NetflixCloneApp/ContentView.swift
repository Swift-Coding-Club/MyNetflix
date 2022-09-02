
import SwiftUI
import TMDBSwift

struct ContentView: View {
    @ObservedObject var viewModel = MovieViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    MainHeaderView()
                        .onAppear {
                            viewModel.getTrandigMovies()
                        }
                    
                    ForEach(0..<5) { section in
                        VStack(alignment: .leading) {
                            Text("지난 1년간 공개된 콘텐츠")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.horizontal, 5)
                            
                            ScrollView(.horizontal) {
                                HStack{
                                    if let movies = viewModel.movies {
                                        ForEach(movies) { movie in
                                            
                                        }
                                    }
                                    ForEach(0..<10) { pic in
                                        Rectangle()
                                            .frame(width: 120, height: 180)
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
            .navigationTitle("Netflix")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
