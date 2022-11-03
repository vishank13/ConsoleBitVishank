//
//  ProfileImageViewController.swift
//  ConsoleBitVishank
//
//  Created by Vishank Raghav on 03/11/22.
//

import UIKit

class ProfileImageViewController: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    
    var profileImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }

    func setUp() {
        guard let profileImage else { return }
        profileImageView.image = profileImage
    }
}
