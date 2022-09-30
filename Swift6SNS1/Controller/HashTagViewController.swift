//
//  HashTagViewController.swift
//  Swift6SNS1
//
//  Created by 野澤英二郎 on 2021/03/30.
//

import UIKit
import SDWebImage

class HashTagViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,LoadOKDelegate {
    
    
    
    
    
    var hashTag = String()
    
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var topImageView: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var loadDBModel = LoadDBModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        loadDBModel.loadOKDelegate = self
        self.navigationItem.title = "#\(hashTag)"
        
        

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        topImageView.layer.cornerRadius = 38
        
        
        loadDBModel.loadHashTag(hashTag: hashTag)
        
        
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        countLabel.text = String(loadDBModel.dataSets.count)
        
        return loadDBModel.dataSets.count
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        let contentImageView = cell.contentView.viewWithTag(1) as! UIImageView
        
        contentImageView.sd_setImage(with: URL(string: loadDBModel.dataSets[indexPath.row].contentImage), completed: nil)
        
        topImageView.sd_setImage(with: URL(string: loadDBModel.dataSets[0].contentImage), completed: nil)
        
        
        return cell
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let detailVC = self.storyboard?.instantiateViewController(identifier: "detailVC") as! DetailViewController
        
        detailVC.userName = loadDBModel.dataSets[indexPath.row].userName
        detailVC.profileImageString = loadDBModel.dataSets[indexPath.row].profileImage
        detailVC.contentImageString = loadDBModel.dataSets[indexPath.row].contentImage
        detailVC.comment = loadDBModel.dataSets[indexPath.row].comment
        
        self.navigationController?.pushViewController(detailVC, animated: true)
        
    }
    
    func loadOK(check: Int) {
        
        if check == 1{
            
            collectionView.reloadData()
            
            
        }
        
        
        
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width/3.0
        let height = width
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
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
