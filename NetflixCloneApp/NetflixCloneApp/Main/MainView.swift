
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
                            viewModel.getTrendigContents(media_type: Media.movie)
                        }
                        
                    ForEach(sectionTitle, id: \.self) { section in
                        VStack(alignment: .leading) {
                            Text(section)
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.horizontal, 5)
                            
                            ScrollView(.horizontal) {
                                HStack{
                                    if let contents = viewModel.contents {
                                        ForEach(contents) { content in
                                            
                                            
                                            
                                            
                                            
                                            
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
