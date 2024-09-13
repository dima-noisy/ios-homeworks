import UIKit

class FeedCoordinator: FeedBaseCoordinator {
    
    var parentCoordinator: MainBaseCoordinator?
    lazy var rootViewController: UIViewController = UIViewController()
    
    func start() -> UIViewController {
        let viewModel = FeedViewModel()
        
        let module = FeedViewController(
            viewModel: viewModel
        )
        rootViewController = UINavigationController(
            rootViewController: module
        )
        return rootViewController
    }
    
    func showFeedScreen() {}
    
}
