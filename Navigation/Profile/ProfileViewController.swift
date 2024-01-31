import UIKit

class ProfileViewController: UIViewController {

    let profileHeaderView = ProfileHeaderView()
    
    let buttonView: UIView = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBlue
        
        view.layer.cornerRadius = 4.0
        view.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.7
        
        view.clipsToBounds = false
        
        view.setTitle("Show status", for: .normal)
        view.addTarget(ProfileHeaderView.self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        
        return view
    }()
    
    @objc public func buttonPressed(_ sender: UIButton!) {
        print(textView.text!)
    }
    
    private func setupActions() {
        let tapRoot = UITapGestureRecognizer(
            target: self,
            action: #selector(buttonPressed)
        )
        view.addGestureRecognizer(tapRoot)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Profile"
        view.backgroundColor = .lightGray
        
        view.addSubview(profileHeaderView)
        profileHeaderView.addSubview(catView)
        profileHeaderView.addSubview(nameView)
        profileHeaderView.addSubview(buttonView)
        profileHeaderView.addSubview(textView)
        
        setupContraints()
        setupActions()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        profileHeaderView.frame = view.frame
    }
    
    private func setupContraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            catView.heightAnchor.constraint(equalToConstant: 100.0),
            catView.widthAnchor.constraint(equalToConstant: 100.0),
            catView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 16.0),
            catView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: 16.0),
            
            nameView.centerXAnchor.constraint(equalTo: safeAreaGuide.centerXAnchor),
            nameView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: 27.0),
            
            buttonView.heightAnchor.constraint(equalToConstant: 50.0),
            buttonView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 16.0),
            buttonView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -16.0),
            buttonView.topAnchor.constraint(equalTo: catView.bottomAnchor, constant: 16.0),
            
            textView.widthAnchor.constraint(equalToConstant: 500),
            textView.leadingAnchor.constraint(equalTo: nameView.leadingAnchor),
            textView.bottomAnchor.constraint(equalTo: buttonView.topAnchor, constant: -34.0)
        ])
    }
}
