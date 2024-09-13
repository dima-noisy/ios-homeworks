import Foundation

protocol LoginVM {
    var checkLogAndPass: Action? { get set }
}

class LoginVMImp: LoginVM {
    var checkLogAndPass: Action?
}
