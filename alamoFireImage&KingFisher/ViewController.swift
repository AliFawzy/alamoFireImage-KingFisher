//
//  ViewController.swift
//  alamoFireImage&KingFisher
//
//  Created by ALY on 8/12/20.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit
import AlamofireImage
import Kingfisher

class ViewController: UIViewController {
    @IBOutlet weak var img: UIImageView!
    let url = URL(string:"https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRa_NE7cHQkudVWUIB5nw6h025k-Ootj3n3xzJIHNC1UmL_9mDj")
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //MARK:- IBAction
    @IBAction func getImgeBtnAction(_ sender: UIButton) {
       if sender.tag == 0{
           self.getImage()
        }else if sender.tag == 1{
            alamoFireGetImage()
        }else{
            kingFisherGetImage()
        }
    }
    
    //MARK:- Helper function
    func getImage()  {
        let data = try! Data(contentsOf: url!)
        self.img.image = UIImage(data: data)
    }
    func alamoFireGetImage()  {
        let filter = AspectScaledToFillSizeWithRoundedCornersFilter(size: img.frame.size, radius: 30)
        
        img.af.setImage(
            withURL: url!,
            filter: filter,
            imageTransition: .flipFromTop(0.5))
    }
    func kingFisherGetImage()  {
        
        self.img.kf.setImage(with: url, options: [.transition(.flipFromBottom(0.5))])
    }
    
}

