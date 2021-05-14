//
//  FaciTableViewController.swift
//  Kosodate
//
//  Created by Rienhardt on 2018/6/21.
//  Copyright © 2018年 Richard Han. All rights reserved.
//

import UIKit

class FaciTableViewController: UITableViewController , UISearchResultsUpdating{
   
    
   var babyflats: [Babyflat] = []
    var sc: UISearchController!
    var searchResults: [Babyflat] = []
    
    func searchFilter(text: String){
        searchResults = babyflats.filter({ (babyflat) -> Bool in
            return babyflat.FIELD3.localizedCaseInsensitiveContains(text)
        })
    }
//    var babyflats = [Babyflat(FIELD1: "千代田区", FIELD2: "JR秋葉原駅", FIELD3: "いずみこどもプラザ", FIELD4: "千代田区", FIELD5: "千代田区神田和泉町１　ちよだパークサイドプラザ６階", FIELD6: "月～土", FIELD7: "9:00～17:00", FIELD8: "", FEILD9: false, rating: ""),Babyflat(FIELD1: "中央区", FIELD2: "地下鉄日比谷線・都営浅草線人形町駅、地下鉄半蔵門線水天宮駅、都営新宿線浜町駅", FIELD3: "中央区立浜町児童館", FIELD4: "中央区", FIELD5: "中央区日本橋浜町３－３７－１", FIELD6: "全日\n（祝日及び年末年始を除く）", FIELD7: "9:00～17:00", FIELD8: "", FEILD9: false, rating: ""),Babyflat(FIELD1: "港区", FIELD2: "ゆりかもめ　\nお台場海浜公園又は台場駅", FIELD3: "東京都立お台場海浜公園", FIELD4: "東京都港湾局", FIELD5: "港区台場一丁目", FIELD6: "全日", FIELD7: "9:00～18:00", FIELD8: "", FEILD9: false, rating: "")]
//
    
    
  

    
    
    
    @IBAction func favBtnTap(_ sender: UIButton) {
        let btnPos = sender.convert(CGPoint.zero, to: self.tableView)
        print("爱心所在tableview中的位置",btnPos)
        let indexPath = tableView.indexPathForRow(at: btnPos)!

        print("爱心所在行", indexPath)
       self.babyflats[indexPath.row].FEILD9 = !self.babyflats[indexPath.row].FEILD9

        let cell = tableView.cellForRow(at: indexPath) as! CardCell
        
        cell.favorite = self.babyflats[indexPath.row].FEILD9
       
        
    }//收藏交互
  
//    func saveToJson() {
//       let coder = JSONEncoder()
//    do {
//            let data = try coder.encode(babyflats)
//            let saveUrl = URL(fileURLWithPath: NSHomeDirectory()).appendingPathComponent("babyflat.json")
//            try data.write(to: saveUrl)
//            print("保存成功！路径:", saveUrl)
//        } catch {
//           print("编码错误", error)        }
//    }

    
    
  func loadJson() {
       let coder = JSONDecoder()

      do{
           let url = Bundle.main.url(forResource: "babyflat", withExtension: "json")!
            let data = try Data(contentsOf: url)
            babyflats = try coder.decode([Babyflat].self, from: data)
        }
        catch{
            print("解码错误",error)

        }
   }
    
    func updateSearchResults(for searchController: UISearchController) {
        if var text = searchController.searchBar.text{
            text = text.trimmingCharacters(in: .whitespaces)
            searchFilter(text: text)
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        navigationController?.navigationBar.largeTitleTextAttributes = [
//            NSAttributedStringKey.foregroundColor : UIColor(named: "theme")!
//        ]
        
       loadJson()
//        saveToJson()
    
   
 
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        sc = UISearchController(searchResultsController: nil)
        sc.searchResultsUpdater = self
        tableView.tableHeaderView = sc.searchBar
        sc.dimsBackgroundDuringPresentation = false
        sc.searchBar.searchBarStyle = .minimal
        sc.searchBar.placeholder = "施設検索する..."
    }
    
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

 

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return sc.isActive ? searchResults.count : babyflats.count
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let id = String(describing: CardCell.self)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: id, for: indexPath) as! CardCell
        
        
        let babyflat = sc.isActive ? searchResults[indexPath.row] : babyflats[indexPath.row]
        // Configure the cell...
        cell.nameLabel.text  = babyflat.FIELD3
        cell.stationLabel.text = babyflat.FIELD2
        cell.LocaLabel.text = babyflat.FIELD5
        cell.backImageView.image = UIImage(named: babyflat.FIELD1)
        cell.favorite = babyflat.FEILD9
        
        cell.accessoryType = babyflat.FEILD9 ? .checkmark : .none
        return cell
    }

    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let shareAction = UIContextualAction(style: .normal, title: "共有")
        {
            (_, _, completion) in
            let text = "ここは\(self.babyflats[indexPath.row].FIELD3)施設、所在地\(self.babyflats[indexPath.row].FIELD5)"
            let image = UIImage(named: self.babyflats[indexPath.row].FIELD1)!
            let ac = UIActivityViewController(activityItems: [text, image], applicationActivities: nil)
            
            if let pc = ac.popoverPresentationController {
                if let cell = tableView.cellForRow(at: indexPath) {
                    pc.sourceView = cell
                    pc.sourceRect = cell.bounds
                    
                }
                
            }
            
            self.present(ac, animated: true)
            
            completion(true)
        }
        
        shareAction.backgroundColor = UIColor.orange
        let config = UISwipeActionsConfiguration(actions: [shareAction])
        return config
    }

   
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return !sc.isActive
    }
 

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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
   
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showLocaDetail" {
    
        
        let row = tableView.indexPathForSelectedRow!.row
        let destination = segue.destination as! DetailController
            destination.babyflat = sc.isActive ? searchResults[row] :
            babyflats[row]
        }
        
     
     // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
