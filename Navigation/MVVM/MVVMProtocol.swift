import Foundation

protocol ButtonVMOutput {
    
    var statusColor: Dynamic<Any> { get }
    func checkMyPassword(password: String)
}
