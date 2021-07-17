//
//  GridView.swift
//  CarrouselList
//
//  Created by 이현호 on 2021/07/15.
//

import SwiftUI

struct GridView: View {
    
    var game: Game
    @Binding var columns: [GridItem]
    @Namespace var namespace
    @State var isLiked: Bool = false
    
    var body: some View {
        VStack {
            if columns.count == 2 {
                VStack(spacing: 15) {
                    ZStack(alignment: Alignment(horizontal: .trailing,
                                                vertical: .top)) {
                        GameRemoteImage(urlString: game.thumbnail)
                            .aspectRatio(contentMode: .fill)
                            .frame(width: (UIScreen.main.bounds.width - 45) / 2,
                                   height: 250)
                            .cornerRadius(15)
                        
                        Button {
                            isLiked.toggle()
                        } label: {
                            Image(systemName: isLiked ? "heart.fill" : "heart")
                                .foregroundColor(.red)
                                .padding(.all, 6)
                                .background(Color.white)
                                .clipShape(Circle())
                        }
                        .padding(.all, 10)
                    }
                    .matchedGeometryEffect(id: "image", in: namespace)
                    
                    Text(game.title)
                        .fontWeight(.bold)
                        .lineLimit(1)
                        .matchedGeometryEffect(id: "title", in: namespace)
                    
                    Button {
                        
                    } label : {
                        Text("Read more")
                            .foregroundColor(.white)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 25)
                            .background(Color.red)
                            .cornerRadius(10)
                    }
                    .matchedGeometryEffect(id: "more", in: namespace)
                }
            } else {
                HStack(spacing: 15) {
                    ZStack(alignment: Alignment(horizontal: .trailing,
                                                vertical: .top)) {
                        Image("thumbnail")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: (UIScreen.main.bounds.width - 45) / 2,
                                   height: 250)
                            .cornerRadius(15)
                            
                        Button {
                            isLiked.toggle()
                        } label: {
                            Image(systemName: isLiked ? "heart.fill" : "heart")
                                .foregroundColor(.red)
                                .padding(.all, 6)
                                .background(Color.white)
                                .clipShape(Circle())
                        }
                        .padding(.all, 10)
                    }
                    .matchedGeometryEffect(id: "image", in: namespace)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text(game.title)
                            .fontWeight(.bold)
                            .matchedGeometryEffect(id: "title", in: namespace)
                        
                        HStack(spacing: 10) {
                            ForEach(1...5, id: \.self) { rating in
                                Image(systemName: "star.fill")
                                    .foregroundColor(game.rating >= rating ? .yellow : .gray)
                                
                            }
                            Spacer(minLength: 0)
                        }
                        
                        Button {
                            
                        } label : {
                            Text("Read more")
                                .foregroundColor(.white)
                                .padding(.vertical, 10)
                                .padding(.horizontal, 25)
                                .background(Color.red)
                                .cornerRadius(10)
                        }
                        .matchedGeometryEffect(id: "more", in: namespace)
                    }
                }
                .padding(.trailing)
                .background(Color.white)
                .cornerRadius(15)
            }
            
        }
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView(game: MockData.sampleGame1,
                 columns: .constant(Array(repeating: GridItem(.flexible(), spacing: 15),
                                          count: 2)))
    }
}
