//
//  AvailableCompetitionsViewController.swift
//  BlackSquareTask
//
//  Created by Zyad Galal on 26/11/2020.
//

import UIKit
import SVProgressHUD

class AvailableCompetitionsViewController: UIViewController{
    
    @IBOutlet weak var availableCompetitionsTableView: UITableView!
    var presenter: AvailableCompetitionsPresenter?
    override func viewDidLoad(){
        super.viewDidLoad()
        self.title = "Available"
        registerCell()
        presenter?.viewDidLoad()
    }
    func registerCell(){
        availableCompetitionsTableView.register(CompetitionsTableViewCell.self)
    }
}

extension AvailableCompetitionsViewController: AvailableCompetitionsView {
    func didFetchDataSuccessfully() {
        availableCompetitionsTableView.reloadData()
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

extension AvailableCompetitionsViewController: UITableViewDataSource {
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
extension AvailableCompetitionsViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectCompetition(at: indexPath.row)
    }
}
