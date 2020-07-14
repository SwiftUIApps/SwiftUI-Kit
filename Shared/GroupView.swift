//
//  GroupView.swift
//  SwiftUI Kit
//
//  Created by Jordan Singer on 7/10/20.
//

import SwiftUI

struct GroupView<Content: View>: View {
    var title: String
    let content: () -> Content
    
    @ViewBuilder var body: some View {
        #if os(iOS)
       listView
        .navigationBarTitle(title, displayMode: .inline)
        #else
        ScrollView {
            content().padding()
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
        #endif
    }
    
//    func listStyle<T: ListStyle>() -> T {
//        if #available(iOS 14.0, *) {
//            return InsetGroupedListStyle() as! T
//        } else {
//            return GroupedListStyle() as! T
//        }
//    }
    
    #if os(iOS)
    @ViewBuilder var listView: some View {
        if #available(iOS 14.0, *) {
            insetGroupList_14
        } else {
            groupedList
        }
    }
    
    @available(iOS 14.0, *)
    var insetGroupList_14: some View {
        List {
            content()
        }
        .listStyle(InsetGroupedListStyle())
    }
    
    var groupedList: some View {
        List {
            content()
        }
        .listStyle(GroupedListStyle())
    }
    #endif
}

struct GroupView_Previews: PreviewProvider {
    static var previews: some View {
        GroupView(title: "Group", content: { Text("Content") })
            .previewLayout(.sizeThatFits)
    }
}
