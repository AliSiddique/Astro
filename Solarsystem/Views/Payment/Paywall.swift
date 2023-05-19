//
//  Paywall.swift
//  Solarsystem
//
//  Created by Ali Siddique on 15/05/2023.
//

import SwiftUI
import RevenueCat
struct Paywall: View {
    var items = ["Quiz", "Live", "News", "ARKIT"]
    @State private var showLoader: Bool = false
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 16) {
            HStack{
                Text("Astro ")
                    .foregroundColor(.white)
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .padding()
                    .frame(maxWidth: .infinity,alignment:.leading)
                .frame(height: 60)
                Text("Pro")
                    .foregroundColor(.white)
                    .font(.system(size: 15))
                    .fontWeight(.bold)
                    .padding(10)
                    .background(.blue)
                    .mask(RoundedRectangle(cornerRadius: 15))
                    .frame(maxWidth: .infinity,alignment:.leading)

                .frame(height: 60)
            }
            TabView {
                ForEach(items, id: \.self) { item in
                    VStack {
                        AsyncImage(url: URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/60/Earth_from_Space.jpg/1200px-Earth_from_Space.jpg?20070814130228")) { image in
                                   image
                                       .resizable()
                                       .aspectRatio(contentMode: .fit)
                                       .ignoresSafeArea()
                               } placeholder: {
                                   ProgressView()
                               }
//                               .mask(RoundedRectangle(cornerRadius: 40))
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .frame(maxWidth: .infinity)
//                            .padding(.horizontal)
//
                        Text(item)
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .padding()
                        
                        Text("Description for \(item)")
                            .foregroundColor(.white)
                            .padding()
                            .opacity(0.4)
                    }
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .background(Color.black)
            
            Text("Unlock exclusive features and content to enhance your experience!")
                .foregroundColor(.white)
                .font(.system(size: 20))
                .padding(.horizontal, 20)
                .fontWeight(.bold)
                .frame(alignment: .center)
            
            if showLoader {
                ProgressView()
            }
            
            Button(action: {
                showLoader = true
                Purchases.shared.getOfferings { offerings, error in
                    if let packages = offerings?.current?.availablePackages {
                        Purchases.shared.purchase(package: packages.first!) { transaction, purchaserInfo, error, userCancelled in
                            print("transaction \(String(describing: transaction))")
                            if purchaserInfo?.entitlements["astrolifetime"]?.isActive == true {
                                print("purchase successful")
                                showLoader = false
                            }
                        }
                    }
                    showLoader = false
                }
            }) {
                Text("One time payment")
                    .foregroundColor(.white)
                    .font(.system(.headline))
                    .padding()
                    .frame(maxWidth: .infinity)

            }
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 30))
            .frame(height: 60)
            .padding(.horizontal,20)
            
  
            
            HStack {
                Button(action: {
                    // Handle terms and conditions button action
                }) {
                    Text("Terms and Conditions")
                        .foregroundColor(.white)
                        .font(.system(size: 14))
                        .padding()
                }
                
                Spacer()
                
                Button(action: {
                    // Handle restore purchases button action
                }) {
                    Text("Restore Purchases")
                        .foregroundColor(.white)
                        .font(.system(size: 14))
                        .padding()
                }
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 20)
            
        }
        .frame(maxHeight: .infinity)
        .background(Color.black)
    }
}

struct Paywall_Previews: PreviewProvider {
    static var previews: some View {
        Paywall()
    }
}



//
//Purchases.shared.getOfferings { offerings , error in
//    if let packages = offerings?.current?.availablePackages {
//        showLoader = true
//        Purchases.shared.purchase(package: packages.first!) { transaction, purchaserinfo, error, userCancelled in
//            print("transaction \(String(describing: transaction))")
//            if purchaserinfo?.entitlements["astrolifetime"]?.isActive == true {
//                print("purchase successful")
//                showLoader = false
//            }
//        }
//    }
//    showLoader = false
//
//}
