//
//  customTabView.swift
//  customTab
//
//  Created by flash mnisi on 2024/06/20.
//

import SwiftUI

struct customTabView: View {
    @Binding var tabSelection: Int
    @Namespace private var animationNamespace
    
    let tabBarItems: [(image: String ,title: String)] = [
        ("house", "Home"),
        ("magnifyingglass", "Search"),
        ("heart", "Favourates"),
        ("person", "Profile"),
        ("gear", "Settings")
    ]
    var body: some View {
        ZStack {
            Capsule()
                .frame(height: 80)
                .foregroundColor(Color(.secondarySystemBackground))
                .shadow(radius: 2)
            
            HStack {
                ForEach(0..<5) { index in
                    Button {
                        tabSelection = index + 1
                    } label: {
                        VStack(spacing: 8) {
                            Spacer()
                            
                            Image(systemName: tabBarItems[index].image)
                            Text(tabBarItems[index].title)
                                .font(.caption)
                            
                            if index + 1 == tabSelection {
                                Capsule()
                                    .frame(height: 8)
                                    .foregroundColor(.red)
                                    .matchedGeometryEffect(id: "SelectedTabId", in: animationNamespace)
                                    .offset(y:3)
                            } else {
                                Capsule()
                                    .frame(height: 8)
                                    .foregroundColor(.clear)
                                    .offset(y:3)
                            }
                        }
                        .foregroundColor(index + 1 == tabSelection ? .blue : .gray)
                    }

                }
            }
            .frame(height: 80)
            .clipShape(Capsule())
        }
        .padding(.horizontal)
    }
}

#Preview {
    customTabView(tabSelection: .constant(1))
        .previewLayout(.sizeThatFits)
        .padding(.vertical)
}
