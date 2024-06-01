import Foundation

protocol ButtonVMOutput {
    var state: State { get set }
    var currentState: ((State) -> Void)? { get set }
    func changeColor()
}

enum State {
    case start
    case right
    case wrong
}
