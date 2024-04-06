import UIKit

protocol UserService {
    var user: User { get set }
    func userAutorization(usersLogin: String) -> User?
}

final class CurrentUserService: UserService {
    
    var user: User

    public init(user: User) {
        self.user = user
    }
    
}

extension UserService {
    func userAutorization(usersLogin: String) -> User? {
        return usersLogin == user.usersLogin ? user : nil
    }
}
