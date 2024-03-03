import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    private lazy var labelView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 1
        label.text = "Photos"
        
        return label
    }()
    
    private lazy var arrowView: UIImageView = {
        let arrow = UIImageView()
        arrow.translatesAutoresizingMaskIntoConstraints = false
        arrow.contentMode = .scaleAspectFit
        arrow.image = UIImage(named: "ArrowForward")
        arrow.clipsToBounds = true
        
        return arrow
    }()
    
    private lazy var ph1View: UIImageView = {
        let photo = UIImageView()
        photo.translatesAutoresizingMaskIntoConstraints = false
        photo.image = UIImage(named: "ph1")
        photo.contentMode = .scaleAspectFill
        photo.layer.cornerRadius = 6
        photo.clipsToBounds = true
        
        return photo
    }()
    
    private lazy var ph2View: UIImageView = {
        let photo = UIImageView()
        photo.translatesAutoresizingMaskIntoConstraints = false
        photo.image = UIImage(named: "ph2")
        photo.contentMode = .scaleAspectFill
        photo.layer.cornerRadius = 6
        photo.clipsToBounds = true
        
        return photo
    }()
    
    private lazy var ph3View: UIImageView = {
        let photo = UIImageView()
        photo.translatesAutoresizingMaskIntoConstraints = false
        photo.image = UIImage(named: "ph3")
        photo.contentMode = .scaleAspectFill
        photo.layer.cornerRadius = 6
        photo.clipsToBounds = true
        
        return photo
    }()
    
    private lazy var ph4View: UIImageView = {
        let photo = UIImageView()
        photo.translatesAutoresizingMaskIntoConstraints = false
        photo.image = UIImage(named: "ph4")
        photo.contentMode = .scaleAspectFill
        photo.layer.cornerRadius = 6
        photo.clipsToBounds = true
        
        return photo
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
    
    private func addSubviews() {
        addSubview(labelView)
        addSubview(arrowView)
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
            
            arrowView.centerYAnchor.constraint(equalTo: labelView.centerYAnchor),
            arrowView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -12.0),
            arrowView.widthAnchor.constraint(equalToConstant: 24.0),
            arrowView.heightAnchor.constraint(equalTo: arrowView.widthAnchor),
            
            ph1View.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 12.0),
            ph1View.topAnchor.constraint(equalTo: labelView.bottomAnchor, constant: 12.0),
            ph1View.widthAnchor.constraint(equalTo: safeAreaGuide.widthAnchor, multiplier: 0.25, constant: -12.0),
            ph1View.heightAnchor.constraint(equalTo: ph1View.widthAnchor),
            ph1View.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12.0),
            
            ph2View.leadingAnchor.constraint(equalTo: ph1View.trailingAnchor, constant: 8.0),
            ph2View.topAnchor.constraint(equalTo: ph1View.topAnchor),
            ph2View.widthAnchor.constraint(equalTo: ph1View.widthAnchor),
            ph2View.heightAnchor.constraint(equalTo: ph2View.widthAnchor),
            
            ph3View.leadingAnchor.constraint(equalTo: ph2View.trailingAnchor, constant: 8.0),
            ph3View.topAnchor.constraint(equalTo: ph2View.topAnchor),
            ph3View.widthAnchor.constraint(equalTo: ph2View.widthAnchor),
            ph3View.heightAnchor.constraint(equalTo: ph3View.widthAnchor),
            
            ph4View.leadingAnchor.constraint(equalTo: ph3View.trailingAnchor, constant: 8.0),
            ph4View.topAnchor.constraint(equalTo: ph3View.topAnchor),
            ph4View.widthAnchor.constraint(equalTo: ph3View.widthAnchor),
            ph4View.heightAnchor.constraint(equalTo: ph4View.widthAnchor)
        ])
    }
}
