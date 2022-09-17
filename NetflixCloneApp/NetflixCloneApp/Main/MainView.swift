
import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel = MovieViewModel()
    @State var isPresented = false
    
    private let sectionTitle = ["몰아보기 추천! 긴장감 넘치는 해외 시리즈", "지금 뜨는 콘텐츠", "넷플릭스 인기 콘텐츠"]
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .center) {
                ScrollView() {
                    MainHeaderView()
                        
                    VStack(alignment: .leading) {
                        Text(sectionTitle[0])
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.horizontal, 5)
                            
                        
                        ScrollView(.horizontal) {
                            HStack{
                                ForEach(viewModel.contents ?? []) { content in
                                    Group {
                                        Button {
                                            self.isPresented = true
                                        } label: {
                                            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(content.poster_path!)")) { image in
                                                image.resizable()
                                            } placeholder: {
                                                Rectangle()
                                                    .frame(width: 120, height: 180, alignment: .center)
                                                    .foregroundColor(.gray)
                                            }
                                                .frame(width: 120, height: 180, alignment: .center)
                                        }
                                        .sheet(isPresented: self.$isPresented) {
                                            DetailView(content)
                                        }

                                        
                                            
                                    }
                                }
                            }
                            
                        }
                    }
                    .frame(height: 220)
                    .background(.black)
                    
                    
                }
                .background(.black)
            }
            .ignoresSafeArea(.all, edges: .top)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .background(.black)
        .onAppear{viewModel.getTrendigContents()}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
