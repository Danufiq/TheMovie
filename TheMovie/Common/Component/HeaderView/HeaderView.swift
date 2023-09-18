//
//  HeaderView.swift
//  TheMovie
//
//  Created by dana nur fiqi on 18/09/23.
//

import Foundation
import UIKit

class HeaderView: UIView {
    
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var imgBack: UIImageView!
    
    var delegate : HeaderViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpView()
        setUpAction()
    }
    
    func loadViewFromNib(nibName: String) -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    private func setUpView(){
        guard let view = self.loadViewFromNib(nibName: "HeaderView") else{ return }
        view.frame = self.bounds
        self.addSubview(view)
    }
    
    private func setUpAction(){
        let tapBackGesture = UITapGestureRecognizer(target: self, action: #selector(onTapBack))
            imgBack.isUserInteractionEnabled = true
            imgBack.addGestureRecognizer(tapBackGesture)
    }
    
    @objc
    func onTapBack(){
        self.delegate?.pressBack()
    }
    
    
    
}
