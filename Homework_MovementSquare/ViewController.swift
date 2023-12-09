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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupJoystickView()
        
        
    }

    func setupJoystickView() {
        view.addSubview(joystickView)
        
        NSLayoutConstraint.activate([
        
            joystickView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            joystickView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50)
            
        ])
        
        joystickView.closureButtonUp = { [weak self] _ in
           
        }
        
        joystickView.closureButtonDown = { [weak self] _ in
            
        }
        
        joystickView.closureButtonLeft = { [weak self] _ in
            
        }
        
        joystickView.closureButtonRight = { [weak self] _ in
           
        }
    }

}

