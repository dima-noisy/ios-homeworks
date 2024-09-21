import UIKit
import iOSIntPackage

class PhotosViewController: UIViewController {
    
    fileprivate lazy var photos: [String] = (1...20).map { String("ph\($0)") }
    
    lazy var arrayOfPhotos: [UIImage] = photos.map({ UIImage(named: $0)! })
    
    private lazy var collectionView: UICollectionView = {
        
        let viewLayout = UICollectionViewFlowLayout()
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        
        collection.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: CellReuseID.base.rawValue)
        
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Photo Gallery"
        view.backgroundColor = .systemBackground
        
        setupCollectionView()
        setupLayouts()
        //ImageProcessor().processImagesOnThread(sourceImages: arrayOfPhotos, filter: .noir, qos: .default) { arrayOfPhotos.applyFilterOnThread(sourceImages: <#T##[UIImage]#>, filter: <#T##ColorFilter#>, completion: <#T##([CGImage?]) -> Void#>) }

    }
    
    
    private func setupCollectionView() {
        view.addSubview(collectionView)
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func setupLayouts() {
        
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor)
        ])
    }
    
    private enum LayoutConstant {
        static let spacing: CGFloat = 8.0
    }
    
    private enum CellReuseID: String {
        case base = "PhotosCollectionViewCell_ReuseID"
    }
}

extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CellReuseID.base.rawValue,
            for: indexPath) as! PhotosCollectionViewCell
        
        let photo = photos[indexPath.row]
        cell.setup(with: photo)
        
        return cell
    }
}

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    
    private func itemWidth(
        for width: CGFloat,
        spacing: CGFloat
    ) -> CGFloat {
        let itemsInRow: CGFloat = 3.0
        
        let totalSpacing: CGFloat = 3.0 * spacing + (itemsInRow - 2.0) * spacing
        let finalWidth = (width - totalSpacing) / itemsInRow
        
        return floor(finalWidth)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let width = itemWidth(
            for: view.frame.width,
            spacing: LayoutConstant.spacing
        )
        
        return CGSize(width: width, height: width)
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {
        UIEdgeInsets(
            top: LayoutConstant.spacing,
            left: LayoutConstant.spacing,
            bottom: LayoutConstant.spacing,
            right: LayoutConstant.spacing
        )
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        LayoutConstant.spacing
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumInteritemSpacingForSectionAt section: Int
    ) -> CGFloat {
        LayoutConstant.spacing
    }
}


/*
import UIKit
+import iOSIntPackage

class PhotosViewController: UIViewController {
    
    fileprivate lazy var photos: [String] = (1...20).map { String("ph\($0)") }
    
    +lazy var arrayOfPhotos: [UIImage] = photos.map({ UIImage(named: $0)! })
    
    +let myPublisherFacade = ImagePublisherFacade()
    
    private lazy var collectionView: UICollectionView = {
        
        let viewLayout = UICollectionViewFlowLayout()
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        
        collection.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: CellReuseID.base.rawValue)
        
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Photo Gallery"
        view.backgroundColor = .systemBackground
        
        setupCollectionView()
        setupLayouts()
        
        myPublisherFacade.subscribe(self)
        myPublisherFacade.addImagesWithTimer(time: 1.5, repeat: arrayOfPhotos.count, userImages: arrayOfPhotos)
        myPublisherFacade.rechargeImageLibrary()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        myPublisherFacade.removeSubscription(for: self)
    }
    
    private func setupCollectionView() {
        view.addSubview(collectionView)
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func setupLayouts() {
        
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor)
        ])
    }
    
    private enum LayoutConstant {
        static let spacing: CGFloat = 8.0
    }
    
    private enum CellReuseID: String {
        case base = "PhotosCollectionViewCell_ReuseID"
    }
}

extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //photos.count
        arrayOfPhotos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CellReuseID.base.rawValue,
            for: indexPath) as! PhotosCollectionViewCell
        
        //let photo = photos[indexPath.row]
        let photo = arrayOfPhotos[indexPath.row]
        cell.setup(with: photo)
        
        return cell
    }
}

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    
    private func itemWidth(
        for width: CGFloat,
        spacing: CGFloat
    ) -> CGFloat {
        let itemsInRow: CGFloat = 3.0
        
        let totalSpacing: CGFloat = 3.0 * spacing + (itemsInRow - 2.0) * spacing
        let finalWidth = (width - totalSpacing) / itemsInRow
        
        return floor(finalWidth)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let width = itemWidth(
            for: view.frame.width,
            spacing: LayoutConstant.spacing
        )
        
        return CGSize(width: width, height: width)
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {
        UIEdgeInsets(
            top: LayoutConstant.spacing,
            left: LayoutConstant.spacing,
            bottom: LayoutConstant.spacing,
            right: LayoutConstant.spacing
        )
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        LayoutConstant.spacing
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumInteritemSpacingForSectionAt section: Int
    ) -> CGFloat {
        LayoutConstant.spacing
    }
}

extension PhotosViewController: ImageLibrarySubscriber {
    func receive(images: [UIImage]) {
        arrayOfPhotos = images
        collectionView.reloadData()
    }
}
 */
