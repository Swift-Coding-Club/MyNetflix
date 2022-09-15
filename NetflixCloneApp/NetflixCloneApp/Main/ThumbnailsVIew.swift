//
//  ThumbnailsVIew.swift
//  NetflixCloneApp
//
//  Created by 정명곤 on 2022/09/14.
//

import SwiftUI
import SDWebImage

struct ThumbnailsVIew: View {
    @State private var isPresented = false
    @ObservedObject var viewModel = MovieViewModel()
    
    private var sectionTitle: String
    private var contents: [Contents]? = [Contents]()
    
    init(_ title: String, _ section: Int) {
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
                    ForEach(0..<3) { content in
                        Group {
                            Button {
                                self.isPresented = true
                            } label: {
                                Image("image")
                                    .resizable()
                                    .frame(width: 120)
                            }
                            .sheet(isPresented: self.$isPresented) {
                                DetailView(["A"])
                            }
                            
                        }
                    }
                }
                
            }
        }
        .frame(height: 220)
        .background(.black)
    }
}


struct ThumbnailsVIew_Previews: PreviewProvider {
    static var previews: some View {
        ThumbnailsVIew("Section", 0)
    }
}
