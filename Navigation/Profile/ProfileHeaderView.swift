import UIKit

class ProfileHeaderView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

let catView: UIView = {
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

let nameView: UILabel = {
    let view = UILabel()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.text = "Black Cat"
    view.textColor = .black
    view.font = UIFont.systemFont(ofSize: 18, weight: .bold)
    view.textAlignment = .center
    view.numberOfLines = 1
    
    return view
}()

let textView: UITextView = {
    let view = UITextView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.text = "Waiting for something..."
    view.textColor = .gray
    view.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    view.layer.masksToBounds = false
    
    return view
}()
