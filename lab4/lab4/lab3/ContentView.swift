
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Button(action: {}, label: {
            Image(systemName: "suit.heart.fill")
            .font(.system(size: 20, weight: .bold))
            .foregroundColor(.red)})
            
        }
        .padding()
        
    }
}

#Preview {
    ContentView()
}
