import UIKit

public class TestUserService: UserService {
    
    let user: User
    
    func userAutorization(usersLogin: String) -> User? {
        
        return user
    }
    
    init(user: User) {
        self.user = user
    }
    
}
