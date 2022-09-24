//
//  DetailView.swift
//  NetflixCloneApp
//
//  Created by 정명곤 on 2022/09/14.
//

import SwiftUI


struct DetailView: View {
    @State var selectedTab: DetailViewModel = .
    private var info: Contents
    
    init(_ info: Contents) {
        self.info = info
    }
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                ZStack(alignment: .topTrailing) {
                    
                    AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(info.backdrop_path!)")) { image in
                        image.resizable()
                            .frame(width: 378, height: 180, alignment: .center)
                            .aspectRatio(contentMode: .fill)
                    } placeholder: {
                        Rectangle()
                            .frame(width: 378, height: 180, alignment: .center)
                            .foregroundColor(.gray)
                    }
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
                            Text(info.title!)
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
                                Text(info.overview!)
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
            .ignoresSafeArea(.all)
            .background(.black)
        }
    }
}


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(Contents(id: 1, backdrop_path: "/jsoz1HlxczSuTx0mDl2h0lxy36l.jpg", title: "Thor: Love and Thunder", original_language: "en", original_title: "title", overview: "After his retirement is interrupted by Gorr the God Butcher, a galactic killer who seeks the extinction of the gods, Thor Odinson enlists the help of King Valkyrie, Korg, and ex-girlfriend Jane Foster, who now wields Mjolnir as the Mighty Thor. Together they embark upon a harrowing cosmic adventure to uncover the mystery of the God Butcher’s vengeance and stop him before it’s too late.", poster_path: "/pIkRyD18kl4FhoCNQuWxWu5cBLM.jpg", media_type: "movie", popularity: 1.23, release_date: "", vote_average: 1.23))
    }
}
