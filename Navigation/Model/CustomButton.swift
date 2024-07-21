import UIKit

public class CustomButton: UIButton {

    var title: String
    var titleColor: UIColor
    
    public init(title: String, titleColor: UIColor) {
        self.title = title
        self.titleColor = titleColor
        super.init(frame: .zero)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupButton() {
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }

    @objc private func buttonTapped(_ sender: CustomButton!) {
        if self.title.contains("status") {
            NotificationCenter.default.post(name: Notification.Name("StatusButtonCalling"), object: nil)
        } else if self.title == "Log In" {
            NotificationCenter.default.post(name: Notification.Name("LoginButtonCalling"), object: nil)
        } else if self.layer.backgroundColor == UIColor.systemBlue.cgColor || self.layer.backgroundColor == UIColor.systemRed.cgColor {
            NotificationCenter.default.post(name: Notification.Name("FeedStackCalling"), object: nil)
        }
    }
}
