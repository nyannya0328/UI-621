//
//  Home.swift
//  UI-621
//
//  Created by nyannyan0328 on 2022/07/25.
//

import SwiftUI

struct Home: View {
    @Namespace var animation
    @State var expandCard : Bool = false
    @State var showContent : Bool = false
    
    @State var showLottieAnimation : Bool = false
    var body: some View {
        VStack{
            
            HStack{
                
                HStack{
                    
                    Image(systemName: "applelogo")
                    Text("Pay")
                        
                }
                .font(.title)
                .foregroundColor(.white)
                
                Spacer()
                
                
                
                Button {
                    
                } label: {
                    
                    Text("BACK")
                        .font(.title2)
                        .foregroundColor(.white)
                }
                

                
            }
            
            
            CardView()
            
            
            Text("Whooo")
                .font(.largeTitle)
            
            Text("When you send or receive money with someone, you each earn a scratch card that can contain amazing prices !!")
                .kerning(1.02)
                .multilineTextAlignment(.center)
                .padding(.vertical)
            
            
            Button {
                
            } label: {
                
                Text("VIEW BURANCE")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding(.vertical,20)
                    .frame(maxWidth: .infinity,alignment: .center)
                    .background{
                     
                        Rectangle()
                            .fill(
                            
                                LinearGradient(colors: [Color("Purple"),Color("Purple1")], startPoint: .leading, endPoint: .trailing)
                            
                            )
                        
                        
                    }
            }

            
            
            
            
        }
        .padding(15)
        .frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .top)
        .background{
         
            Color("BG").ignoresSafeArea()
               
        }
        .overlay {
            
            Rectangle()
                .fill(.ultraThinMaterial)
                .opacity(showContent ? 1 : 0)
                .ignoresSafeArea()
        }
        .overlay {
            
            GeometryReader{proxy in
                
                 let size = proxy.size
                
                if expandCard{
                    
                    giftCardView(size: size)
                        .overlay {
                            
                            if showLottieAnimation{
                                
                                AnimatedLottieView(lottiename: "Party") { view in
                                    
                                    
                                    withAnimation(.easeInOut){
                                        
                                        showLottieAnimation = false
                                    }
                                    
                                }
                                .scaleEffect(1.5)
                                .clipShape(RoundedRectangle(cornerRadius: 10,style: .continuous))
                                
                                
                            }
                        }
                        .matchedGeometryEffect(id: "GIFTCARD", in: animation)
                        .transition(.asymmetric(insertion: .identity, removal: .offset(x:1)))
                         .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .onAppear{
                            
                            
                            withAnimation(.easeInOut(duration: 0.35)){
                                
                                
                                showContent = true
                                showLottieAnimation = true
                            }
                        }
                }
            }
            .padding(30)
        }
        .overlay(alignment:.topTrailing) {
            
            
            Button {
                
                withAnimation(.easeOut(duration: 0.35)){
                    
                    showContent = false
                    showLottieAnimation = false
                    
                    
                }
                
                withAnimation(.easeOut(duration: 0.35).delay(0.1)){
                    
                    
                    expandCard = false
                    
                }
                
                
            } label: {
                
                Image(systemName: "xmark")
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding(15)
                
            }
            .opacity(showContent ? 1 : 0)
            
            

        }
        .preferredColorScheme(.dark)
        
    }
    @ViewBuilder
    func CardView()->some View{
        
        GeometryReader{proxy in
            
             let size = proxy.size
            
            
            ScratchCardView(pointSize: 60) {
                
                if !expandCard{
                    
                    giftCardView(size: size)
                        .matchedGeometryEffect(id: "GIFTANIMATION", in: animation    )
                }
                
                
            } overlay: {
                
                Image("Card")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.width * 0.9,height: size.width * 0.9,alignment: .topLeading)
                    .clipShape(RoundedRectangle(cornerRadius: 10,style: .continuous))
                
            } onFinish: {
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
                    
                    
                    withAnimation(.interactiveSpring(response: 0.6,dampingFraction: 0.7, blendDuration: 0.7)){
                        
                        
                        expandCard = true
                    }
                }
              
                
            }
            .frame(width: size.width,height: size.height)

            
        }
        .padding(15)
    }
    @ViewBuilder
    func giftCardView(size : CGSize)->some View{
        
        
        VStack(spacing:15){
            
            Image("Trophy")
                .resizable()
                .aspectRatio(contentMode: .fill)
                 .frame(width: 120,height: 120)
            
            Text("You Won")
                .font(.callout)
                .foregroundColor(.gray)
            
            
            HStack{
                
                Image(systemName:"applelogo")
                Text("$59")
            }
            .foregroundColor(.white)
            
            Text("It will be credited within 24 hours")
                .font(.caption)
                .foregroundColor(.gray)
            
            
        }
        .padding(20)
        .frame(width: size.width * 0.9,height: size.width * 0.9)
        .background{
         
            RoundedRectangle(cornerRadius: 10,style: .continuous)
                .fill(.white)
        }
        
        
        
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
