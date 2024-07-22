//
//

import UIKit

class MainPageView: UIViewController, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {
    
    private var refreshControl = UIRefreshControl()
    private var viewModel = MainPageViewModel()
    private let searchBar = UISearchBar()
    private let tableView = UITableView()
    private var errorView: ErrorView?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModel()
        viewModel.fetchCoins()
        setupRefreshControl()
    }

    // MARK: UI Setup
    private func setupUI() {
        searchBar.delegate = self
        view.addSubview(searchBar)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(MainCoinTableViewCell.self, forCellReuseIdentifier: "CoinCell")
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        errorView = ErrorView()
        errorView?.delegate = self
        view.addSubview(errorView!)
        errorView?.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            errorView!.topAnchor.constraint(equalTo: view.topAnchor),
            errorView!.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            errorView!.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            errorView!.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ])
        errorView?.configure(with: "Sorry", description: "No result match this keyword")
        errorView?.isHidden = true
    }
    
    // MARK: Refresh
    private func setupRefreshControl() {
            refreshControl.tintColor = .blue // Customize the tint color
            let attributes = [NSAttributedString.Key.foregroundColor: UIColor.blue]
            refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh", attributes: attributes) // Customize the title

            refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
            tableView.refreshControl = refreshControl
        }

        @objc private func refreshData() {
            searchBar.text = ""
            searchBar.resignFirstResponder()
            viewModel.resetData()
            viewModel.fetchCoins()
        }

    // MARK: ViewModel Binding
    private func bindViewModel() {
        
        viewModel.onCoinsUpdated = { [weak self] in
            self?.errorView?.isHidden = true
            self?.tableView.reloadData()
            self?.refreshControl.endRefreshing()
        }
        viewModel.onError = {[weak self] error in
            // create popup show error
            self?.showError(error)
            print("Error: \(error)")
            self?.refreshControl.endRefreshing()
        }
        
        viewModel.onSearchError = { [weak self] in
            // create popup show error
            
            self?.tableView.reloadData()
            // add errorView in tableView
            self?.errorView?.isHidden = false
            self?.refreshControl.endRefreshing()
            
        }
    }
    
    // create function show error
    
    func showError(_ error: Error) {
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    

    // MARK: UISearchBarDelegate
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            viewModel.resetData()
            viewModel.fetchCoins()
        }else {
            viewModel.searchCoins(keyword: searchText)
        }
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        viewModel.resetData()
        viewModel.fetchCoins()
    }
    
    //searchbar click clear button
    func searchBarShouldClear(_ searchBar: UISearchBar) -> Bool {
        viewModel.resetData()
        viewModel.fetchCoins()
        return true
    }

    // MARK: UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfShowCoins()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
            if viewModel.isPowIndex(index: index) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "InviteFriendCell", for: indexPath)
                // Configure your inviteFriendCell
                return cell
            } else {
                // Adjust index to get the correct coin data
                let adjustedIndex = viewModel.adjustedIndex(for: index)
                let cell = tableView.dequeueReusableCell(withIdentifier: "CoinCell", for: indexPath)
                let coin = viewModel.coin(at: adjustedIndex)
                // Configure your CoinCell with coin data
                return cell
            }
    }

    // MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let coin = viewModel.coin(at: indexPath.row)
        navigateToDetail(uuid: coin.uuid)
        
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == viewModel.numberOfCoins - 1 { // Last cell
            viewModel.fetchCoins() // Fetch more coins
        }
    }
}


extension MainPageView:ErrorViewDelegate {
    func didTapButton() {
       //
    }

}
