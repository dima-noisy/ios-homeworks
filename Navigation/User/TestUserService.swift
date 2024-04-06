import UIKit

final class TestUserService: UserService {
    
    var user: User

    public init(user: User) {
        self.user = user
    }
}
