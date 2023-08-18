//
//  ListLottieViewController.swift
//  Everything Everywhere All at Once
//
//  Created by Руслан Штыбаев on 19.06.2023.
//

import UIKit

class ListLottieViewController: UIViewController {
    
    let listLottie = [
        "Day Night Switch",
        "Onboarding Second Part",
        "Onboarding First Part",
        "Full Onboarding"
    ]

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

private extension ListLottieViewController {
    
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


extension ListLottieViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listLottie.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TVCell", for: indexPath)
        cell.backgroundColor = .white
        let testName = listLottie[indexPath.row]
        cell.textLabel?.text = testName
        cell.textLabel?.textColor = .black
        return cell
    }
  
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            present(LottieViewController())
        case 1:
            present(OnboardingViewController())
        case 2:
            present(FirstOnbPartViewController())
        default:
            print("OOOps")
        }
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
