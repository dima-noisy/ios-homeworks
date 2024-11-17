import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    let appConfiguration = AppConfiguration.allCases.randomElement()! //1й вариант инициализации
    
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let scene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: scene)
        
        let model = FeedViewModel()
        
        //let appConfiguration = AppConfiguration.allCases.randomElement()! //2й вариант инициализации
        
        let feedViewController = FeedViewController(viewModel: model as ButtonVMOutput)
        let logInViewController = LogInViewController()
        //logInViewController.loginDelegate = LoginInspector() решение для Задачи 1
        logInViewController.loginDelegate = MyLoginFactory().makeLoginInspector() //решение для Задачи2
        let tabBarController = UITabBarController()
        
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithOpaqueBackground()
        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
        
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        if #available(iOS 15.0, *) {
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        }
        
        feedViewController.tabBarItem = UITabBarItem(title: "Feed", image: UIImage(systemName: "figure.surfing"), tag: 0)
        logInViewController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.fill"), tag: 1)
        
        let controllers = [feedViewController, logInViewController]
        tabBarController.viewControllers = controllers.map {
            UINavigationController(rootViewController: $0)
        }
        tabBarController.selectedIndex = 0
        
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
        
        self.window = window
    }
}
