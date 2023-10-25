//
//  FamilyTableViewController.swift
//  IntroduceYourFamily
//
//  Created by Ethan Archibald on 10/25/23.
//

import UIKit

class FamilyTableViewController: UITableViewController {
    
    var selectedFamilyMember = [
    FamilyMember(name: "Ethan", pictureAssetName: "ethanDetails", moreInfo: "Yup this is me. I am 21 years old. I've lived in Lehi my whole life. I like to go swimming and relaxing on the beach"),
    FamilyMember(name: "Jason", pictureAssetName: "daddetails", moreInfo: "This is my Dad. He was born in northern Utah, He went to Utah State for College. Now he works for Adobe here in Lehi. He always has a project to work on and loves completing them"),
    FamilyMember(name: "Susan", pictureAssetName: "momDetails", moreInfo: "This is my Mom. She was born in Idaho. She works as a kindergarden teachers aid. she loves to go on vacation and relax"),
    FamilyMember(name: "Braxson", pictureAssetName: "braxsonDetail", moreInfo: "This is my older brother Braxson. He is living in Eagle Mountain with his wife Kirsten. They have been married for about 2 years now. He works for a AC company I think, He never really talks to me about his work."),
    FamilyMember(name: "Logan", pictureAssetName: "loganDetails", moreInfo: "This is my younger brother Logan. He just graduated high school and now is going to UVU for audio and visual design. He loves to stay at home and do nothing which is funny because now he is actually doing stuff like doordash."),
    FamilyMember(name: "Allison", pictureAssetName: "alliDetails", moreInfo: "This is my youngest sister Alli. Yes she is spoiled. she is going to Lehi High School right now and is doing dance and color guard. She loves bothering me to get her food.")]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let addFamilyTVC = segue.destination as? AddFamilyMemberTableViewController else { return }
        
        addFamilyTVC.delagate = self
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return selectedFamilyMember.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "family", for: indexPath) as! FamilyTableViewCell
        
        let familyMember = selectedFamilyMember[indexPath.row]
        
        cell.familyMemberNameLabel.text = familyMember.name
        
        // Configure the cell...
        
        return cell
        
    }
    
    @IBSegueAction func toDetails(_ coder: NSCoder, sender: Any?) -> DetailsViewController? {
        guard let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) else { return nil }
        
        let selectedFamilyMember = selectedFamilyMember[indexPath.row]
        
        return DetailsViewController(coder: coder, familyMember: selectedFamilyMember)
    }
    
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.selectedFamilyMember.remove(at: indexPath.row)
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

extension FamilyTableViewController: NewFamilyMember {
    func newFamilyMember(name: String, picture: String, moreInfo: String) {
        selectedFamilyMember.append(FamilyMember(name: name, pictureAssetName: picture, moreInfo: moreInfo))
    }
}


//extension UIView {
//    func addBackground(imageName:String) {
//
//        let width = UIScreen.main.bounds.size.width
//        let height = UIScreen.main.bounds.size.height
//
//        let imageViewBackground = UIImageView(frame: CGRectMake(0, 0, width, height))
//        imageViewBackground.image = UIImage(named: imageName)
//
//        imageViewBackground.contentMode = UIView.ContentMode.scaleAspectFill
//
//        self.addSubview(imageViewBackground)
//        self.sendSubviewToBack(imageViewBackground)
//    }
//}
