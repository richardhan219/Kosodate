//
//  DetailController.swift
//  Kosodate
//
//  Created by Rienhardt on 2018/6/21.
//  Copyright © 2018年 Richard Han. All rights reserved.
//

import UIKit

class DetailController: UITableViewController {

    @IBOutlet weak var hearderImageView: UIImageView!
    
    var babyflat : Babyflat!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        hearderImageView.image = UIImage(named: babyflat.FIELD1)
        navigationItem.largeTitleDisplayMode = .never
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 7
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = String(describing: DetailCell.self)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! DetailCell
        
        switch indexPath.row {
        case 0:
            cell.fieldLabel.text = "最寄駅"
            cell.valueLabel.text = babyflat.FIELD2
        case 1:
            cell.fieldLabel.text = "施設名"
            cell.valueLabel.text = babyflat.FIELD3
        case 2:
            cell.fieldLabel.text = "整置者"
            cell.valueLabel.text = babyflat.FIELD4
        case 3:
            cell.fieldLabel.text = "所在地"
            cell.valueLabel.text = babyflat.FIELD5
        case 4:
            cell.fieldLabel.text = "利用可能日"
            cell.valueLabel.text = babyflat.FIELD6
        case 5:
            cell.fieldLabel.text = "利用時間"
            cell.valueLabel.text = babyflat.FIELD7
        default:
            cell.fieldLabel.isHidden = true
            cell.valueLabel.text = babyflat.FIELD8
        }

        

        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showmap" {
            let destVC = segue.destination as! MapViewController
            destVC.area = self.babyflat
        }
    }
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBOutlet weak var ratingBtn: UIButton!
    
    @IBAction func backToDetail(segue: UIStoryboardSegue){
        if let rating = segue.identifier {
            babyflat.rating = rating
            ratingBtn.setTitle("\(rating)つ星", for: .normal)
        }
    }
}
