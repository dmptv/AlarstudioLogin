//
//  ViewController.swift
//  AlarstudioTest
//
//  Created by 123 on 24.05.2018.
//  Copyright © 2018 kanat. All rights reserved.
//

import UIKit

class MainController: UIViewController {
    
    struct MainCellIdentifies {
        static var loadingCell = "LoadingCell"
        static var mcDonaldCell = "McDonaldCell"
        static var nothingFoundCell = "NothingFoundCell"
        
        static var scrollDelta: CGFloat = 2
    }
 
    var tableView: UITableView!
    var indexOfPageRequest = 0
    var loadingStatus = false
    var viewModel: MainControllerViewModel!
    var mcDonaldsList: [McDonald?] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViewLoadings()
        setupTableView()
        showBannerView()
        
        viewModel.mcDonaldsList.bindAndFire { [unowned self] in

            self.mcDonaldsList.append(contentsOf: $0)
            afterDelay(0, closure: {
                self.loadingStatus = false
                
                self.tableView.reloadData()
            })
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        navigationController?.setNavigationBarHidden(false, animated: false)
    }

    private func setupViewLoadings() {
        view.backgroundColor = .white
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "List"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sing Out", style: .plain, target: self, action: #selector(handleSingOut))
        
        navigationController?.navigationBar.barStyle = .blackTranslucent

    }
    
    private func setupTableView() {
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        setupTableVIewCells()
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.pinEdgesToSafeArea(of: view)
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableViewAutomaticDimension
        
        tableView.reloadData()
    }
    
    fileprivate func setupTableVIewCells() {
        var cellNib = UINib(nibName: MainCellIdentifies.loadingCell, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: MainCellIdentifies.loadingCell)
        cellNib = UINib(nibName: MainCellIdentifies.mcDonaldCell, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: MainCellIdentifies.mcDonaldCell)
        cellNib = UINib(nibName: MainCellIdentifies.nothingFoundCell, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: MainCellIdentifies.nothingFoundCell)
    }
    
    private func showBannerView() {
        bannerView()
    }

    @objc fileprivate func handleSingOut() {
        UserDefaults.standard.setIsLoggedIn(value: false)

        let loginController = LoginController()
        loginController.viewModel = LoginControllerViewModel()
        present(loginController, animated: true, completion: nil)
    }

    deinit {
        printMine("deinit: \(self)")
    }
}

extension MainController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if mcDonaldsList.count > 0 {
            return mcDonaldsList.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch viewModel.state {
            case .notSearchedYet:
                fatalError("\n\nShould never get here\n\n")
            case .loading:
                let cell = tableView.dequeueReusableCell(withIdentifier: MainCellIdentifies.loadingCell,
                                                         for: indexPath) as! LoadingCell
                cell.spinner.startAnimating()
                return cell
            case .noResults:
                /// backend error: 3840, replay request
                loadingStatus = false
                let cell = tableView.dequeueReusableCell(withIdentifier: MainCellIdentifies.mcDonaldCell,
                                                         for: indexPath) as! McDonaldCell
                let mcDonald = mcDonaldsList[indexPath.row]
                cell.configure(for: mcDonald!)
                return cell
            
            case .results:
                let cell = tableView.dequeueReusableCell(withIdentifier: MainCellIdentifies.mcDonaldCell,
                                                         for: indexPath) as! McDonaldCell
                let mcDonald = mcDonaldsList[indexPath.row]
                cell.configure(for: mcDonald!)
               
                return cell
            }
    }
    
}

extension MainController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let mc = mcDonaldsList[indexPath.row] {
            let mapVC = MapViewController(mc)
            navigationController?.pushViewController(mapVC, animated: false)
        }
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
}

// MARK: - UIScrollView Delegate

extension MainController {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height

        if offsetY > contentHeight - scrollView.frame.height * MainCellIdentifies.scrollDelta {
            loadData()
        }

    }

    func loadData() {
        if !loadingStatus {
            loadingStatus = true
            indexOfPageRequest += 1

            viewModel.getListWithSessionCode(UserDefaults.standard.getCode(), page: indexOfPageRequest, completion: {_ in})
        }

    }

}




















