//
//  DetailContentsView.swift
//  NetflixCloneApp
//
//  Created by 정명곤 on 2022/09/22.
//

import SwiftUI

struct DetailContentsView: View {
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            HStack {
                VStack {
                    Capsule()
                        .foregroundColor(.red)
                        .frame(height: 8)
                    Text("회차")
                        .font(.system(size: 20).bold())
                        .foregroundColor(.white)
                    
                }
                VStack {
                    Capsule()
                        .foregroundColor(.red)
                        .frame(height: 8)
                    Text("함께 시청된 콘텐츠")
                        .font(.system(size: 20).bold())
                        .foregroundColor(.white)
                    
                }
                
            }
        }
    }
}

struct DetailContentsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailContentsView()
    }
}
