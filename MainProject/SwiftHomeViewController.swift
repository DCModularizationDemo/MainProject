//
//  SwiftHomeViewController.swift
//  MainProject
//
//  Created by 戴川 on 2020/12/22.
//

import UIKit
import DCSwiftModuleA_Extension
import CTMediator

class SwiftHomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        view.backgroundColor = UIColor.white
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        let kScreenWidth = UIScreen.main.bounds.size.width
        let kScreenHeight = UIScreen.main.bounds.size.height
        tableView.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight - 88)
    }

    // MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            // Swift -> Extension -> Swift
            CTMediator.sharedInstance().DCSwiftModuleA_Extension_ShowSwiftAViewController(viewController: self) { (result) in
                print(result)
            }
        }
        
        if indexPath.row == 1 {
            print("Swift -> Extension -> Objective-C")
            
        }
        
        if indexPath.row == 2 {
            print("Swift -> Category -> Swift")
            
        }
        
        if indexPath.row == 3 {
            // Swift -> Category -> Objective-C
            let viewController = CTMediator.sharedInstance().dcaModule_aViewController()
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.textLabel?.text = dataSource[indexPath.row]
        cell.selectionStyle = .none
    }

    // MARK: UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    }

    // MARK: Getters and Setters
    lazy var tableView : UITableView = {
        let _tableView = UITableView(frame: .zero, style: .plain)
        _tableView.delegate = self
        _tableView.dataSource = self
        _tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return _tableView
    }()

    lazy var dataSource = [
        "Swift -> Extension -> Swift",
        "Swift -> Extension -> Objective-C",
        "Swift -> Category -> Swift",
        "Swift -> Category -> Objective-C"
    ]

    
}
