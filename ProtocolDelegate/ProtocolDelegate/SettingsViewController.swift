//
//  SettingsViewController.swift
//  ProtocolDelegate
//
//  Created by Mospeng Research Lab Philippines on 5/11/20.
//  Copyright © 2020 Mospeng Research Lab Philippines. All rights reserved.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func didChange(_ profile: ProfileModel)
}

class SettingsViewController: UIViewController {

    @IBOutlet weak var nameTxtvw: UITextField!
    @IBOutlet weak var ageTxtvw: UITextField!
    
    var delegate: SettingsViewControllerDelegate?
    
    lazy var rightBarButtonItem =  UIBarButtonItem(image: UIImage(systemName: "checkmark.square"), style: .done, target: self, action: #selector(rightBarBtnItemITapped))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
        self.navigationItem.title = "Settings"
        self.navigationItem.setHidesBackButton(true, animated: false)
    }
    
    @objc func rightBarBtnItemITapped() {
        let profile = ProfileModel(name: nameTxtvw?.text ?? "", age: Int(ageTxtvw?.text ?? "") ?? 0)
        delegate!.didChange(profile)
        self.navigationController?.popViewController(animated: true)
    }
}
