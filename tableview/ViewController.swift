//
//  ViewController.swift
//  tableview
//
//  Created by Sergey Mushenko on 09.11.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var labelMark: UILabel!
    
    @IBOutlet weak var labelModel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    var mark = ""
    var model = ""
    var image = ""
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        labelMark.text = mark
        labelModel.text = model
        imageView.image = UIImage(named: image)
        
        
    }



}

