//
//  ViewController.swift
//  ofo-demo
//
//  Created by YuXiang on 20/03/2018.
//  Copyright © 2018 YuXiang. All rights reserved.
//

import UIKit
import SWRevealViewController

class ViewController: UIViewController,MAMapViewDelegate {
    var mapView : MAMapView!

    @IBOutlet weak var panelView: UIView!
    @IBAction func positionButtonTap(_ sender: UIButton) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // 高德地图相关
        mapView = MAMapView(frame:view.bounds)
        mapView.delegate = self
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        view.addSubview(mapView)
//        底部操作面板
        view.bringSubview(toFront: panelView)
        // 顶部标题相关
        self.navigationItem.titleView = UIImageView(image:#imageLiteral(resourceName: "ofoLogo"))
        self.navigationItem.leftBarButtonItem?.image=#imageLiteral(resourceName: "leftTopImage").withRenderingMode(.alwaysOriginal)
        self.navigationItem.rightBarButtonItem?.image=#imageLiteral(resourceName: "rightTopImage").withRenderingMode(.alwaysOriginal)
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        // 侧边栏相关
        if let revealVC = revealViewController() {
            revealVC.rearViewRevealWidth = 280
            navigationItem.leftBarButtonItem?.target = revealVC
            navigationItem.leftBarButtonItem?.action = #selector(SWRevealViewController.revealToggle(_:))
            view.addGestureRecognizer(revealVC.panGestureRecognizer())
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

