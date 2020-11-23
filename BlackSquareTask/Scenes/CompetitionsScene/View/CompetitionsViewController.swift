//
//  CompetitionsViewController.swift
//  BlackSquareTask
//
//  Created by Zyad Galal on 23/11/2020.
//

import UIKit


class CompetitionsViewController: UIViewController{
    
    @IBOutlet weak var competitionsTableView: UITableView!
    var presenter: CompetitionsPresenter?
    override func viewDidLoad(){
        super.viewDidLoad()
        self.title = "Competitions"
        registerCell()
        presenter?.viewDidLoad()
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
        self.showAlert(title: "error", message: message) { (_) in
        }
    }
    
    func showIndicator() {
        
    }
    
    func dismissIndicator() {
        
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
extension CompetitionsViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectCompetition(at: indexPath.row)
    }
}
