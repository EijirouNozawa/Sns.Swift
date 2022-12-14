//
//  LoginViewController.swift
//  Swift6SNS1
//
//  Created by 野澤英二郎 on 2021/03/25.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var textField: UITextField!
    
    var urlString = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let checkModel = CheckModel()
        checkModel.showCheckPermission()
        
        

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func login(_ sender: Any) {
        
        Auth.auth().signInAnonymously { (result, error) in
            
            if error != nil{
                return
                }
            
            let user = result?.user
            print(user.debugDescription)
            
            let selectVC = self.storyboard?.instantiateViewController(identifier: "selectVC") as! SelectRoomViewController
            
            UserDefaults.standard.setValue(self.textField.text, forKey: "userName")
            
            let data = self.profileImageView.image?.jpegData(compressionQuality: 0.01)
            
            
       //     self.sendDBModel.sendProfileImageData(data: data!)
            
            self.navigationController?.pushViewController(selectVC, animated: true)
            
            
        }
        
        
        
    }
    
    func doCamera(){
            
            let sourceType:UIImagePickerController.SourceType = .camera
            
            //カメラ利用可能かチェック
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                
                let cameraPicker = UIImagePickerController()
                cameraPicker.allowsEditing = true
                cameraPicker.sourceType = sourceType
                cameraPicker.delegate = self
                self.present(cameraPicker, animated: true, completion: nil)
                
                
            }
            
        }
        
        
        func doAlbum(){
            
            let sourceType:UIImagePickerController.SourceType = .photoLibrary
            
            //カメラ利用可能かチェック
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
                
                let cameraPicker = UIImagePickerController()
                cameraPicker.allowsEditing = true
                cameraPicker.sourceType = sourceType
                cameraPicker.delegate = self
                self.present(cameraPicker, animated: true, completion: nil)
                
                
            }
            
        }
        
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            
            if info[.originalImage] as? UIImage != nil{
                
                let selectedImage = info[.originalImage] as! UIImage
                profileImageView.image = selectedImage
                picker.dismiss(animated: true, completion: nil)
                
            }
            
        }

    
    
    @IBAction func tapImageView(_ sender: Any) {
        
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
        
        showAlert()
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            
            picker.dismiss(animated: true, completion: nil)
            
        }
        
        
        //アラート
        func showAlert(){
            
            let alertController = UIAlertController(title: "選択", message: "どちらを使用しますか?", preferredStyle: .actionSheet)
            
            let action1 = UIAlertAction(title: "カメラ", style: .default) { (alert) in
                
                self.doCamera()
                
            }
            let action2 = UIAlertAction(title: "アルバム", style: .default) { (alert) in
                
                self.doAlbum()
                
            }

            let action3 = UIAlertAction(title: "キャンセル", style: .cancel)
            
            
            alertController.addAction(action1)
            alertController.addAction(action2)
            alertController.addAction(action3)
            self.present(alertController, animated: true, completion: nil)
            
        }
        
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            
            textField.resignFirstResponder()
            
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
