//
//  ViewController.swift
//  IntroduceYourFamily
//
//  Created by Ethan Archibald on 9/21/23.
//

import UIKit

struct FamilyMember {
    var name: String
    var pictureAssetName: String
    var moreInfo: String
}

let me = FamilyMember(name: "Ethan", pictureAssetName: "ethanDetails", moreInfo: "Yup this is me. I am 21 years old. I've lived in Lehi my whole life. I like to go swimming and relaxing on the beach")
let dad = FamilyMember(name: "Jason", pictureAssetName: "daddetails", moreInfo: "This is my Dad. He was born in northern Utah, He went to Utah State for College. Now he works for Adobe here in Lehi. He always has a project to work on and loves completing them")
let mom = FamilyMember(name: "Susan", pictureAssetName: "momDetails", moreInfo: "This is my Mom. She was born in Idaho. She works as a kindergarden teachers aid. she loves to go on vacation and relax")
let braxson = FamilyMember(name: "Braxson", pictureAssetName: "braxsonDetail", moreInfo: "This is my older brother Braxson. He is living in Eagle Mountain with his wife Kirsten. They have been married for about 2 years now. He works for a AC company I think, He never really talks to me about his work.")
let logan = FamilyMember(name: "Logan", pictureAssetName: "loganDetails", moreInfo: "This is my younger brother Logan. He just graduated high school and now is going to UVU for audio and visual design. He loves to stay at home and do nothing which is funny because now he is actually doing stuff like doordash.")
let alli = FamilyMember(name: "Allison", pictureAssetName: "alliDetails", moreInfo: "This is my youngest sister Alli. Yes she is spoiled. she is going to Lehi High School right now and is doing dance and color guard. She loves bothering me to get her food.")



class ViewController: UIViewController {

    var selectedFamilyMember: FamilyMember?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func ethanButtonPressed(_ sender: Any) {
        selectedFamilyMember = me
        performSegue(withIdentifier: "toDetails", sender: (Any).self)
    }
    @IBAction func dadButtonPress(_ sender: Any) {
        selectedFamilyMember = dad
        performSegue(withIdentifier: "toDetails", sender: (Any).self)
    }
    @IBAction func momButtonPress(_ sender: Any) {
        selectedFamilyMember = mom
        performSegue(withIdentifier: "toDetails", sender: (Any).self)
    }
    @IBAction func braxsonButtonPress(_ sender: Any) {
        selectedFamilyMember = braxson
        performSegue(withIdentifier: "toDetails", sender: (Any).self)
    }
    @IBAction func loganButtonPress(_ sender: Any) {
        selectedFamilyMember = logan
        performSegue(withIdentifier: "toDetails", sender: (Any).self)
    }
    @IBAction func alliButtonPress(_ sender: Any) {
        selectedFamilyMember = alli
        performSegue(withIdentifier: "toDetails", sender: (Any).self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? DetailsViewController
        destination?.familyMember = selectedFamilyMember
    }
    
}

