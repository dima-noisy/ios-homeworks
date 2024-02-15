import UIKit

class LogInViewController: UIViewController {
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.backgroundColor = .white
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .systemBlue
        
        return contentView
    }()
    
    private lazy var vkLogoImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "VKLogo")
        view.layer.masksToBounds = true
        
        return view
    }()
    
    private lazy var textField1: UITextField = { [unowned self] in
        let textField = UITextField()
        
        textField.backgroundColor = .systemGray6
        
        textField.placeholder = "   Email of phone"
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.textColor = .black
        if #available(iOS 15.0, *) {
            textField.tintColor = .tintColor
        }
        textField.autocapitalizationType = .none
        
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        
        textField.delegate = self
        
        return textField
    }()
    
    private lazy var textField2: UITextField = { [unowned self] in
        let textField = UITextField()
        
        textField.backgroundColor = .systemGray6
        
        textField.placeholder = "   Password"
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.textColor = .black
        if #available(iOS 15.0, *) {
            textField.tintColor = .tintColor
        }
        textField.autocapitalizationType = .none
        
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        
        textField.isSecureTextEntry = true
        
        textField.delegate = self
        
        return textField
    }()
    
    private lazy var stackView: UIStackView = { [unowned self] in
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.clipsToBounds = true
        
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 0.0
        
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.layer.borderWidth = 0.5
        stackView.layer.cornerRadius = 10.0
        
        stackView.addArrangedSubview(self.textField1)
        stackView.addArrangedSubview(self.textField2)
        
        return stackView
    }()
    
    private lazy var logInButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10.0
        button.clipsToBounds = true
        
        button.setBackgroundImage(UIImage(named: "bluePixel"), for: .normal)
        
        button.addTarget(self, action: #selector(logInButtonPressed(_:)), for: .touchUpInside)
            
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        addSubviews()
        setupConstraints()
        setupActions()
        changeButtonState()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: animated)
        setupKeyboardObservers()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: animated)
        removeKeyboardObservers()
    }
    
    @objc func willShowKeyboard(_ notification: NSNotification) {
        let keyboardHeight = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height
        scrollView.contentInset.bottom += keyboardHeight ?? 0.0
    }
    
    @objc func willHideKeyboard(_ notification: NSNotification) {
        scrollView.contentInset.bottom = 0.0
    }
    
    private func setupView() {
        view.backgroundColor = .systemBackground
        
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    private func addSubviews() {
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(vkLogoImageView)
        scrollView.addSubview(stackView)
        scrollView.addSubview(logInButton)
    }
    
    private func setupConstraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: 16.0),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor),
            
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            vkLogoImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            vkLogoImageView.widthAnchor.constraint(equalToConstant: 100.0),
            vkLogoImageView.heightAnchor.constraint(equalToConstant: 100.0),
            vkLogoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120.0),
            
            stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16.0),
            stackView.heightAnchor.constraint(equalToConstant: 100.0),
            stackView.topAnchor.constraint(equalTo: vkLogoImageView.bottomAnchor, constant: 120.0),
            
            logInButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logInButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16.0),
            logInButton.heightAnchor.constraint(equalToConstant: 50.0),
            logInButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16.0)
        ])
    }
    
    @objc public func logInButtonPressed(_ sender: UIButton!) {
        let profileViewController = ProfileViewController()
        self.navigationController?.pushViewController(profileViewController, animated: true)
    }
    
    private func setupActions() {
        let tapRoot = UITapGestureRecognizer(
            target: self,
            action: #selector(logInButtonPressed)
        )
        logInButton.addGestureRecognizer(tapRoot)
    }
    
    private func changeButtonState() {
        switch logInButton.state {
        case .normal:
            logInButton.alpha = 1.0
        case .highlighted:
            logInButton.alpha = 0.8
        case .selected:
            logInButton.alpha = 0.8
        case .disabled:
            logInButton.alpha = 0.8
        default:
            logInButton.alpha = 1.0
        }
    }
    
    private func setupKeyboardObservers() {
        let notificationCenter = NotificationCenter.default
        
        notificationCenter.addObserver(
            self,
            selector: #selector(self.willShowKeyboard(_:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        
        notificationCenter.addObserver(
            self,
            selector: #selector(self.willHideKeyboard(_:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    private func removeKeyboardObservers() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self)
    }
    
}

extension LogInViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(
        _ textField: UITextField
    ) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}

