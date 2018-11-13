//
//  LaunchViewController.swift
//  Sporkly
//
//  Created by Samuel J. Lee on 10/19/18.
//  Copyright © 2018 Samuel J. Lee. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController, UIViewControllerTransitioningDelegate {

    @IBOutlet weak var countingLabel: CountingLabel!

    let shapeLayer = CAShapeLayer()
    let transition = CircularTransition()

    override func viewDidLoad() {
        super.viewDidLoad()

        let center = view.center
        let trackLayer = CAShapeLayer()

        let circularPath = UIBezierPath(arcCenter: center, radius: 70, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)

        trackLayer.path = circularPath.cgPath

        trackLayer.strokeColor = UIColor.red.cgColor
        trackLayer.lineWidth = 6
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.lineCap = CAShapeLayerLineCap.round
        view.layer.addSublayer(trackLayer)

        shapeLayer.path = circularPath.cgPath

        shapeLayer.strokeColor = UIColor.white.cgColor
        shapeLayer.lineWidth = 6
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = CAShapeLayerLineCap.round

        shapeLayer.strokeEnd = 0

        view.layer.addSublayer(shapeLayer)
        fillCircle()
        countingLabel.count(fromValue: 0, to: 100, withDuration: 0.8, andAnimationType: .Linear, andCountingType: .Int)

        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
            self.performSegue(withIdentifier: "bluetooth", sender: self)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let sporklyVC = segue.destination as! BluetoothForMenuViewController
        sporklyVC.transitioningDelegate = self
        sporklyVC.modalPresentationStyle = .custom
    }

    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .present
        transition.startingPoint = self.view.center
        transition.circleColor = self.view.backgroundColor!
        return transition
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .dismiss
        transition.startingPoint = self.view.center
        transition.circleColor = self.view.backgroundColor!

        return transition
    }

    func fillCircle() {
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")

        basicAnimation.toValue = 1

        basicAnimation.duration = 0.9

        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        basicAnimation.isRemovedOnCompletion = false

        shapeLayer.add(basicAnimation, forKey: "basicAnimation")
    }
}
