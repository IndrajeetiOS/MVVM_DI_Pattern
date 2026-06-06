//
//  ContentView.swift
//  MVVM_DI_Pattern
//
//  Created by Indra on 06/06/26.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = CommentsViewModel()    
    var body: some View {
        NavigationStack {
            List(viewModel.comments) { comment in
                VStack(alignment: .leading, spacing: 8) {
                    Text(comment.user.fullName)
                        .font(.headline)
                    Text("@\(comment.user.username)")
                        .font(.caption)
                        .foregroundColor(.gray)
                    Text(comment.body)
                        .font(.body)
                    HStack {
                        Text("❤️ \(comment.likes)")
                        Spacer()
                        Text("Post ID: \(comment.postId)")
                    }
                    .font(.caption)
                    .foregroundColor(.secondary)
                }
                .padding(.vertical, 4)
            }
            .navigationTitle("Comments")
            .navigationBarTitleDisplayMode(.inline)
            .task {
                await viewModel.loadComments()
            }
        }
    }
}

#Preview {
    ContentView()
}
