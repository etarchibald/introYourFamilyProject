//
//  DetailsViewController.swift
//  IntroduceYourFamily
//
//  Created by Ethan Archibald on 9/22/23.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var detailsImageView: UIImageView!
    @IBOutlet weak var moreInfoLable: UILabel!
    
    var familyMember: FamilyMember?
    
    init?(coder: NSCoder, familyMember: FamilyMember) {
        self.familyMember = familyMember
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    
    func updateUI() {
        
        guard let familyMember else { return } // handle edge cases later
        nameLable.text = familyMember.name
        
        let familyMemberImage = UIImage(named: familyMember.pictureAssetName)
       
        if familyMemberImage == nil {
            detailsImageView.image = familyMember.pictureAssetName.imageFromBase64
        } else {
            detailsImageView.image = familyMemberImage
        }
        
        moreInfoLable.text = familyMember.moreInfo
        
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

extension String {
    var imageFromBase64: UIImage? {
        guard let imageData = Data(base64Encoded: self) else { return nil }
        return UIImage(data: imageData)
    }
}
