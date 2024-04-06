import UIKit

protocol UserService {
    func userAutorization(usersLogin: String) -> User?
}

public class CurrentUserService: UserService {
    
    let user: User
    
    func userAutorization(usersLogin: String) -> User? {
        
        guard usersLogin == user.usersLogin else {
            return nil
        }
        return user
    }
    
    init(user: User) {
        self.user = user
    }
    
}
