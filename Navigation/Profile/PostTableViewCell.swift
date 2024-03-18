import UIKit
import StorageService
import iOSIntPackage

class PostTableViewCell: UITableViewCell {
    
    private lazy var labelView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 2
        
        return label
    }()
    
    private lazy var photoView: UIImageView = {
        let photo = UIImageView()
        photo.translatesAutoresizingMaskIntoConstraints = false
        photo.contentMode = .scaleAspectFit
        photo.backgroundColor = .black
        
        return photo
    }()
    
    private lazy var textView: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        
        text.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        text.textColor = .systemGray
        text.numberOfLines = 0
        
        return text
    }()
    
    private lazy var likesView: UILabel = {
        let likes = UILabel()
        likes.translatesAutoresizingMaskIntoConstraints = false
        
        likes.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        likes.textColor = .black
        
        return likes
    }()
    
    private lazy var viewsView: UILabel = {
        let views = UILabel()
        views.translatesAutoresizingMaskIntoConstraints = false
        
        views.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        views.textColor = .black
        
        return views
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubviews()
        setupConstraints()
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
    
    func configure(with post: Post) {
        labelView.text = post.author
        photoView.image = UIImage(named: post.image) //.processImage(sourceImage: UIImage(named: post.image)!, filter: .colorInvert, completion: <#(UIImage?) -> Void#>)
        textView.text = post.description
        likesView.text = "Likes: \(post.likes)"
        viewsView.text = "Views: \(post.views)"
        
    }
    
    private func addSubviews() {
        addSubview(labelView)
        addSubview(photoView)
        addSubview(textView)
        addSubview(likesView)
        addSubview(viewsView)
    }
    
    private func setupConstraints() {
        
        let safeAreaGuide = self.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            labelView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16.0),
            labelView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16.0),
            labelView.topAnchor.constraint(equalTo: topAnchor, constant: 16.0),
            
            photoView.leadingAnchor.constraint(equalTo: leadingAnchor),
            photoView.trailingAnchor.constraint(equalTo: trailingAnchor),
            photoView.topAnchor.constraint(equalTo: labelView.bottomAnchor, constant: 12.0),
            photoView.heightAnchor.constraint(equalTo: photoView.widthAnchor),
            
            textView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 16.0),
            textView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -16.0),
            textView.topAnchor.constraint(equalTo: photoView.bottomAnchor, constant: 16.0),
            
            likesView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 16.0),
            likesView.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 16.0),
            likesView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16.0),
            
            viewsView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -16.0),
            viewsView.topAnchor.constraint(equalTo: likesView.topAnchor)
        ])
    }
}
