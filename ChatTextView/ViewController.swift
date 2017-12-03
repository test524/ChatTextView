//
//  ViewController.swift
//  ChatTextView
//
//  Created by Pavan Kumar Reddy on 04/11/17.
//  Copyright © 2017 Pavan. All rights reserved.
//

import UIKit

public var WIDTH = UIScreen.main.bounds.size.width

class ViewController: UIViewController   {

    var rect = CGRect.init(x: 0, y: 0, width: WIDTH, height: 50)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    lazy var accessoryObj = AccessoryView()
    
    override var inputAccessoryView: UIView?
    {
        return accessoryObj
    }
    
    override var canBecomeFirstResponder: Bool
    {
        return true
    }
}

//MARK:- AccessoryView Class
class AccessoryView:UIView , UITextViewDelegate
{
    //@
    override var intrinsicContentSize: CGSize {
        let textSize = textView.sizeThatFits(CGSize(width: textView.bounds.width, height: CGFloat.greatestFiniteMagnitude))
        return CGSize(width: bounds.width, height: textSize.height)
    }
    
    //@
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        self.backgroundColor = self.tintColor
        autoresizingMask = .flexibleHeight
        
        addSubview(imgCamera)
        addSubview(textView)
        
        NSLayoutConstraint.activate([
            
            imgCamera.leadingAnchor.constraint(equalTo: leadingAnchor, constant:8),
            imgCamera.widthAnchor.constraint(equalToConstant: 40),
            imgCamera.heightAnchor.constraint(equalToConstant: 40),
            imgCamera.bottomAnchor.constraint(equalTo: bottomAnchor , constant: -5),
            
            textView.leftAnchor.constraint(equalTo: imgCamera.rightAnchor , constant: 10),
            textView.trailingAnchor.constraint(equalTo: trailingAnchor , constant: -10),
            textView.topAnchor.constraint(equalTo: topAnchor , constant:5),
            textView.bottomAnchor.constraint(equalTo: bottomAnchor , constant: -5),
            
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //@ TextView delegate
    func textViewDidChange(_ textView: UITextView)
    {
        _ = self.intrinsicContentSize
    }
    
    //@
    let imgCamera:UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = UIColor.white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "camera")
        return imageView
    }()
    
    //@
    lazy var textView:UITextView = {
        let txtVW = UITextView()
        txtVW.translatesAutoresizingMaskIntoConstraints = false
        txtVW.layer.borderColor = UIColor.lightGray.cgColor
        txtVW.layer.borderWidth = 1.0
        txtVW.font = UIFont.boldSystemFont(ofSize: 20)
        txtVW.layer.cornerRadius = 14
        txtVW.clipsToBounds = true
        txtVW.isScrollEnabled = false
        txtVW.backgroundColor = UIColor.white
        txtVW.delegate =  self
        return txtVW
    }()

}


