//
//  JoystickView.swift
//  Homework_MovementSquare
//
//  Created by Vlad on 9.12.23.
//

import UIKit

class JoystickView: UIView {

    var closureButtonUp: ((JoystickView) -> Void)?
    var closureButtonDown: ((JoystickView) -> Void)?
    var closureButtonLeft: ((JoystickView) -> Void)?
    var closureButtonRight: ((JoystickView) -> Void)?

    let buttonUp = {
        let buttonUp = UIButton()
        buttonUp.translatesAutoresizingMaskIntoConstraints = false
        buttonUp.setBackgroundImage(UIImage(systemName: "arrowtriangle.up.fill"), for: .normal)
        buttonUp.addTarget(self, action: #selector(buttonUpTapped), for: .touchUpInside)
        
        return buttonUp
    }()
    
    let buttonDown = {
        let buttonDown = UIButton()
        buttonDown.translatesAutoresizingMaskIntoConstraints = false
        buttonDown.setBackgroundImage(UIImage(systemName: "arrowtriangle.down.fill"), for: .normal)
        buttonDown.addTarget(self, action: #selector(buttonDownTapped), for: .touchUpInside)
        
        return buttonDown
    }()
    
    let buttonLeft = {
        let buttonLeft = UIButton()
        buttonLeft.translatesAutoresizingMaskIntoConstraints = false
        buttonLeft.setBackgroundImage(UIImage(systemName: "arrowtriangle.left.fill"), for: .normal)
        buttonLeft.addTarget(self, action: #selector(buttonLeftTapped), for: .touchUpInside)
        
        return buttonLeft
    }()
    
    let buttonRight = {
        let buttonRight = UIButton()
        buttonRight.translatesAutoresizingMaskIntoConstraints = false
        buttonRight.setBackgroundImage(UIImage(systemName: "arrowtriangle.right.fill"), for: .normal)
        buttonRight.addTarget(self, action: #selector(buttonRightTapped), for: .touchUpInside)
        
        return buttonRight
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        addSubview(buttonUp)
        addSubview(buttonDown)
        addSubview(buttonLeft)
        addSubview(buttonRight)
        
        NSLayoutConstraint.activate([

            buttonUp.widthAnchor.constraint(equalToConstant: 50),
            buttonUp.heightAnchor.constraint(equalToConstant: 50),
            buttonUp.bottomAnchor.constraint(equalTo: centerYAnchor, constant: -15),
            buttonUp.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            buttonDown.widthAnchor.constraint(equalToConstant: 50),
            buttonDown.heightAnchor.constraint(equalToConstant: 50),
            buttonDown.topAnchor.constraint(equalTo: centerYAnchor, constant: 15),
            buttonDown.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            buttonLeft.widthAnchor.constraint(equalToConstant: 50),
            buttonLeft.heightAnchor.constraint(equalToConstant: 50),
            buttonLeft.trailingAnchor.constraint(equalTo: centerXAnchor, constant: -15),
            buttonLeft.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            buttonRight.widthAnchor.constraint(equalToConstant: 50),
            buttonRight.heightAnchor.constraint(equalToConstant: 50),
            buttonRight.leadingAnchor.constraint(equalTo: centerXAnchor, constant: 15),
            buttonRight.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            buttonUp.topAnchor.constraint(equalTo: topAnchor),
            buttonDown.bottomAnchor.constraint(equalTo: bottomAnchor),
            buttonRight.trailingAnchor.constraint(equalTo: trailingAnchor),
            buttonLeft.leadingAnchor.constraint(equalTo: leadingAnchor)
            
        ])
                
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func buttonUpTapped(_ sender: UIButton) {
        closureButtonUp?(self)
    }
    
    @objc func buttonDownTapped(_ sender: UIButton) {
        closureButtonDown?(self)
    }
    
    @objc func buttonLeftTapped(_ sender: UIButton) {
        closureButtonLeft?(self)
    }
    
    @objc func buttonRightTapped(_ sender: UIButton) {
        closureButtonRight?(self)
    }
    
}
