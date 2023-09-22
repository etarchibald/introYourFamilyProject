//
//  ViewController.swift
//  IntroduceYourFamily
//
//  Created by Ethan Archibald on 9/21/23.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? DetailsViewController
        if segue.identifier == "showDadSegue" {
            destination!.showDad = true
        }
        if segue.identifier == "showMomSegue" {
            destination!.showMom = true
        }
        if segue.identifier == "showBraxSegue" {
            destination!.showBraxson = true
        }
        if segue.identifier == "showEthanSegue" {
            destination!.showEthan = true
        }
        if segue.identifier == "showLoganSegue" {
            destination!.showLogan = true
        }
        if segue.identifier == "showAlliSegue" {
            destination!.showAlli = true
        }
    }
    
}

