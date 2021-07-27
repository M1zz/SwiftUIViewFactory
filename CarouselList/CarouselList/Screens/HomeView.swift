//
//  HomeView.swift
//  CarrouselList
//
//  Created by 이현호 on 2021/07/15.
//

import SwiftUI

struct HomeView: View {
    @State var searchText = ""
    @State private var isEditing = false
    
    @State var index = 0
    @State var columns = Array(repeating: GridItem(.flexible(), spacing: 15),
                               count: 2)
    @State var isSquare: Bool = false
    @State var searchResult:[Game]? = []
    @State var games:[Game]? = []
    @State var filteredGames:[Game]? = [] {
        didSet {
            if self.searchText != "" {
                games = filteredGames
            } else {
                games = searchResult
            }
        }
    }
    
    var body: some View {
        ScrollView(.vertical) {
            
            LazyVStack {
                HStack {
                    Text("Game Store")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                .padding(.horizontal)
                
                HStack {
                    
                    TextField("Search Keyword...", text: $searchText
                              , onEditingChanged: { body in
                                self.filteredGames = searchResult?.filter {$0.title.lowercased().contains(self.searchText)}
                                print("keyword : \(self.searchText)", self.filteredGames)
                              })
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(Color.black.opacity(0.1))
                        .cornerRadius(8)
                        .padding(.horizontal)
                        .padding(.top, 20)
                        .onTapGesture {
                            self.isEditing = true
                        }
                        .animation(.default)
                    
                    
                    if isEditing {
                        Button(action: {
                            games = searchResult
                            self.isEditing = false
                            self.searchText = ""
                            
                        }) {
                            Text("Cancel")
                        }
                        .padding(.trailing, 20)
                        .padding(.top, 20)
                        .transition(.move(edge: .trailing))
                        .animation(.default)
                    }
                }
                
                TabView(selection: $index) {
                    ForEach(0..<(games?.count ?? 0), id: \.self) { index in
                        if games?.count ?? 0 > 0 {
                            GameRemoteImage(urlString: games?[index].thumbnail ?? "")
                                .frame(height: self.index == index ? 230 : 180)
                                .cornerRadius(15)
                                .padding(.horizontal)
                                .tag(index)
                        }
                        
                    }
                }
                .frame(height: 230)
                .padding(.top, 25)
                .tabViewStyle(PageTabViewStyle())
                .animation(.easeOut)
                
                HStack {
                    Text("Popular")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Button {
                        withAnimation(.easeOut) {
                            if columns.count == 2 {
                                columns.removeLast()
                            } else {
                                columns.append(GridItem(.flexible(), spacing: 15))
                            }
                            isSquare.toggle()
                        }
                    } label: {
                        Image(systemName: isSquare ? "square.grid.2x2": "rectangle.grid.1x2")
                            .font(.system(size: 24))
                            .foregroundColor(.black)
                    }
                }
                .padding(.horizontal)
                .padding(.top, 25)
                
                LazyVGrid(columns: columns, spacing: 25) {
                    ForEach(games ?? []) { game in
                        GridView(game: game, columns: $columns)
                    }
                }
                .padding([.horizontal, .top])
            }
            .padding(.vertical)
        }
        .background(Color.black.opacity(0.05).edgesIgnoringSafeArea(.all))
        .onAppear {
            getGames()
        }
    }
    
    private func getGames() {
        NetworkManager.shared.getGames { (games, errorMessage) in
            DispatchQueue.main.async {
                searchResult = games
                self.games = searchResult
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
