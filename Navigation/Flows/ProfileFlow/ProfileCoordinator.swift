import UIKit

class ProfileCoordinator: ProfileBaseCoordinator {
    
    var parentCoordinator: MainBaseCoordinator?
    var rootViewController: UIViewController = UIViewController()
    
    func start() -> UIViewController {
        let viewModel = LoginVMImp()
        viewModel.checkLogAndPass = { [weak self] in
            self?.showProfileScreen()
        }
        let module = LogInViewController(
            viewModel: viewModel
        )
        module.loginDelegate = MyLoginFactory().makeLoginInspector()
        
        rootViewController = UINavigationController(
            rootViewController: module
        )
        return rootViewController
    }
    
    func showProfileScreen() {
        let vc = ProfileViewController()
        navigationRootViewController?.pushViewController(vc, animated: true)
    }
}
