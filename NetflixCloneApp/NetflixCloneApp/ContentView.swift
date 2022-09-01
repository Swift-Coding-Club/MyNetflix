
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            NavigationView {
                Image(systemName: "plus")
                    .navigationTitle("Netflix")
            }
            .frame(width: .infinity, height: 200)
            
            MainHeaderView()
            VStack(alignment: .leading) {
                Text("지난 1년간 공개된 콘텐츠")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.horizontal, 5)
                
                ScrollView(.horizontal) {
                    HStack{
                        ForEach(0..<10) { pic in
                            Rectangle()
                                .frame(width: 120, height: 180)
                        }
                        
                    }
                }
                .frame(width: .infinity, height: 180)
                .foregroundColor(.green)
            }
            
            VStack(alignment: .leading) {
                Text("지금 뜨는 콘텐츠")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.horizontal, 5)
                
                ScrollView(.horizontal) {
                    HStack{
                        ForEach(0..<10) { pic in
                            Rectangle()
                                .frame(width: 120, height: 180)
                        }
                        
                    }
                }
                .frame(width: .infinity, height: 180)
                .foregroundColor(.green)
            }
            
        }
        .background(.black)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
