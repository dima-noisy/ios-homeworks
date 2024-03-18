import UIKit
import SnapKit

class ProfileHeaderView: UIView {
    
    private lazy var avatarImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true

        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 3
        view.image = UIImage(named: "catPhoto")
        view.layer.contentsGravity = .resizeAspect
        view.layer.masksToBounds = true
        
        let tapAvatar = UITapGestureRecognizer(
            target: self,
            action: #selector(didTapAvatar)
        )
        tapAvatar.numberOfTapsRequired = 1
        view.addGestureRecognizer(tapAvatar)

        return view
    }()

    private lazy var fullNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "mr. Black Cat"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textAlignment = .center
        label.numberOfLines = 1

        return label
    }()

    private lazy var statusLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Enjoys the silence"
        view.textColor = .gray
        view.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        view.layer.masksToBounds = false

        return view
    }()
    
    private lazy var statusTextField: UITextField = { [unowned self] in
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        view.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        view.textColor = .black
        view.placeholder = "   Set your status..."
        
        view.keyboardType = UIKeyboardType.default
        view.returnKeyType = UIReturnKeyType.done
        view.clearButtonMode = UITextField.ViewMode.whileEditing
        view.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        
        view.delegate = self
        
        return view
    }()
    
    private lazy var setStatusButton: UIView = {
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
    
    private lazy var closeAnimationView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        view.image = UIImage(named: "CloseCross")
        view.layer.masksToBounds = true
        view.alpha = 0.0
        
        let tapCloseAnimation = UITapGestureRecognizer(
            target: self,
            action: #selector(didTapCloseAnimation)
        )
        tapCloseAnimation.numberOfTapsRequired = 1
        view.addGestureRecognizer(tapCloseAnimation)

        return view
    }()
    
    private lazy var halfOpacityView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBackground
        view.alpha = 0.0

        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(fullNameLabel)
        addSubview(statusLabel)
        addSubview(statusTextField)
        addSubview(setStatusButton)
        addSubview(halfOpacityView)
        addSubview(avatarImageView)
        avatarImageView.addSubview(closeAnimationView)
        
        avatarImageView.snp.makeConstraints { (make) -> Void in
            make.width.height.equalTo(100.0)
            make.leading.equalTo(16.0)
            make.top.equalTo(16.0)
        }
        
        fullNameLabel.snp.makeConstraints { (make) -> Void in
            make.centerX.equalToSuperview()
            make.top.equalTo(27.0)
        }
        
        statusLabel.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(fullNameLabel)
            make.top.equalTo(84.0)
        }
        
        statusTextField.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(40.0)
            make.leading.equalTo(fullNameLabel)
            make.trailing.equalTo(-16.0)
            make.top.equalTo(116.0)
        }
        
        setStatusButton.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(50.0)
            make.leading.equalTo(16.0)
            make.trailing.equalTo(-16.0)
            make.top.equalTo(172.0)
        }
        
        closeAnimationView.snp.makeConstraints { (make) -> Void in
            make.width.height.equalTo(24.0)
        }
        
        setupConstraints()
        setupActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        avatarImageView.layer.cornerRadius = avatarImageView.frame.size.width / 2
    }
 
    private func setupConstraints() {
        let safeAreaGuide = self.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            //avatarImageView.heightAnchor.constraint(equalToConstant: 100.0),
            //avatarImageView.widthAnchor.constraint(equalToConstant: 100.0),
            //avatarImageView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 16.0),
            //avatarImageView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: 16.0),
            
            //fullNameLabel.centerXAnchor.constraint(equalTo: safeAreaGuide.centerXAnchor),
            //fullNameLabel.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: 27.0),
            
            //statusLabel.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),
            //statusLabel.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: -16.0),
            
            //statusTextField.heightAnchor.constraint(equalToConstant: 40.0),
            //statusTextField.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),
            //statusTextField.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -16.0),
            //statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 16.0),
            
            //setStatusButton.heightAnchor.constraint(equalToConstant: 50.0),
            //setStatusButton.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 16.0),
            //setStatusButton.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -16.0),
            //setStatusButton.topAnchor.constraint(equalTo: statusTextField.bottomAnchor, constant: 16.0),
            
            //closeAnimationView.heightAnchor.constraint(equalToConstant: 24.0),
            //closeAnimationView.widthAnchor.constraint(equalToConstant: 24.0),
            closeAnimationView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -10.0),
            closeAnimationView.topAnchor.constraint(equalTo: avatarImageView.topAnchor, constant: 10.0)
        ])
    }
    
    @objc private func didTapAvatar() {
        launchFirstAnimation()
        launchSecondAnimation()
    }
    
    @objc private func didTapCloseAnimation() {
        closingAnimation()
    }
    
    @objc public func buttonPressed(_ sender: UIButton!) {
        let statusNewText = statusTextField.text
        statusLabel.text = statusNewText
        print(statusLabel.text!)
    }

    private func setupActions() {
        let tapRoot = UITapGestureRecognizer(
            target: self,
            action: #selector(buttonPressed)
        )
        setStatusButton.addGestureRecognizer(tapRoot)
    }
    
    private func launchFirstAnimation() {
        
        CATransaction.begin()
        
        CATransaction.setCompletionBlock { [self] in
            self.avatarImageView.layer.frame.size.width = layer.frame.width
            self.avatarImageView.layer.frame.size.height = layer.frame.width
            self.avatarImageView.layer.cornerRadius = 0.0
            self.avatarImageView.layer.borderWidth = 0.0
            self.avatarImageView.center.x = layer.frame.width / 2
            self.avatarImageView.center.y = 350.0
            self.halfOpacityView.layer.frame.size.width = layer.frame.width
            self.halfOpacityView.layer.frame.size.height = 1000.0
            self.halfOpacityView.alpha = 0.7
        }
        
        let animationPosition = CABasicAnimation(keyPath: #keyPath(CALayer.position))
        animationPosition.fromValue = CGPoint(x: 58.0, y: 58.0)
        animationPosition.toValue = CGPoint(x: layer.frame.width / 2, y: 350.0)
        animationPosition.beginTime = 0.0
        animationPosition.duration = 0.5
        animationPosition.autoreverses = false
        animationPosition.isRemovedOnCompletion = true
        avatarImageView.layer.add(animationPosition, forKey: #keyPath(CALayer.position))
        
        
        let resizeAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.frame))
        resizeAnimation.fromValue = CGSize(width: 100.0, height: 100.0)
        resizeAnimation.toValue = CGSize(width: 300.0, height: 300.0) //не работает
        resizeAnimation.fillMode = .forwards
        resizeAnimation.beginTime = 0.0
        resizeAnimation.duration = 0.5
        resizeAnimation.valueFunction = CAValueFunction(name: CAValueFunctionName.scale)
        resizeAnimation.timingFunction = CAMediaTimingFunction(name: .easeIn)
        resizeAnimation.autoreverses = false
        resizeAnimation.isRemovedOnCompletion = true
        avatarImageView.layer.add(resizeAnimation, forKey: #keyPath(CALayer.frame))
        
        let appearOpacity = CABasicAnimation(keyPath: #keyPath(CALayer.opacity))
        appearOpacity.fromValue = 0.0
        appearOpacity.toValue = 0.7
        appearOpacity.fillMode = .forwards
        appearOpacity.beginTime = 0.0
        appearOpacity.duration = 0.5
        appearOpacity.autoreverses = false
        appearOpacity.isRemovedOnCompletion = true
        appearOpacity.timingFunction = CAMediaTimingFunction(name: .easeIn)
        closeAnimationView.layer.add(appearOpacity, forKey: #keyPath(CALayer.opacity))
        
        CATransaction.commit()
         
    }
    
    private func launchSecondAnimation() {
        
        CATransaction.begin()
        
        let animationCross = CABasicAnimation(keyPath: #keyPath(CALayer.opacity))
        animationCross.fromValue = 0.0
        animationCross.toValue = 1.0
        animationCross.beginTime = 0.5
        animationCross.duration = 0.8
        animationCross.autoreverses = false
        animationCross.isRemovedOnCompletion = true
        self.halfOpacityView.layer.frame.size.width = 0.0
        self.halfOpacityView.layer.frame.size.height = 0.0
        closeAnimationView.alpha = 1.0
        closeAnimationView.layer.add(animationCross, forKey: #keyPath(CALayer.opacity))

        CATransaction.commit()
         
    }
    
    private func closingAnimation() {
        
        CATransaction.begin()
        
        CATransaction.setCompletionBlock { [self] in
            self.avatarImageView.layer.frame.size.width = 100
            self.avatarImageView.layer.frame.size.height = 100
            self.avatarImageView.layer.cornerRadius = 50.0
            self.avatarImageView.layer.borderWidth = 3.0
            self.avatarImageView.center.x = 58.0
            self.avatarImageView.center.y = 58.0
            self.halfOpacityView.alpha = 0.0
        }
        
        let hidingCross = CABasicAnimation(keyPath: #keyPath(CALayer.opacity))
        hidingCross.fromValue = 1.0
        hidingCross.toValue = 0.0
        hidingCross.fillMode = .forwards
        hidingCross.beginTime = 0.0
        hidingCross.duration = 0.3
        hidingCross.autoreverses = false
        hidingCross.isRemovedOnCompletion = true
        hidingCross.timingFunction = CAMediaTimingFunction(name: .easeIn)
        closeAnimationView.layer.add(hidingCross, forKey: #keyPath(CALayer.opacity))
        
        let bringBackCat = CABasicAnimation(keyPath: #keyPath(CALayer.position))
        bringBackCat.fromValue = CGPoint(x: layer.frame.width / 2, y: 350)
        bringBackCat.toValue = CGPoint(x: 58.0, y: 58.0)
        bringBackCat.fillMode = .forwards
        bringBackCat.beginTime = 0.3
        bringBackCat.duration = 0.8
        bringBackCat.autoreverses = false
        bringBackCat.isRemovedOnCompletion = true
        bringBackCat.timingFunction = CAMediaTimingFunction(name: .easeIn)
        avatarImageView.layer.add(bringBackCat, forKey: #keyPath(CALayer.position))
        
        let resizeAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.transform))
        resizeAnimation.fromValue = CGSize(width: 300.0, height: 300.0) //не работает
        resizeAnimation.toValue = CGSize(width: 100.0, height: 100.0)
        resizeAnimation.fillMode = .removed
        resizeAnimation.beginTime = 0.3
        resizeAnimation.duration = 0.8
        resizeAnimation.valueFunction = CAValueFunction(name: CAValueFunctionName.scale)
        resizeAnimation.timingFunction = CAMediaTimingFunction(name: .easeIn)
        resizeAnimation.autoreverses = false
        resizeAnimation.isRemovedOnCompletion = true
        avatarImageView.layer.add(resizeAnimation, forKey: #keyPath(CALayer.transform))
        
        CATransaction.commit()
         
    }

}

extension ProfileHeaderView: UITextFieldDelegate {
    
    func textFieldShouldReturn(
        _ textField: UITextField
    ) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}
