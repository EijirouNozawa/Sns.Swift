//
//  DetailViewController.swift
//  Swift6SNS1
//
//  Created by 野澤英二郎 on 2021/03/30.
//

import UIKit
import SDWebImage

class DetailViewController: UIViewController {
    
    var userName = String()
    var profileImageString = String()
    var contentImageString = String()
    var comment = String()
    
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var contentImageView: UIImageView!
    
    @IBOutlet weak var commentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileImageView.layer.cornerRadius = 45
        profileImageView.sd_setImage(with: URL(string: profileImageString), completed: nil)
        userNameLabel.text = userName
        contentImageView.sd_setImage(with: URL(string: contentImageString), completed: nil)
        commentLabel.text = comment
        
        
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
