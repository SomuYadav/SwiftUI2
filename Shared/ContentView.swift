import SwiftUI

struct Posts: View {
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 40) {
                StoryLineView()
                ForEach(Post.posts) { post in
                    PostView(post: post)
                }
            }
            .padding(.vertical)
        }
    }
}

struct StoryLineView: View {
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false) {
            HStack(spacing: 20) {
                StoryView(index: 0)
                ForEach(1..<Image.postImages.count) { index in
                    StoryView(index: index)
                }
            }
            .padding(.horizontal)
        }
    }
}


struct ContentView: View {
    var body: some View {
        NavigationView {
            Posts()
            .navigationTitle("Instant Post")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}

