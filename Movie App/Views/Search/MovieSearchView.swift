//
//  MovieSearchView.swift
//  Movie App
//
//  Created by Ahmet Bostanci on 9.05.2025.
//

import SwiftUI

struct MovieSearchView: View {
    
    @ObservedObject var movieServiceState = MovieSearchState ()
    
    var body: some View {
        NavigationView {
            List {
                Group {
                    SearchBarView(placeholder: "Search movies", text: $movieServiceState.query)
                        .listRowInsets(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                    
                    LoadingView(isLoading: movieServiceState.isLoading, error: movieServiceState.error) {
                        movieServiceState.search(query: movieServiceState.query)
                    }
                    
                    if self.movieServiceState.movies != nil {
                        ForEach(movieServiceState.movies!) { movie in
                            NavigationLink(destination: MovieDetailView(movieId: movie.id)) {
                                VStack(alignment: .leading) {
                                    Text(movie.title)
                                    Text(movie.yearText)
                                }
                            }
                        }
                    }
                }
                .listRowSeparator(.hidden)
            }
            .onAppear {
                movieServiceState.startObserve()
            }
            .navigationTitle("Search")
            .listStyle(PlainListStyle())
        }
    }
}

#Preview {
    MovieSearchView()
}
