import UIKit

class Checker {
    static let shared: Checker = {
        let instance = Checker()
        return instance
    }()
    
    private init() {}
    
    let login: String = "BlackCat"
    let password: String = "12345"
    
    func check(usersLogin: String, usersPassword: String) -> Bool {
        guard usersLogin == login && usersPassword == password else {
            return false
        }
        return true
    }
    
}

extension Checker: NSCopying {
    func copy(with zone: NSZone? = nil) -> Any {
        return self
    }
}
