//
//  GifImage.swift
//  Cooper
//
//  Created by kevin marinho on 22/09/22.
//

import SwiftUI
import WebKit

struct Gif: UIViewRepresentable{
    private let name: String

    init(_ name: String){
        self.name = name
    }

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        let url = Bundle.main.url(forResource: name, withExtension: "gif")!
        let data = try! Data (contentsOf: url)
        
        uiView.load(data, mimeType: "image/gif", characterEncodingName: "UTF-8", baseURL: url.deletingLastPathComponent())
        uiView.isOpaque=false
        //uiView.reload()
    }

}

//struct Gif: UIViewRepresentable {
//    private let resourceName: String
//
//    init(_ resourceName: String) {
//        self.resourceName = resourceName
//    }
//
//    func makeUIView(context: Context) -> WKWebView {
//        let wView = WKWebView()
//        let url = Bundle.main.url(forResource: resourceName, withExtension: ".gif")!
//        let data = try! Data(contentsOf: url)
//
//        wView.load(data,
//                   mimeType: "image/gif",
//                   characterEncodingName: "UTF-8",
//                   baseURL: url.deletingLastPathComponent())
//
//        return wView
//    }
//
//    func updateUIView(_ uiView: WKWebView, context: Context) {
//        uiView.reload()
//    }
//}

struct GifImage_Previews: PreviewProvider {
    static var previews: some View {
        Gif("commuHappyCloseAyesG")
    }
}
