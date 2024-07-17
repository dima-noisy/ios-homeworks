import UIKit

final class FeedViewModel: ButtonVMOutput {
    
    var state: State = .start
    
    var currentState: ((State) -> Void)?
    
    func checkMyPassword() {
        
        let word = FeedViewController(viewModel: FeedViewModel()).passwordTextField.text?.lowercased()
        
        if FeedModel().secretWord == word {
            state = .right
            currentState?(.right)
            currentState = { state in
                return
            }
            print(state)
            print(currentState)
        } else {
            state = .wrong
            currentState?(.wrong)
            currentState = { state in
                return
            }
            print(state)
            print(currentState)
        }
     }
        
}
