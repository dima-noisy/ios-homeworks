import UIKit

final class FeedViewModel: ButtonVMOutput {
    
    var state: State = .start
    
    var currentState: ((State) -> Void)?
    
    func checkMyPassword() {
        
        if FeedModel().secretWord == FeedViewController(viewModel: FeedViewModel()).passwordTextField.text?.lowercased() {
            state = .right
            currentState?(state)
            print(state)
            FeedViewController(viewModel: FeedViewModel()).resultLabel.backgroundColor = .systemGreen
        } else {
            state = .wrong
            currentState?(state)
            print(state)
            FeedViewController(viewModel: FeedViewModel()).resultLabel.backgroundColor = .systemRed
        }
        
    }
}
