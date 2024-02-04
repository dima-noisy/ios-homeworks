import UIKit

class FeedViewController: UIViewController, UIWindowSceneDelegate {

    private lazy var btn1: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        
        button.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        
        return button
    }()
        
    private lazy var btn2: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemRed
        
        button.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        
        return button
    }()
        
    private lazy var stackView: UIStackView = { [unowned self] in
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.clipsToBounds = true
        
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 10.0
            
        stackView.addArrangedSubview(self.btn1)
        stackView.addArrangedSubview(self.btn2)
        
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Feed"
        view.backgroundColor = .systemBackground
        
        view.addSubview(stackView)
        
        let safeAreaLayoutGuide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor,
                constant: 20.0
            ),
            stackView.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor,
                constant: -20.0
            ),
            stackView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 210.0)
        ])
    }
    
    @objc func buttonPressed(_ sender: UIStackView) {
        let postViewController = PostViewController()
        self.navigationController?.pushViewController(postViewController, animated: true)
    }
}

public var post = Post(title: "New Post")
