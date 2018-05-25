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
    }
 
    var tableView: UITableView!
    
    var fetchingMore = false
    
    var viewModel: MainControllerViewModel!
    
    var mcDonaldsList: [McDonald?] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel?.getListWithCode(UserDefaults.standard.getCode(), completion: { [weak self] result in
            afterDelay(0, closure: {
                self?.tableView.reloadData()
            })
        })
        
        setupViewLoadings()
        setupTableView()
        
        viewModel.mcDonaldsList.bindAndFire { [unowned self] in
            self.mcDonaldsList = $0
        }
    }

    private func setupViewLoadings() {
        view.backgroundColor = .white
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "List"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Sing Out", style: .plain, target: self, action: #selector(handleSingOut))
    }
    
    private func setupTableView() {
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        setupTableVIewCells()
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.pinEdgesToSafeArea(of: view)
        
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableViewAutomaticDimension
        
        tableView.remembersLastFocusedIndexPath = true
        
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
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if mcDonaldsList.count > 0 {
            return mcDonaldsList.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch viewModel.state {
            case .notSearchedYet:
                fatalError("Should never get here")
            case .loading:
                let cell = tableView.dequeueReusableCell(withIdentifier: MainCellIdentifies.loadingCell,
                                                         for: indexPath) as! LoadingCell
                cell.spinner.startAnimating()
                return cell
            case .noResults:
                return tableView.dequeueReusableCell(withIdentifier: MainCellIdentifies.nothingFoundCell,
                                                     for: indexPath)
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
}





















