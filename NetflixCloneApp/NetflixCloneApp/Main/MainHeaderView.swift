
import SwiftUI

struct MainHeaderView: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack {
                Image("image")
                    .resizable()
                    .frame(height: 600, alignment: .top)
                    .aspectRatio(0.6, contentMode: .fill)
                    
                LinearGradient(gradient: Gradient(colors: [.clear, .black]), startPoint: .top, endPoint: .bottom)
            }
                
                
                
            HStack(alignment: .center, content: {
                
                VStack(alignment: .center, spacing: -1, content: {
                    Button {
                        print("+")
                    } label: {
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .font(.system(size: 25))
                    }
                    
                    
                    Button(action: {
                        print("A")
                    }, label: {
                        Text("내가 찜한 콘텐츠")
                            .fontWeight(.bold)
                            .font(.system(size: 15))
                    })
                    .frame(width: 120, height: 50, alignment: .center)
                    .foregroundColor(.white)
                    .padding(-5)
                })
                Spacer()
                
                ZStack(alignment: .center) {
                    Rectangle()
                        .frame(width: 100, height: 40)
                        .foregroundColor(.white)
                        .cornerRadius(3)
                    HStack {
                        Image(systemName: "play.fill")
                            .foregroundColor(.black)
                        Text("재생")
                            .font(.body)
                    }
                    
                }
                Spacer()
                
                VStack(alignment: .center, spacing: -1, content: {
                    Button {
                        print("+")
                    } label: {
                        Image(systemName: "info.circle")
                            .foregroundColor(.white)
                            .font(.system(size: 25))
                            
                    }
                    
                    
                    Button(action: {
                        print("A")
                    }, label: {
                        Text("정보")
                            .fontWeight(.bold)
                            .font(.system(size: 15))
                    })
                    .frame(width: 120, height: 50, alignment: .center)
                    .foregroundColor(.white)
                    .padding(-10)
                })
                
                
                
            })
            .padding(.horizontal)
            .background(.clear)
        }
    }
}

struct MainHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        MainHeaderView()
    }
}
