//
//  HomeVC.swift
//  tableViewInsideCollectionView
//
//  Created by Ahmed on 3/6/20.
//  Copyright © 2020 Ahmed. All rights reserved.
//

import UIKit

class HomeVC: UIViewController ,UITableViewDataSource,UITableViewDelegate {

    var imgArr = [("watcht"),("watcht"),("watcht"),("watcht"),("watcht"),("watcht"),("watcht"),("watcht"),("watcht"),("watcht"),("watcht"),("watcht"),("watcht"),("watcht"),("watcht"),]
       var nameProduct = [("Product Name Here"),("Product Name Here"),("Product Name Here"),("Product Name Here"),("Product Name Here"),("Product Name Here"),("Product Name Here")]
       var nameStore = [("Store Name"),("Store Name"),("Store Name"),("Store Name"),("Store Name"),("Store Name"),("Store Name")]
       let Price = [("30.000  $"),
                    ("40.000  $"),
                    ("50.000  $"),
                    ("40.000  $"),
                    ("60.000  $"),
                    ("80.000  $"),
                    ("20.000  $")]
    
    var Sectionlbl = [("Hot Offers"),("Section 2"),("Section 3"),("Section 4"),("Section 5"),("Section 6"),("Section 7"),("Section 8"),("Section 9"),("Section 10"),("Section 11"),("Section 12"),("Section 13"),("Section 14"),("Section 15"),]
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCellHome
            //else do {fatalError("Unable to create explore table view cell")}
           cell?.lblSection.text = Sectionlbl[indexPath.row]
        return cell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 323
    }

}

    extension HomeVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 7
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CollectionViewCellHome
            cell!.lblStoreName.text = nameStore[indexPath.row]
            cell!.lblPrice.text = Price[indexPath.row]
            cell!.img.image = UIImage(named: imgArr[indexPath.row])
            cell!.contentView.layer.masksToBounds = true
            cell!.backgroundColor = UIColor.white
            cell!.layer.shadowColor = UIColor.gray.cgColor
            cell!.layer.shadowOffset = CGSize(width: 0, height: 1.0)
            cell!.layer.shadowRadius = 2.0
            cell!.layer.shadowOpacity = 0.5
            cell!.layer.masksToBounds = false
            cell!.layer.shadowPath = UIBezierPath(roundedRect:cell!.bounds, cornerRadius:cell!.contentView.layer.cornerRadius).cgPath
            return cell!
        }
         func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
                
                return CGSize(width: 160, height: 230)
            }
            func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
                return UIEdgeInsets(top: 0, left: 2, bottom: 0, right: 0)
            }
            
            func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
                return 0
            }
            
            func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
                return 10
            }
            
        }
