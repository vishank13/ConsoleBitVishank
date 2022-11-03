//
//  ProfileImageViewController.swift
//  ConsoleBitVishank
//
//  Created by Vishank Raghav on 03/11/22.
//

import UIKit

class ProfileImageViewController: UIViewController {
    
    //-----------------------
    // MARK: Outlets
    //-----------------------
    @IBOutlet weak var profileImageView: UIImageView!
    
    //-----------------------
    // MARK: Properties
    //-----------------------
    var profileImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    //-----------------------
    // MARK: SetUp Methods
    //-----------------------
    func setUp() {
        guard let profileImage else { return }
        profileImageView.image = profileImage
    }
}
