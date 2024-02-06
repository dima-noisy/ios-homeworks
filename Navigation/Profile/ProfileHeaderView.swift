import UIKit

class ProfileHeaderView: UIView {
    
    let avatarImageView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBlue
        view.layer.cornerRadius = 50.0
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 3
        view.layer.contents = UIImage(named: "catPhoto")?.cgImage
        view.layer.contentsGravity = .resizeAspect
        view.layer.masksToBounds = true

        return view
    }()

    let fullNameLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "mr. Black Cat"
        view.textColor = .black
        view.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        view.textAlignment = .center
        view.numberOfLines = 1

        return view
    }()

    let statusLabel: UITextView = {
        let view = UITextView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Enjoys the silence"
        view.textColor = .gray
        view.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        view.layer.masksToBounds = false

        return view
    }()
    
    let setStatusButton: UIButton = {
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
    
    let statusTextField = UITextField()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(avatarImageView)
        addSubview(fullNameLabel)
        addSubview(statusLabel)
        addSubview(setStatusButton)
        setupConstraints()
        setupActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
        //addSubview(catView)
        //addSubview(nameView)
        //addSubview(textView)
        //addSubview(buttonView)
        //setupConstraints()
        //setupActions()
    }
 
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            avatarImageView.heightAnchor.constraint(equalToConstant: 100.0),
            avatarImageView.widthAnchor.constraint(equalToConstant: 100.0),
            avatarImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16.0),
            avatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16.0),
            
            fullNameLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            fullNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27.0),
            
            statusLabel.widthAnchor.constraint(equalToConstant: 200.0),
            statusLabel.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),
            statusLabel.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -34.0),
            
            setStatusButton.heightAnchor.constraint(equalToConstant: 50.0),
            setStatusButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16.0),
            setStatusButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16.0),
            setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16.0)
        ])
    }
    
    @objc public func buttonPressed(_ sender: UIButton!) {
        print(statusLabel.text!)
    }

    private func setupActions() {
        let tapRoot = UITapGestureRecognizer(
            target: self,
            action: #selector(buttonPressed)
        )
        setStatusButton.addGestureRecognizer(tapRoot)
    }
}
