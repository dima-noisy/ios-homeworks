import UIKit

public class User {
    var usersLogin: String
    var fullName: String
    var avatarImage: UIImage
    var status: String
    
    init(usersLogin: String, fullName: String, avatarImage: UIImage, status: String) {
        self.usersLogin = usersLogin
        self.fullName = fullName
        self.avatarImage = avatarImage
        self.status = status
    }
}
