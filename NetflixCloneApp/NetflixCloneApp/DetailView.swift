//
//  DetailView.swift
//  NetflixCloneApp
//
//  Created by 정명곤 on 2022/09/14.
//

import SwiftUI


struct DetailView: View {
    private var info: [String]
    
    init(_ info: [String]) {
        self.info = info
    }
    
    var body: some View {
        ZStack {
            
            VStack(alignment: .leading) {
                ZStack(alignment: .topTrailing) {
                    Image("image")
                        .resizable()
                        .frame(width: 378, height: 200, alignment: .center)
                        .aspectRatio(0.1, contentMode: .fit)
                    HStack {
                        ZStack {
                            Circle()
                                .frame(width: 30, height: 30, alignment: .center)
                                .foregroundColor(.black)
                            Image(systemName: "tv")
                                .resizable()
                                .frame(width: 15, height: 15, alignment: .center)
                                .font(.headline)
                                .foregroundColor(.gray)
                        }
                        ZStack {
                            Circle()
                                .frame(width: 30, height: 30, alignment: .center)
                                .foregroundColor(.black)
                                .padding(.trailing)
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 12, height: 12, alignment: .center)
                                .padding(.trailing)
                                .font(.headline)
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.top, 10)
                    
                }
                ZStack(alignment: .topLeading) {
                    ScrollView() {
                        VStack(alignment: .leading) {
                            Text(info[0])
                                .foregroundColor(.white)
                                
                            HStack {
                                Text("New")
                                    .foregroundColor(.green)
                                
                                Text("1996")
                                    .foregroundColor(.white)
                                
                                Rectangle()
                                    .frame(width: 25, alignment: .center)
                                    .foregroundColor(.gray)
                                    .cornerRadius(2)
                                
                                Text("시즌 8개")
                                    .foregroundColor(.white)
                                
                                Text("HD")
                                    .frame(width: 30, alignment: .center)
                                    .foregroundColor(.gray)
                                    .font(.system(size: 15, weight: .bold))
                                    .border(.gray, width: 2)
                                    .cornerRadius(2)
                                
                            }
                            VStack {
                                
                                Button {
                                    print("재생")
                                } label: {
                                    HStack {
                                        Image(systemName: "play.fill")
                                            .font(.headline)
                                        Text("재생")
                                            .font(.headline)
                                    }
                                }
                                .foregroundColor(.black)
                                .frame(width: 378, height: 40, alignment: .center)
                                .background(.white)
                                .cornerRadius(9)
                                
                                Button {
                                    print("재생")
                                } label: {
                                    HStack {
                                        Image(systemName: "arrow.down.to.line.compact")
                                            .font(.headline)
                                        Text("저장")
                                            .font(.headline)
                                    }
                                    
                                }
                                .foregroundColor(.black)
                                .frame(width: 378, height: 40, alignment: .center)
                                .background(.gray)
                                .cornerRadius(9)
                                
                            }
                            
                            VStack(alignment: .leading) {
                                Text("this is contents")
                                    .foregroundColor(.white)
                                    .font(.headline)
                                
                                Text("출연: JMG")
                                    .foregroundColor(.gray)
                                    .font(.subheadline)
                                    .padding(.vertical, 10)
                            }
                            
                        }
                        .frame(width: 378, alignment: .center)
                    }
                    
                }
            }
        }
        .ignoresSafeArea(.all)
        .background(.black)
        
    }
        
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(["a"])
    }
}
