import UIKit

final class FeedViewModel: ButtonVMOutput {
    
    var currentState: ((State) -> Void)?
    
    var state: State = .start {
        didSet {
            print(state)
            currentState?(state)
        }
    }
    
    func changeColor() {
        
        if FeedModel().secretWord == FeedViewController(viewModel: FeedViewModel()).passwordTextField.text?.lowercased() {
            state = .right
            NotificationCenter.default.post(name: Notification.Name("RightPassword"), object: nil)
        } else {
            state = .wrong
            NotificationCenter.default.post(name: Notification.Name("WrongPassword"), object: nil)
        }
        
    }
    
    
}
