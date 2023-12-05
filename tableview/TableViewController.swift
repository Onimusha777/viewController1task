//
//  TableViewController.swift
//  tableview
//
//  Created by Sergey Mushenko on 09.11.2023.
//

import UIKit

class TableViewController: UITableViewController {
    
    //let array = [1,2,3,4,5]
    
// var arrayMarks = ["Nissan","Nissan","Toyota","Mazda","Mitsubishi"]
// var arrayModels = ["Skyline","Silvia","Supra","RX-7","EVO"]
// var arrayImage = ["Skyline","Silvia","Supra","RX-7","Evo"]
    
   var arrayCars = [Car(markName: "Nissan", modelName: "Skyline", imageName: "Skyline"),
                    Car(markName: "Nissan", modelName: "Silvia", imageName: "Silvia"),
                    Car(markName: "Toyota", modelName: "Supra", imageName: "Supra"),
                    Car(markName: "Mazda", modelName: "RX-7", imageName: "RX-7"),
                    Car(markName: "Mitsubishi", modelName: "EVO", imageName: "Evo")]
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    @IBAction func addPerson(_ sender: Any) {
//        arrayMarks.append("New Mark")
//        arrayModels.append("New Model")
//        arrayImage.append("Default")
        
        arrayCars.append(Car(markName: "New Mark", modelName: "New Model", imageName: "Default"))
        tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayCars.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        // Configure the cell...
        
        let labelModels = cell.viewWithTag(1000) as! UILabel
        labelModels.text = arrayCars[indexPath.row].markName //нужно почитать, как это работает
        
        let labelMarks = cell.viewWithTag(1001) as! UILabel
        labelMarks.text = arrayCars[indexPath.row].modelName
        
        let imageview = cell.viewWithTag(1002) as! UIImageView
        
        imageview.image = UIImage(named: arrayCars[indexPath.row].imageName)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 89
    }
  
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVc = storyboard?.instantiateViewController(identifier: "detailViewController") as! ViewController
        
        detailVc.mark = arrayCars[indexPath.row].markName
        detailVc.model = arrayCars[indexPath.row].modelName
        detailVc.imageName = arrayCars[indexPath.row].imageName
        
        
        navigationController?.show(detailVc, sender: self)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
//            arrayc.remove(at: indexPath.row)
//            arrayModels.remove(at: indexPath.row)
//            arrayImage.remove(at: indexPath.row)
            
            arrayCars.remove(at: indexPath.row) //?
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
