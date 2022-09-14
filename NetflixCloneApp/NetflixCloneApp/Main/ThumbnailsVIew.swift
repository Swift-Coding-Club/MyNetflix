//
//  ThumbnailsVIew.swift
//  NetflixCloneApp
//
//  Created by 정명곤 on 2022/09/14.
//

import SwiftUI

struct ThumbnailsVIew: View {
    @ObservedObject var viewModel: MovieViewModel = MovieViewModel()
    private var sectionTitle: String
    
    init(_ title: String) {
        self.sectionTitle = title
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(sectionTitle)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.horizontal, 5)
            
            ScrollView(.horizontal) {
                HStack{
                    ForEach(0..<7) { content in
                        Image("image")
                            .frame(width: 120, height: 180, alignment: .center)
                            .background(.gray)
                            .cornerRadius(9)
                            .aspectRatio(0.01, contentMode: .fill)
                        
                    }
                }
                
            }
        }
        .frame(height: 220)
        .background(.black)
        .onAppear{ viewModel.getUpcomingContents() }
    }
}


struct ThumbnailsVIew_Previews: PreviewProvider {
    static var previews: some View {
        ThumbnailsVIew("Section")
    }
}
