//
//  ViewController.swift
//  Photoediting
//
//  Created by Ripon sk on 15/10/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var slider: UISlider!
    var x:Float = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        slider.minimumValue = 0.0
        slider.maximumValue = 1.0
        img.image = UIImage(named: "n1")
//
        print(x)
        // Do any additional setup after loading the view.
    }
    func chnageOpacity(val:Float){
        img.layer.opacity = val
    }
   
    
    @IBAction func tapBtn(_ sender: Any) {
        UIImageWriteToSavedPhotosAlbum(view1.imgs, nil, nil, nil)
    }
   
    
    @IBAction func sliderTap(_ sender: UISlider) {
        x = slider.value
        lbl.text = sender.value.description
        chnageOpacity(val: slider.value)
    }
    
}

extension UIView{
    var imgs:UIImage{
        let ren = UIGraphicsImageRenderer(bounds: bounds)
        return ren.image { ctxt in
            self.layer.render(in: ctxt.cgContext)
        }
    }
}
