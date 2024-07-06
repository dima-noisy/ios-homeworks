import UIKit

class FeedViewController: UIViewController, UIWindowSceneDelegate {
    
    var viewModel: ButtonVMOutput
    
    public lazy var resultLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.masksToBounds = true
        
        label.layer.cornerRadius = 12.0
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.black.cgColor
        
        return label
    }()
    
    public lazy var passwordTextField: UITextField = { [unowned self] in
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.backgroundColor = .white
        view.layer.cornerRadius = 12.0
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        view.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        view.textColor = .black
        view.placeholder = "   Enter your password..."
        //view.text = "secret" действительно, если нет дефолтного значения, то всегда wrong, а если есть, то всегда right
        
        view.keyboardType = UIKeyboardType.default
        view.returnKeyType = UIReturnKeyType.done
        view.clearButtonMode = UITextField.ViewMode.whileEditing
        view.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        
        return view
    }()
    
    private lazy var checkGuessButton: CustomButton = {
        let button = CustomButton(title: "Password", titleColor: .white)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.backgroundColor = .systemIndigo
        button.layer.cornerRadius = 12.0
        
        return button
    }()
    
    private lazy var btn1: CustomButton = {
        let button = CustomButton(title: "", titleColor: .black)
        button.backgroundColor = .systemBlue
        
        return button
    }()
    
    private lazy var btn2: CustomButton = {
        let button = CustomButton(title: "", titleColor: .black)
        button.backgroundColor = .systemRed
        
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
    
    init(viewModel: ButtonVMOutput) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Feed"
        view.backgroundColor = .systemBackground
        
        view.addSubview(resultLabel)
        view.addSubview(passwordTextField)
        view.addSubview(checkGuessButton)
        view.addSubview(stackView)
        
        setupConstraints()
        createObservers()
    }
    
    private func setupConstraints() {
        let safeAreaLayoutGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            
            resultLabel.heightAnchor.constraint(equalToConstant: 50.0),
            resultLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20.0),
            resultLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20.0),
            resultLabel.bottomAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: -16.0),
            
            passwordTextField.heightAnchor.constraint(equalToConstant: 40.0),
            passwordTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20.0),
            passwordTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20.0),
            passwordTextField.bottomAnchor.constraint(equalTo: checkGuessButton.topAnchor, constant: -16.0),
            
            checkGuessButton.heightAnchor.constraint(equalToConstant: 50.0),
            checkGuessButton.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
            checkGuessButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor),
            checkGuessButton.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: -16.0),
            
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
    
    func createObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(buttonPressed(notification:)), name: Notification.Name("FeedStackCalling"), object: nil)
    }
    
    @objc func buttonPressed(notification: NSNotification) {
        let postViewController = PostViewController()
        self.navigationController?.pushViewController(postViewController, animated: true)
    }
}

public var newPost = PostPage(title: "New Post")
