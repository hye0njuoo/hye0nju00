//
//  ViewController.swift
//  claculater No Snapkit
//
//  Created by 성현주 on 2023/04/30.
//

import UIKit
import SnapKit


//버튼
class ViewController: UIViewController {
    lazy var plusButton = {
        let button = UIButton()
        button.backgroundColor = .systemTeal
        button.setTitle("더하기", for: .normal)
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(plus), for: .touchUpInside)
        return button
    }()
    @objc func plus(){
        if let num1 = firstTextField.text,
           let num2 = secondTextField.text{
            if let a = Int(num1),
               let b = Int(num2){
                Display.text = "\(a) + \(b) = \(a+b)"
            }else{
                Display.text = "숫자만 입력해주세요."
                Display.textColor = .black
            }
        }
    }
   
    lazy var minButton = {
       let button = UIButton()
       button.backgroundColor = .systemTeal
       button.setTitle("뺴기", for: .normal)
       button.layer.cornerRadius = 20
       button.addTarget(self, action: #selector(minus), for: .touchUpInside)
       return button
   }()
    @objc func minus(){
        if let num1 = firstTextField.text,
           let num2 = secondTextField.text{
            if let a = Int(num1),let b = Int(num2){
                Display.text = "\(a) - \(b) = \(a-b)"
            }else{
                Display.text = "숫자만 입력해주세요."
                Display.textColor = .black
            }
        }
    }
    
    lazy var mulButton = {
        let button = UIButton()
        button.backgroundColor = .systemTeal
        button.setTitle("곱하기", for: .normal)
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(mul), for: .touchUpInside)
        return button
    }()
    @objc func mul(){
        if let num1 = firstTextField.text,
           let num2 = secondTextField.text{
            if let a = Int(num1),let b = Int(num2){
                Display.text = "\(a) X \(b) = \(a*b)"
            }else{
                Display.text = "숫자만 입력해주세요."
                Display.textColor = .black
            }
        }
    }
  
    lazy var divButton = {
       let button = UIButton()
       button.backgroundColor = .systemTeal
       button.setTitle("나누기", for: .normal)
       button.layer.cornerRadius = 20
       button.addTarget(self, action: #selector(div), for: .touchUpInside)
       return button
    }()
    @objc func div(){
        if let num1 = firstTextField.text,
           let num2 = secondTextField.text{
            if let a = Int(num1),
               let b = Int(num2){
                if b != 0{
                    Display.text = "\(a) / \(b) = \(a/b)"
                }else{
                    Display.text = "0으로 나눌수 없습니다."
                    Display.textColor = .gray
                }
            }else{
                Display.text = "숫자만 입력해주세요."
                Display.textColor = .black
            }
        }
    }
   
    //텍스트 필드
    lazy var firstTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "첫번째 숫자를 입력해주세요."
        let padding = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftView = padding
        textField.leftViewMode = .always
        textField.backgroundColor = .systemGray6
        textField.layer.cornerRadius = 20
        textField.addTarget(self, action: #selector(live1), for: UIControl.Event.editingChanged)
        return textField
        }()
    @objc func live1(){
        Display.text = "숫자를 모두 입력해주세요."
        Display.textColor = .gray
    }

    lazy var secondTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "두번째 숫자를 입력해주세요."
        let padding = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftView = padding
        textField.leftViewMode = .always
        textField.backgroundColor = .systemGray6
        textField.layer.cornerRadius = 20
        textField.addTarget(self, action: #selector(live2), for: UIControl.Event.editingChanged)
        return textField
        }()
    @objc func live2(){
        Display.text = "버튼을 눌러주세요!"
        Display.textColor = .black
    }
    
    //라벨
    lazy var Display : UILabel = {
        let label = UILabel()
        label.text = "값을 입력해주세요."
        label.font = .systemFont(ofSize: 15)
        label.textColor = .gray
        label.textAlignment = .center
        label.layer.cornerRadius = 20
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.plusButton)
        self.view.addSubview(self.minButton)
        self.view.addSubview(self.mulButton)
        self.view.addSubview(self.divButton)
        self.view.addSubview(self.firstTextField)
        self.view.addSubview(self.secondTextField)
        self.view.addSubview(self.Display)
        
            
        
        
        
        //레이아웃
        plusButton.snp.makeConstraints{ (make) in
            make.width.equalTo(300)
            make.height.equalTo(39)
            make.centerX.equalToSuperview()
            make.top.equalTo(320)
        }
        minButton.snp.makeConstraints{ (make) in
            make.width.equalTo(300)
            make.height.equalTo(39)
            make.centerX.equalToSuperview()
            make.top.equalTo(plusButton.snp.bottom).offset(10)
            
        }
        mulButton.snp.makeConstraints{ (make) in
            make.width.equalTo(300)
            make.height.equalTo(39)
            make.centerX.equalToSuperview()
            make.top.equalTo(minButton.snp.bottom).offset(10)
        }
        divButton.snp.makeConstraints{ (make) in
            make.width.equalTo(300)
            make.height.equalTo(39)
            make.centerX.equalToSuperview()
            make.top.equalTo(mulButton.snp.bottom).offset(10)
        }
        firstTextField.snp.makeConstraints{(make) in
            make.width.equalTo(300)
            make.height.equalTo(39)
            make.centerX.equalToSuperview()
            make.top.equalTo(157)
        }
        secondTextField.snp.makeConstraints{(make) in
            make.width.equalTo(300)
            make.height.equalTo(39)
            make.centerX.equalToSuperview()
            make.top.equalTo(firstTextField.snp.bottom).offset(10)
        }
        Display.snp.makeConstraints{(make) in
            make.width.equalTo(200)
            make.height.equalTo(22)
            make.centerX.equalToSuperview()
            make.top.equalTo(secondTextField.snp.bottom).offset(20)
        }
       
            
       
            
        }
        
    }

