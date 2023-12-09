//
//  ViewController.swift
//  Homework_MovementSquare
//
//  Created by Vlad on 9.12.23.
//

import UIKit
import SwiftUI

//struct ViewControllerProvider: PreviewProvider {
//    static var previews: some View {
//        ViewController().showPreview()
//    }
//}

class ViewController: UIViewController {
    
    let joystickView = {
        let joystickView = JoystickView()
        joystickView.translatesAutoresizingMaskIntoConstraints = false
        
        return joystickView
    }()
    
    let movingView = {
        let movingView = UIView(frame: .init(x: .zero, y: .zero, width: 50, height: 50))
        movingView.translatesAutoresizingMaskIntoConstraints = false
        movingView.backgroundColor = .green
        
        return movingView
    }()
    
    var originalPointMovingView: CGRect!
    var moveStep: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupJoystickView()
        setupMovingView()
      
    }

    func setupJoystickView() {
        view.addSubview(joystickView)
        
        NSLayoutConstraint.activate([
        
            joystickView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            joystickView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50)
            
        ])
        
        joystickView.closureButtonUp = { [weak self] _ in
            UIView.animate(withDuration: 1) {
                self!.movingView.center.y = self!.movingView.center.y - self!.moveStep
            } completion: { _ in
                UIView.animate(withDuration: 1) {
                    self!.disappearingJoystick()
                }
            }

        }
        
        joystickView.closureButtonDown = { [weak self] _ in
            UIView.animate(withDuration: 1) {
                self!.movingView.center.y = self!.movingView.center.y + self!.moveStep
            } completion: { _ in
                UIView.animate(withDuration: 1) {
                    self!.disappearingJoystick()
                }
            }
        }
        
        joystickView.closureButtonLeft = { [weak self] _ in
            UIView.animate(withDuration: 1) {
                self!.movingView.center.x = self!.movingView.center.x - self!.moveStep
            } completion: { _ in
                UIView.animate(withDuration: 1) {
                    self!.disappearingJoystick()
                }
            }
        }
        
        joystickView.closureButtonRight = { [weak self] _ in
            UIView.animate(withDuration: 1) {
                self!.movingView.center.x = self!.movingView.center.x + self!.moveStep
            } completion: { _ in
                UIView.animate(withDuration: 1) {
                    self!.disappearingJoystick()
                }
            }
        }
        
       
        
    }
    
    func setupMovingView() {
        
        view.addSubview(movingView)
        movingView.center = view.center
        originalPointMovingView = self.movingView.frame
        moveStep = movingView.frame.height
    }
    
    func disappearingJoystick() {
        if self.movingView.frame.intersects(self.joystickView.frame) == true {
            self.joystickView.isHidden = true
        }
        
        if self.movingView.frame.minX <= self.view.safeAreaLayoutGuide.layoutFrame.minX {
            self.joystickView.isHidden = true
        }
        
        if self.movingView.frame.maxX >= self.view.safeAreaLayoutGuide.layoutFrame.maxX {
            self.joystickView.isHidden = true
        }
        
        if self.movingView.frame.minY <= self.view.safeAreaLayoutGuide.layoutFrame.minY {
            self.joystickView.isHidden = true
        }
        
        if self.movingView.frame.maxY >= self.view.safeAreaLayoutGuide.layoutFrame.maxY {
            self.joystickView.isHidden = true
        }
        
        
    }
    
    

}

