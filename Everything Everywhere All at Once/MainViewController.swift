//
//  ViewController.swift
//  Everything Everywhere All at Once
//
//  Created by Руслан Штыбаев on 12.06.2023.
//

import UIKit

class MainViewController: UIViewController {

    //MARK: - UI elements
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.backgroundColor = .clear
        table.register(UITableViewCell.self, forCellReuseIdentifier: "TVCell")
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
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
private extension MainViewController {
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
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        MainTittleList.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TVCell", for: indexPath)
        cell.backgroundColor = .white
        let testName = MainTittleList.allCases[indexPath.row].tittle
        cell.textLabel?.text = testName
        cell.textLabel?.textColor = .black
        return cell
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch MainTittleList.allCases[indexPath.row] {
            
        case .lottie:
            present(ListLottieViewController())
        case .second:
            present(SimpleViewController())
        case .third:
            present(CircleViewController())
        case .four:
            return print("Nothing")
        }
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
