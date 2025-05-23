//
//  LoadingView.swift
//  Movie App
//
//  Created by Ahmet Bostanci on 9.05.2025.
//

import SwiftUI

struct LoadingView: View {
    
    let isLoading: Bool
    let error: NSError?
    let retryAction: (() -> ())?
    
    var body: some View {
        if isLoading {
            HStack {
                Spacer()
                ActivityIndicatorView()
                Spacer()
            }
        } else if error != nil {
            Group {
                if isLoading {
                    HStack {
                        Spacer()
                        ActivityIndicatorView()
                        Spacer()
                    }
                } else if error != nil {
                    HStack {
                        Spacer()
                        VStack(spacing: 4) {
                            Text(error!.localizedDescription).font(.headline)
                            
                            if self.retryAction != nil {
                                Button(action: self.retryAction!) {
                                    Text("Retry")
                                }
                                .foregroundColor(Color.blue)
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                        Spacer()
                    }
                }
            }
        }
    }
}

#Preview {
    LoadingView(isLoading: true, error: nil, retryAction: nil)
}
