//
//  ProfileViewController.swift
//  ProtocolDelegate
//
//  Created by Mospeng Research Lab Philippines on 5/11/20.
//  Copyright © 2020 Mospeng Research Lab Philippines. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var ageLbl: UILabel!

    lazy var rightBarButtonItem =  UIBarButtonItem(image: UIImage(systemName: "square.and.pencil"), style: .done, target: self, action: #selector(rightBarBtnItemITapped))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
        self.navigationItem.title = "Profile"
    }

    @objc func rightBarBtnItemITapped() {
        guard let storyboard = self.storyboard?.instantiateViewController(withIdentifier: "SettingsViewController") else {return }
        let settings = storyboard as! SettingsViewController
        settings.delegate = self
        self.navigationController?.pushViewController(settings, animated: true)
    }
    
    func apply(_ profile: ProfileModel) {
        nameLbl.text = profile.name
        ageLbl.text = String(profile.age)
    }
    
}

extension ProfileViewController: SettingsViewControllerDelegate {
    func didChange(_ profile: ProfileModel) {
        apply(profile)
    }
}
