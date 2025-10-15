import SwiftUI

/**
 * Головний екран додатку, що відображає жарти.
 * Підписаний на зміни в JokeViewModel і оновлює свій UI відповідно.
 */
struct ContentView: View {
    
    // @StateObject створює та керує життєвим циклом ViewModel
    @StateObject private var viewModel = JokeViewModel()
    
    var body: some View {
        ZStack {
            // Фон для кращого вигляду
            LinearGradient(
                gradient: Gradient(colors: [Color.green, Color.yellow]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack(spacing: 30) {
                AsyncImage(url: URL(string: viewModel.iconName ?? "")) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                } placeholder: {
                    
                    ProgressView()
                }
                Text("🤠 Жарти про Чака Норріса")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .shadow(radius: 2)
                
                // Основний блок для відображення жарту або завантажувача
                ZStack(alignment: .center) {
                    Text(viewModel.jokeText)
                        .font(.title3)
                        .fontWeight(.medium)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                        .padding(30)
                        .frame(maxWidth: .infinity, minHeight: 200)
                        .background(.ultraThinMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .opacity(viewModel.isLoading ? 0.5 : 1)
                    
                    if viewModel.isLoading {
                        ProgressView()
                            .scaleEffect(2)
                            .tint(.white)
                    }
                }
                Button(action: {
                    Task {
                        await viewModel.loadNewJoke()
                    }
                }) {
                    Text("Отримати новий жарт!")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.indigo)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.white)
                        .cornerRadius(15)
                        .shadow(color: .black.opacity(0.2), radius: 5, y: 5)
                }
                .disabled(viewModel.isLoading)
                
                if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .font(.footnote)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding()
                        .background(.red.opacity(0.8))
                        .cornerRadius(10)
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
