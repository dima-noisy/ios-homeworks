import Foundation

protocol ButtonVMOutput {
    var state: State { get set }
    var currentState: ((State) -> Void)? { get set }
    func checkMyPassword()
}
