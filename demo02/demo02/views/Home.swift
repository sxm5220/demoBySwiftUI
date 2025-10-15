//
//  Home.swift
//  demo02
//
//  Created by 宋晓明 on 2025/9/16.
//

import SwiftUI

struct Home: View {
    
    @EnvironmentObject var cartManager: CartManager
    
    @State var selectedCategory = "Archery"
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    //Header view
                    buildHeaderView
                    //Category List View
                    buildCategoryListView
                    //Collection View
                    buildCollectionView
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
            
            Image(systemName: "line.3.horizontal")
                .imageScale(.large)
                .padding()
                .frame(width: 70,height: 90)
                .overlay(RoundedRectangle(cornerRadius: 50).stroke().opacity(0.4))
        }.padding(30)
    }
    
    //Category List View
    var buildCategoryListView: some View {
        HStack {
            ScrollView(.horizontal,showsIndicators: false){
                HStack{
                    ForEach(categoryList,id: \.id){ item in
                        Button {
                            selectedCategory = item.title
                        } label: {
                            HStack{
                                if item.title != "All" {
                                    Image(systemName: item.icon)
                                        .foregroundColor(selectedCategory == item.title ? .orange : .black)
                                }
                                Text(item.title)
                            }
                            .padding(20)
                            .background(selectedCategory == item.title ? .black : .gray.opacity(0.1))
                            .foregroundColor(selectedCategory == item.title ? .orange : .black)
                            .clipShape(Capsule())
                        }
                        
                    }
                }
                .padding(.horizontal,30)
            }
        }
    }
    
    //Collection View
    var buildCollectionView: some View{
        VStack{
            HStack {
                Text("\(selectedCategory) **Collections**")
                    .font(.system(size: 24))
                Spacer()
                
                NavigationLink {
                    CollectionView()
                        .environmentObject(cartManager)
                } label: {
                    Image(systemName: "arrow.right")
                        .imageScale(.large)
                }
                .foregroundColor(.black)
            }
            .padding(.horizontal, 30)
            .padding(.vertical, 15)
            
            Spacer()
            
            //product list
            ScrollView(.horizontal,showsIndicators: false) {
                HStack{
                    ForEach(productList,id:\.id){ item in
                        productCard(product: item)
                            .environmentObject(cartManager)
                    }
                }
                .padding()
            }
        }
    }
    
    
}

#Preview {
    Home()
        .environmentObject(CartManager())
}

struct productCard: View {
    
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
                        .font(.system(size: 36,weight: .semibold))
                        .frame(width: 140)
                    
                    Text(product.category)
                        .font(.callout)
                        .padding()
                        .background(.white.opacity(0.5))
                        .clipShape(Capsule())
                    
                    Spacer()
                    
                    HStack {
                        Text("$\(product.price).0")
                            .font(.system(size: 24,weight: .semibold))
                        Spacer()
                        Button {
                            cartManager.addToCart(product: product)
                        } label: {
                            Image(systemName: "basket")
                                .imageScale(.large)
                                .frame(width: 90, height: 68)
                                .background(.black)
                                .clipShape(Capsule())
                                .foregroundColor(.white)
                        }
                        
                    }
                    .padding(.leading)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 80)
                    .background(.white.opacity(0.95))
                    .clipShape(Capsule())
                })
            }
            
            }
            .padding(30)
            .frame(width: 360,height: 500)
            .background(product.color.opacity(0.13))
            .clipShape(.rect(cornerRadius: 30))
            .padding(.leading,20)
        }
    
}
