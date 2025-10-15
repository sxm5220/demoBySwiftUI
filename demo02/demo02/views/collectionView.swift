//
//  collectionView.swift
//  demo02
//
//  Created by 宋晓明 on 2025/9/16.
//

import SwiftUI

struct CollectionView: View {
    
    @EnvironmentObject var cartManager: CartManager
    
    @Environment(\.presentationMode) var mode
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    //Header view
                    buildHeaderView
                    //gridview
                    buildGridView
                }
            }
        }
    }
    
    //Header view
    var buildHeaderView: some View {
        HStack {
            Text("Order From The Best OF **Snacks**")
                .font(.system(size: 30))
                .padding(.trailing)
            
            Spacer()
            
            Button {
                mode.wrappedValue.dismiss()
            } label: {
                Image(systemName: "arrow.left")
                    .imageScale(.large)
                    .padding()
                    .frame(width: 70,height: 90)
                    .overlay(RoundedRectangle(cornerRadius: 50).stroke().opacity(0.4))
            }
            .foregroundColor(.black)

        }.padding(30)
    }
    
    //gridview
    var buildGridView: some View {
        LazyVGrid(columns: [GridItem(.flexible()),GridItem(.flexible())]) {
            ForEach(productList,id: \.id){ item in
                SmallProductCard(product: item)
                    .environmentObject(cartManager)
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    CollectionView()
        .environmentObject(CartManager())
}

struct SmallProductCard: View {
    var product: ProductModel
    
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View{
        ZStack{
            Image(product.image)
                .resizable()
                .scaledToFit()
                .padding(.trailing,-200)
                .rotationEffect(Angle(degrees: 30))
            
            ZStack {
                VStack(alignment: .leading, content: {
                    Text(product.name)
                        .font(.system(size: 30,weight: .semibold))
                        .frame(width: 110)
                    
                    Text(product.category)
                        .font(.callout)
                        .padding()
                        .background(.white.opacity(0.5))
                        .clipShape(Capsule())
                    
                    Spacer()
                    
                    HStack {
                        Text("$\(product.price).0")
                            .font(.system(size: 20,weight: .semibold))
                        Spacer()
                        Button {
                            cartManager.addToCart(product: product)
                        } label: {
                            Image(systemName: "basket")
                                .imageScale(.large)
                                .frame(width: 60, height: 50)
                                .background(.black)
                                .clipShape(Capsule())
                                .foregroundColor(.white)
                        }
                        
                    }
                    .padding(.trailing,-10)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background(.white.opacity(0.5))
                    .clipShape(Capsule())
                })
            }
            
            }
            .padding()
            .frame(width: 190,height: 260)
            .background(product.color.opacity(0.13))
            .clipShape(.rect(cornerRadius: 30))
            .padding(.leading,5)
    }
}
