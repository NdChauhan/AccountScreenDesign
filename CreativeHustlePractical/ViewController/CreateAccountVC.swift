//
//  CreateAccountVC.swift
//  CreativeHustlePractical
//
//  Created by Nidhi Chauhan on 12/07/23.
//

import UIKit
import StepIndicator

class CreateAccountVC: UIViewController {
    
    //MARK: Veriables & OUtlets
    
    @IBOutlet weak var titleGradiantView: UIView!
    @IBOutlet weak var rewardsView: UIView!
    @IBOutlet weak var accountView: UIView!
    @IBOutlet weak var stepindicatorView: StepIndicatorView!
    @IBOutlet weak var accountCollectionView: UICollectionView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    var arrTypeOfAccount = [Profile]()
    var selectedAccount : Profile?
    
    //MARK: ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupDesign()
        setupGradiauntView()
        addDataintoArray()
    }
    
    //MARK: function AdddataintoArray
    
    func addDataintoArray() {
        let freeMium = Profile(title: "Freemium", id: 0, isSelected: true, imgName: "icn_freemium")
        let premium = Profile(title: "Premium", id: 1, isSelected: false, imgName: "icn_premium")
        let business = Profile(title: "Business", id: 2, isSelected: false, imgName: "icn_bussiness")
        let celebrity = Profile(title: "Celebrity", id: 3, isSelected: false, imgName: "icn_celebrity")
        self.arrTypeOfAccount.append(freeMium)
        self.arrTypeOfAccount.append(premium)
        self.arrTypeOfAccount.append(business)
        self.arrTypeOfAccount.append(celebrity)
        self.selectedAccount = freeMium
    }
    
    //MARK: function setupdesign
    
    func setupDesign() {
        self.titleGradiantView.layer.cornerRadius = 20
        self.rewardsView.layer.cornerRadius = 15
        self.rewardsView.backgroundColor = UIColor.black.withAlphaComponent(0.1)
        self.loginButton.titleLabel?.font = UIFont.init(name: "Poppins-Medium", size: 16)
        self.nextButton.titleLabel?.font = UIFont.init(name: "Poppins-Bold", size: 20)
        self.accountView.layer.shadowColor = UIColor.black.cgColor
        self.accountView.layer.shadowOpacity = 0.2
        self.accountView.layer.shadowOffset = .zero
        self.accountView.layer.cornerRadius = 20
        self.nextButton.applyGradient(colors: [UIColor(red: 155.0/255.0, green: 39.0/255.0, blue: 180.0/255.0, alpha: 1).cgColor, UIColor(red: 8.0/255.0, green: 189.0/255.0, blue: 205.0/255.0, alpha: 1).cgColor])
    }
    
    //MARK: function setgradiuntView
    
    func setupGradiauntView() {
        self.titleGradiantView.backgroundColor = .white
        // Create a new gradient layer
        let gradientLayer = CAGradientLayer()
        
        let topColor = UIColor(red: 155.0/255.0, green: 39.0/255.0, blue: 180.0/255.0, alpha: 1).cgColor
        let bottomColor =  UIColor(red: 8.0/255.0, green: 189.0/255.0, blue: 205.0/255.0, alpha: 1).cgColor
        
        // Set the colors and locations for the gradient layer
        gradientLayer.colors = [topColor,bottomColor]
        gradientLayer.locations = [0.0, 1.0]
        // Set the frame to the layer
        gradientLayer.frame = self.titleGradiantView.frame
        
        // Add the gradient layer as a sublayer to the background view
        self.titleGradiantView.layer.insertSublayer(gradientLayer, at: 0)
    }
}

//MARK: Collectionview methods

extension CreateAccountVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrTypeOfAccount.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AccountCell", for: indexPath) as! AccountCell
        let currentAccount = arrTypeOfAccount[indexPath.row]
        cell.ImgView.image = UIImage(named: currentAccount.imgName)
        cell.bgView.layer.cornerRadius = 10
        if currentAccount.isSelected {
            cell.bgView.layer.borderColor = UIColor(named: "StepSelectColor")?.cgColor
            cell.buttonSelect.setImage(UIImage(named: "icn_select"), for: .normal)
            cell.bgView.layer.borderWidth = 2.0
        } else {
            cell.bgView.layer.borderWidth = 0
            cell.buttonSelect.setImage(UIImage(named: "icn_unselect"), for: .normal)
        }
        cell.lblTitle.text = currentAccount.title
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width/2) - 5, height: 130)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if selectedAccount?.id != indexPath.row {
            self.selectedAccount = arrTypeOfAccount[indexPath.row]
        }
        
        arrTypeOfAccount.forEach { profile in
            if profile.id == indexPath.row {
                profile.isSelected = true
            } else {
                profile.isSelected = false
            }
        }
        
        self.accountCollectionView.reloadData()
    }
}
