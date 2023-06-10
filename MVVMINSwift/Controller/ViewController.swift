//
//  ViewController.swift
//  MVVMINSwift
//
//  Created by buse koca on 31.05.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var viewModel = QuestionViewModel()
    var questionData: DataModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        viewModel.getAllTheQuestion { [weak self] in
            self?.questionData = self?.viewModel.questionModel
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        }
    //tableviewcell olusturulması lazım 21.satırda register edilmesı lazım
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.questionData?.data?.questions?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = questionData?.data?.questions?[indexPath.row].question
        return cell!
    }
}
