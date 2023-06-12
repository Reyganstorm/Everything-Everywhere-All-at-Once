//
//  ViewController.swift
//  Everything Everywhere All at Once
//
//  Created by Руслан Штыбаев on 12.06.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private let testList = [
        "First",
        "Second",
        "Third",
        "Four",
        "Five"
    ]

    //MARK: - UI elements
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.backgroundColor = .yellow
        table.register(UITableViewCell.self, forCellReuseIdentifier: "TVCell")
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Scenarios"
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        }
        addViews()
        layoutViews()
        configure()
    }
    
}

//MARK: - Private methods
private extension ViewController {
    func addViews() {
        view.addSubview(tableView)
    }
    
    func layoutViews() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func configure() {
        tableView.dataSource = self
        tableView.delegate = self
    }
   
//    func makeSomething() {
//        let vc = TestViewController()
//        vc.modalPresentationStyle = .fullScreen
//        present(vc, animated: true)
//    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        testList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TVCell", for: indexPath)
        cell.backgroundColor = .white
        let testName = testList[indexPath.row]
        cell.textLabel?.text = testName
        cell.textLabel?.textColor = .black
        return cell
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {

        }
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
