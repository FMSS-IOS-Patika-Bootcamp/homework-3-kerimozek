//
//  PostViewController.swift
//  WorkListApp
//
//  Created by Mehmet Kerim ÖZEK on 19.09.2022.
//

import UIKit

class PostListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private let viewModel = PostListViewModel()
    private var items: [PostCellViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        viewModel.viewDelegate = self
        viewModel.didViewLoad()
    }
}




// ------EXTENSIONS------ //

private extension PostListViewController {
    func setupUI() {
        tableView.delegate = self
        tableView.dataSource = self
        registerCell()
    }
    func registerCell() {
        tableView.register(.init(nibName: "PostListTableViewCell", bundle: nil), forCellReuseIdentifier: "PostListTableViewCell")
    }
}

extension PostListViewController: PostListViewModelViewProtocol {
    func didCellItemFetch(_ items: [PostCellViewModel]) {
        self.items = items
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }
    
    func showEmptyView() {
        
    }
    
    func hideEmptyView() {
        
    }
}

extension PostListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // TODO: details sayfasına git
        viewModel.didClickItem(at: indexPath.row)
    }
}


extension PostListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
            
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostListTableViewCell") as! PostListTableViewCell
        cell.postTitleLabel.text = items[indexPath.row].title
        cell.postDescLabel.text = items[indexPath.row].desc
        return cell
    }
}
