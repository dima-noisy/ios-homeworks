import UIKit

protocol LoginViewControllerDelegate {
    mutating func check(usersLogin: String, usersPassword: String) -> Bool
}

public class LogInViewController: UIViewController {
    
    var loginDelegate: LoginViewControllerDelegate?
    
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
    
    public lazy var textField1: UITextField = { [unowned self] in
        let textField = UITextField()
        
        textField.backgroundColor = .systemGray6
        
        textField.placeholder = "   Login"
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.textColor = .black
        textField.text = "BlackCat" //default for automatic enter
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
    
    public lazy var textField2: UITextField = { [unowned self] in
        let textField = UITextField()
        
        textField.backgroundColor = .systemGray6
        
        textField.placeholder = "   Password"
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.textColor = .black
        textField.text = "12345" //default for automatic enter
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
    
    public lazy var logInButton: CustomButton = {
        var button = CustomButton(title: "Log In", titleColor: .white)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.layer.cornerRadius = 10.0
        button.clipsToBounds = true
        
        button.setBackgroundImage(UIImage(named: "bluePixel"), for: .normal)
        
        return button
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        addSubviews()
        setupConstraints()
        changeButtonState()
        //createObservers()
    }
    
    override public func viewDidAppear(_ animated: Bool) {
        createObservers()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: animated)
        setupKeyboardObservers()
    }
    
    public override func viewWillDisappear(_ animated: Bool) {
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
    
    func createObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(logInButtonPressed(notification:)), name: Notification.Name("LoginButtonCalling"), object: nil)
    }
    
    @objc public func logInButtonPressed(notification: NSNotification) {
    #if DEBUG
        let service = CurrentUserService(user: ProfileViewController().catUser)
    #else
        let service = TestUserService(user: ProfileViewController().catUser)
    #endif
        if (loginDelegate?.check(usersLogin: textField1.text ?? "", usersPassword: textField2.text ?? ""))! {
            let profileViewController = ProfileViewController()
            navigationController?.pushViewController(profileViewController, animated: true)
        } else {
            let alert = UIAlertController(title: "Invalid Login or Password", message: "If you forget your login name or password, please find them in code", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("Try Again", comment: "Exit action"), style: UIAlertAction.Style.cancel, handler: { _ in NSLog("Try Again.")
            }))
            self.present(alert, animated: true, completion: nil)
        }
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
    
    public func textFieldShouldReturn(
        _ textField: UITextField
    ) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}

struct LoginInspector: LoginViewControllerDelegate {
    mutating func check(usersLogin: String, usersPassword: String) -> Bool {
        return Checker.shared.check(usersLogin: usersLogin, usersPassword: usersPassword)
    }
}

