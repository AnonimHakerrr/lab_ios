import Foundation

@MainActor
class JokeViewModel: ObservableObject {
    @Published var iconName: String? = "hand.thumbsup"
    @Published var jokeText: String = "Натисніть кнопку, щоб отримати жарт!"
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    // Переконайтесь, що назва класу тут правильна
    private let apiService = ChuckNorrisService()
    
    // Функція тепер асинхронна
    func loadNewJoke() async {
        isLoading = true
        errorMessage = nil
        
        // Використовуємо do-catch для обробки помилок
        do {
            // "Чекаємо" на результат від сервісу
            let joke = try await apiService.fetchRandomJoke()
            self.jokeText = joke.value
            self.iconName = joke.icon_url
        } catch {
            // Якщо була помилка, вона потрапить сюди
            self.errorMessage = "Помилка завантаження: \(error.localizedDescription)"
        }
        
        // Цей код виконається лише після завершення do-catch
        self.isLoading = false
    }
}
