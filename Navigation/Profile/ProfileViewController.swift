import UIKit

class ProfileViewController: UIViewController {

    let profileHeaderView = ProfileHeaderView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Profile"
        view.backgroundColor = .lightGray
        
        view.addSubview(profileHeaderView)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        profileHeaderView.frame = view.frame
    }
}
