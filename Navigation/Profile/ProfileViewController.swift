import UIKit
import StorageService

class ProfileViewController: UIViewController {

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()

    private enum CellReuseID: String {
        case photos = "PhotosTableViewCell_ReuseID"
        case post = "PostTableViewCell_ReuseID"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        addSubviews()
        setupConstraints()
        tuneTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: animated)
        
        tableView.indexPathsForSelectedRows?.forEach{ indexPath in
            tableView.deselectRow(
                at: indexPath,
                animated: animated
            )
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    private func setupView() {
        #if DEBUG
        view.backgroundColor = .systemBackground
        #else
        view.backgroundColor = .systemPink
        #endif
    }
    
    private func addSubviews() {
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor)
        ])
    }
    
    private func tuneTableView() {
        tableView.backgroundColor = .white
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50.0
        
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: CellReuseID.photos.rawValue)
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: CellReuseID.post.rawValue)
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        var headerView = UIView()
        if section == 0 {
            headerView = ProfileHeaderView()
        }
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 240
        } else {
            return 0
        }
    }
}

extension ProfileViewController: UITableViewDataSource {
    
    func numberOfSections(
        in tableView: UITableView
    ) -> Int {
        2
    }
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        if section == 0 {
            return 1
        } else {
            return dataSource.count
        }
    }
    
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath ) -> UITableViewCell {
        
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: CellReuseID.photos.rawValue,
                for: indexPath
            ) as? PhotosTableViewCell else {
                return UITableViewCell()
            }
            
            return cell
        }
        
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CellReuseID.post.rawValue,
            for: indexPath
        ) as? PostTableViewCell else {
            return UITableViewCell()
        }
        
        let post = dataSource[indexPath.row]
        cell.configure(with: post)
        
        return cell
    }
}

extension ProfileViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            navigationController?.pushViewController(PhotosViewController(), animated: true)
        }
    }
}
