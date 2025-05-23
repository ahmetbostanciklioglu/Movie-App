//
//  SafariView.swift
//  Movie App
//
//  Created by Ahmet Bostanci on 9.05.2025.
//

import SafariServices
import SwiftUI

struct SafariView: UIViewControllerRepresentable {
    
    let url: URL
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) { }
    
    func makeUIViewController(context: Context) -> SFSafariViewController {
        let safariVC = SFSafariViewController(url: self.url)
        return safariVC
    }
}
