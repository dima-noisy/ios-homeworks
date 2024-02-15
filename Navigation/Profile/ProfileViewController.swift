import UIKit

struct Post {
    var author: String
    var description: String
    var image: String
    var likes: Int
    var views: Int
}

class ProfileViewController: UIViewController {

    let profileHeaderView: ProfileHeaderView = {
        let profileHeaderView = ProfileHeaderView()
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        return profileHeaderView
    }()
    
    private lazy var bigBottomButton: UIView = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBlue
        view.setTitle("Big Bottom Button", for: .normal)

        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Profile"
        view.backgroundColor = .lightGray
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        setupUI()
        addBottomButton()
    }
    
    private func setupUI() {
        view.addSubview(profileHeaderView)
        
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileHeaderView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor),
            profileHeaderView.bottomAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: 220)
        ])
        
    }
    
    private func addBottomButton() {
        profileHeaderView.addSubview(bigBottomButton)
        
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            bigBottomButton.leadingAnchor.constraint(equalTo: profileHeaderView.leadingAnchor),
            bigBottomButton.trailingAnchor.constraint(equalTo: profileHeaderView.trailingAnchor),
            bigBottomButton.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor)
        ])
        
    }
}
