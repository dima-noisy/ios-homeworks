import UIKit

public class FeedModel {
    var secretWord: String = "secret"
    
    public func check(_ word: String) {
        if secretWord == word.lowercased() {
            print("right")
            NotificationCenter.default.post(name: Notification.Name("RightPassword"), object: nil)
        } else {
            print("wrong")
            NotificationCenter.default.post(name: Notification.Name("WrongPassword"), object: nil)
        }
    }
}
