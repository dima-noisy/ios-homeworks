import UIKit

public class TestUserService: UserService {
    
    let user: User
    
    func userAutorization(usersLogin: String) -> User? {
        
        return user
    }
    
    public init(user: User) {
        self.user = user
    }
}
