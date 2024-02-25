import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    static let id = "PhotosTableViewCell"
    
    private lazy var labelView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 1
        label.text = "Photos"
        
        return label
    }()
    
    private lazy var ph1View: UIImageView = {
        let photo = UIImageView()
        photo.translatesAutoresizingMaskIntoConstraints = false
        photo.contentMode = .scaleAspectFit
        photo.backgroundColor = .black
        
        return photo
    }()
    
    private lazy var ph2View: UIImageView = {
        let photo = UIImageView()
        photo.translatesAutoresizingMaskIntoConstraints = false
        photo.contentMode = .scaleAspectFit
        photo.backgroundColor = .black
        
        return photo
    }()
    
    private lazy var ph3View: UIImageView = {
        let photo = UIImageView()
        photo.translatesAutoresizingMaskIntoConstraints = false
        photo.contentMode = .scaleAspectFit
        photo.backgroundColor = .black
        
        return photo
    }()
    
    private lazy var ph4View: UIImageView = {
        let photo = UIImageView()
        photo.translatesAutoresizingMaskIntoConstraints = false
        photo.contentMode = .scaleAspectFit
        photo.backgroundColor = .black
        
        return photo
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubviews()
        //setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        isHidden = false
        isSelected = false
        isHighlighted = false
    }
    /*
     func configure(with post: Post) {
     labelView.text = post.author
     photoView.image = UIImage(named: post.image)
     textView.text = post.description
     likesView.text = "Likes: \(post.likes)"
     viewsView.text = "Views: \(post.views)"
     }
     */
    
    private func addSubviews() {
        addSubview(ph1View)
        addSubview(ph2View)
        addSubview(ph3View)
        addSubview(ph4View)
    }
    
    private func setupConstraints() {
        
        let safeAreaGuide = self.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            labelView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 12.0),
            labelView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: 12.0),
            /*
             photoView.leadingAnchor.constraint(equalTo: leadingAnchor),
             photoView.trailingAnchor.constraint(equalTo: trailingAnchor),
             photoView.topAnchor.constraint(equalTo: labelView.bottomAnchor, constant: 12.0),
             
             textView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 16.0),
             textView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -16.0),
             textView.topAnchor.constraint(equalTo: photoView.bottomAnchor, constant: 16.0),
             
             likesView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 16.0),
             likesView.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 16.0),
             likesView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16.0),
             
             viewsView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -16.0),
             viewsView.topAnchor.constraint(equalTo: likesView.topAnchor)
             */
        ])
    }
}
