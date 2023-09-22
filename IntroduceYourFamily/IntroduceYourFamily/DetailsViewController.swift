//
//  DetailsViewController.swift
//  IntroduceYourFamily
//
//  Created by Ethan Archibald on 9/22/23.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var dadView: UIView!
    @IBOutlet weak var momView: UIView!
    @IBOutlet weak var braxsonView: UIView!
    @IBOutlet weak var ethanView: UIView!
    @IBOutlet weak var loganView: UIView!
    @IBOutlet weak var alliView: UIView!
    
    var showDad = false
    var showMom = false
    var showBraxson = false
    var showEthan = false
    var showLogan = false
    var showAlli = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUi()
    }
    
    func updateUi() {
        if showDad {
            dadView.isHidden = false
        }
        if showMom {
            momView.isHidden = false
        }
        if showBraxson {
            braxsonView.isHidden = false
        }
        if showEthan {
            ethanView.isHidden = false
        }
        if showLogan {
            loganView.isHidden = false
        }
        if showAlli {
            alliView.isHidden = false
        }
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
