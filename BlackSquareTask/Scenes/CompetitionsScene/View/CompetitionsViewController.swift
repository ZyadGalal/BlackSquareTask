//
//  CompetitionsViewController.swift
//  BlackSquareTask
//
//  Created by Zyad Galal on 23/11/2020.
//

import UIKit
import SVProgressHUD

class CompetitionsViewController: UIViewController{
    
    @IBOutlet weak var competitionsTableView: UITableView!
    var presenter: CompetitionsPresenter?
    override func viewDidLoad(){
        super.viewDidLoad()
        self.title = "Competitions"
        registerCell()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Available", style: .plain, target: self, action: #selector(availableCompetitionsTapped))
        presenter?.viewDidLoad()
    }
    @objc func availableCompetitionsTapped(){
        presenter?.navigateToAvailableCompetitions()
    }
    func registerCell(){
        competitionsTableView.register(CompetitionsTableViewCell.self)
    }
}

extension CompetitionsViewController: CompetitionsView {
    func didFetchDataSuccessfully() {
        competitionsTableView.reloadData()
    }
    
    func didFailFetchData(with message: String) {
        self.showAlert(title: "error", message: message) { _ in }
    }
    
    func showIndicator() {
        SVProgressHUD.show(withStatus: "Loading")
    }
    
    func dismissIndicator() {
        SVProgressHUD.dismiss()
    }
    
    
}

extension CompetitionsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getCompetitionsCount() ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = presenter?.getCompetition(at: indexPath.row)
        let cell = tableView.dequeueReusableCell(withIdentifier: type(of: item!).reuseId)
        item?.configure(cell: cell!, at: indexPath)
        return cell!
    }
}

