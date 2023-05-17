//
//  Paywall.swift
//  Solarsystem
//
//  Created by Ali Siddique on 15/05/2023.
//

import SwiftUI
import RevenueCat
struct Paywall: View {
    var items = ["Quiz", "Live", "News", "Item 4"]
    @State private var showLoader:Bool = false
    var body: some View {
        VStack(spacing:16) {
            TabView {
                       ForEach(items, id: \.self) { item in
                           Text(item)
                               .font(.largeTitle)
                               .foregroundColor(.white)
                               .padding()
                       }
                   }

                   .tabViewStyle(PageTabViewStyle())
               .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
               .background(Image("Earth"))

            Text("Why you should buy it")
                .frame(height: 200)
                .foregroundColor(.white)
            if(showLoader){
                ProgressView()
            }
            Button {
                Purchases.shared.getOfferings { offerings , error in
                    if let packages = offerings?.current?.availablePackages {
                        showLoader = true
                        Purchases.shared.purchase(package: packages.first!) { transaction, purchaserinfo, error, userCancelled in
                            print("transaction \(String(describing: transaction))")
                            if purchaserinfo?.entitlements["astrolifetime"]?.isActive == true {
                                print("purchase successful")
                                showLoader = false
                            }
                        }
                    }
                    showLoader = false

                }
            } label: {
                Text("One time payment")
                    .foregroundColor(.white)
                    .font(.system(.headline))
                    .padding()
            }
            .background(.blue)
            .mask(RoundedRectangle(cornerRadius: 30))
            .frame(height: 200) // Adjust the height according to your needs

        }
        .frame(maxHeight:.infinity)
        .background(.black)
    }
}

struct Paywall_Previews: PreviewProvider {
    static var previews: some View {
        Paywall()
    }
}
