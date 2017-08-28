//
//  ViewController.swift
//  Demo-iOS
//
//  Created by Arabia -IT on 8/27/17.
//  Copyright © 2017 PocketSVG. All rights reserved.
//

import UIKit
import PocketSVG

class ViewController: UIViewController {
    
    let colors: [UIColor] = [.red, .green, .blue]
    var colorIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func didTapImageView(_ sender: UITapGestureRecognizer) {

        let svgView = sender.view as! SVGImageView
        let point = sender.location(in: svgView)
        
        svgView.paths = svgView.paths.map { path in
            var p: SVGBezierPath = path
            
            if path.contains(point) {
                p = path.settingSVGAttributes(["fill": colors[colorIndex].cgColor])
                colorIndex = (colorIndex + 1) % colors.count
            }
            
            print(point)
            print(p)
            
            return p
        }
    }

}
