import UIKit

enum AppConfiguration: CaseIterable {
    static var allCases: [AppConfiguration] {
        return [.firstCase("https://swapi.dev/api/people/8"), .secondCase("https://swapi.dev/api/starships/3"),
            .thirdCase("https://swapi.dev/api/planets/5")]
    }
    
    case firstCase(String)
    case secondCase(String)
    case thirdCase(String)

    @available(*, unavailable)
    case all
}

struct NetworkManager {
    
    static func request(for configuration: AppConfiguration) {
        
    }
}

