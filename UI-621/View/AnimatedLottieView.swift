//
//  AnimatedLottieView.swift
//  UI-621
//
//  Created by nyannyan0328 on 2022/07/25.
//

import SwiftUI
import Lottie

struct AnimatedLottieView: UIViewRepresentable {
    let lottiename : String
    var onFinish : (AnimationView) -> ()
    
    func makeUIView(context: Context) -> UIView {
        
        let view = UIView()
        view.backgroundColor = .clear
        
        setUp(view: view)
        
        return view
    }
    func updateUIView(_ uiView: UIView, context: Context) {
        
    
        
      
    }
    
    func setUp(view to : UIView){
        
        let animatioView = AnimationView(name: lottiename,bundle: .main)
        animatioView.backgroundColor = .clear
        animatioView.translatesAutoresizingMaskIntoConstraints = false
        animatioView.shouldRasterizeWhenIdle = true
        
        let contains = [
            animatioView.widthAnchor.constraint(equalTo: to.widthAnchor),
            animatioView.heightAnchor.constraint(equalTo: to.heightAnchor)
        
        
        ]
        
        to.addConstraints(contains)
        to.addSubview(animatioView)
        
        animatioView.play{_ in
            
        onFinish(animatioView)
            
            
        }
        
        
        
        
    }
    

}

