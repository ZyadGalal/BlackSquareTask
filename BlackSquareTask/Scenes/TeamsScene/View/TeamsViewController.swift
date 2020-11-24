//
//  TeamsViewController.swift
//  BlackSquareTask
//
//  Created by Zyad Galal on 23/11/2020.
//

import UIKit
import SVProgressHUD

class TeamsViewController: UIViewController{
    
    @IBOutlet weak var teamsTableView: UITableView!
    var presenter: TeamsPresenter?
    override func viewDidLoad(){
        super.viewDidLoad()
        registerCell()
        presenter?.viewDidLoad()
    }
    func registerCell(){
        teamsTableView.register(TeamsTableViewCell.self)
    }
}

extension TeamsViewController: TeamsView {
    func didFetchDataSuccessfully() {
        teamsTableView.reloadData()
    }
    
    func didFailFetchData(with message: String) {
        self.showAlert(title: "error", message: message) { (_) in
        }
    }
    
    func showIndicator() {
        SVProgressHUD.show(withStatus: "Loading")
    }
    
    func dismissIndicator() {
        SVProgressHUD.dismiss()
    }
    
    
}
extension TeamsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getTeamsCount() ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = presenter?.getTeam(at: indexPath.row)
        let cell = tableView.dequeueReusableCell(withIdentifier: type(of: item!).reuseId)
        item?.configure(cell: cell!, at: indexPath)
        return cell!
    }
}
extension TeamsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectTeam(at: indexPath.row)
    }
}
