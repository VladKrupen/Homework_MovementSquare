//
//  ViewController.swift
//  Homework_MovementSquare
//
//  Created by Vlad on 9.12.23.
//

import UIKit
import SwiftUI

struct ViewControllerProvider: PreviewProvider {
    static var previews: some View {
        ViewController().showPreview()
    }
}

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
    
    var buttonStartAgain = {
        let buttonStartAgain = UIButton()
        buttonStartAgain.translatesAutoresizingMaskIntoConstraints = false
        buttonStartAgain.setTitle("Start again", for: .normal)
        buttonStartAgain.setTitleColor(.blue, for: .normal)
        buttonStartAgain.alpha = 0
        
        return buttonStartAgain
    }()
    
    var originalPointMovingView: CGRect!
    var moveStep: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupJoystickView()
        setupMovingView()
        setupButtonStartAgain()
      
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
                UIView.animate(withDuration: 0.3) {
                    self!.disappearingJoystick()
                }
            }

        }
        
        joystickView.closureButtonDown = { [weak self] _ in
            UIView.animate(withDuration: 1) {
                self!.movingView.center.y = self!.movingView.center.y + self!.moveStep
            } completion: { _ in
                UIView.animate(withDuration: 0.3) {
                    self!.disappearingJoystick()
                }
            }
        }
        
        joystickView.closureButtonLeft = { [weak self] _ in
            UIView.animate(withDuration: 1) {
                self!.movingView.center.x = self!.movingView.center.x - self!.moveStep
            } completion: { _ in
                UIView.animate(withDuration: 0.3) {
                    self!.disappearingJoystick()
                }
            }
        }
        
        joystickView.closureButtonRight = { [weak self] _ in
            UIView.animate(withDuration: 1) {
                self!.movingView.center.x = self!.movingView.center.x + self!.moveStep
            } completion: { _ in
                UIView.animate(withDuration: 0.3) {
                    self!.disappearingJoystick()
                }
            }
        }
        
       
        
    }
    
    func setupButtonStartAgain() {
        view.addSubview(buttonStartAgain)

        NSLayoutConstraint.activate([
            buttonStartAgain.centerXAnchor.constraint(equalTo: joystickView.centerXAnchor),
            buttonStartAgain.centerYAnchor.constraint(equalTo: joystickView.centerYAnchor)
        ])
        
        buttonStartAgain.addTarget(self, action: #selector(buttonStartAgainTapped), for: .touchUpInside)
    }
    
    func setupMovingView() {
        
        view.addSubview(movingView)
        movingView.center = view.center
        originalPointMovingView = self.movingView.frame
        moveStep = movingView.frame.height
    }
    
    func disappearingJoystick() {
        if self.movingView.frame.intersects(self.joystickView.frame) == true {
            self.joystickView.alpha = 0
            buttonStartAgain.alpha = 1
        }
        
        if self.movingView.frame.minX <= self.view.safeAreaLayoutGuide.layoutFrame.minX {
            self.joystickView.alpha = 0
            buttonStartAgain.alpha = 1
        }
        
        if self.movingView.frame.maxX >= self.view.safeAreaLayoutGuide.layoutFrame.maxX {
            self.joystickView.alpha = 0
            buttonStartAgain.alpha = 1
        }
        
        if self.movingView.frame.minY <= self.view.safeAreaLayoutGuide.layoutFrame.minY {
            self.joystickView.alpha = 0
            buttonStartAgain.alpha = 1
        }
        
        if self.movingView.frame.maxY >= self.view.safeAreaLayoutGuide.layoutFrame.maxY {
            self.joystickView.alpha = 0
            buttonStartAgain.alpha = 1
        }
        
        
    }
    
    
    @objc func buttonStartAgainTapped(_ sender: UIButton) {
        UIView.animate(withDuration: 1) {
            self.buttonStartAgain.alpha = 0
            self.joystickView.alpha = 1
            self.movingView.frame = self.originalPointMovingView
        }
    }
    
    

}

