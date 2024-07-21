import UIKit

final class FeedViewModel: ButtonVMOutput {
    
    var statusColor: Dynamic<Any> = Dynamic(UIColor.white)
    
    func checkMyPassword(password: String) {
        if password == FeedModel().secretWord {
            statusColor.value = UIColor.systemGreen
        } else {
            statusColor.value = UIColor.systemRed
        }
    }
}

class Dynamic<T> {
    typealias Listener = (T) -> Void
    private var listener: Listener?
    
    func bind(_ listener: Listener?) {
        self.listener = listener
    }
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ v: T) {
        value = v
    }
}
