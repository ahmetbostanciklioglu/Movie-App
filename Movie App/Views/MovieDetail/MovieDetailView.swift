//
//  MovieDetailView.swift
//  Movie App
//
//  Created by Ahmet Bostanci on 9.05.2025.
//

import SwiftUI

struct MovieDetailView: View {
    
    let movieId: Int
    @ObservedObject private var movieDetailState = MovieDetailState()
    
    var body: some View {
        ZStack {
            LoadingView(isLoading: self.movieDetailState.isLoading, error: self.movieDetailState.error) {
                self.movieDetailState.loadMovie(id: self.movieId)
            }
            
            if movieDetailState.movie != nil {
                MovieDetailListView(movie: self.movieDetailState.movie!)
            }
        }
        .navigationTitle(movieDetailState.movie?.title ?? "")
        .onAppear {
            self.movieDetailState.loadMovie(id: self.movieId)
        }
    }
}

#Preview {
    MovieDetailView(movieId: Movie.stubbedMovie.id)
}
