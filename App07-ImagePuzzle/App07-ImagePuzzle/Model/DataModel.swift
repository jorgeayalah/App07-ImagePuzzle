//
//  DataModel.swift
//  App07-ImagePuzzle
//
//  Created by A00828633 on 14/10/21.
//

import SwiftUI
class DataModel: ObservableObject{
    @Published var images = [Img]()
    @Published var currentImage: Img?
    
    init(){
        loadImages()
    }
    
    func loadImages(){
        images = [
        Img(id: 0, image: "santacruz-0"),
        Img(id: 1, image: "santacruz-1"),
        Img(id: 2, image: "santacruz-2"),
        Img(id: 3, image: "santacruz-3"),
        Img(id: 4, image: "santacruz-4"),
        Img(id: 5, image: "santacruz-5"),
        Img(id: 6, image: "santacruz-6"),
        Img(id: 7, image: "santacruz-7"),
        Img(id: 8, image: "santacruz-8"),
        Img(id: 9, image: "santacruz-9"),
        Img(id: 10, image: "santacruz-10"),
        Img(id: 11, image: "santacruz-11"),
        Img(id: 12, image: "santacruz-12"),
        Img(id: 13, image: "santacruz-13"),
        Img(id: 14, image: "santacruz-14"),
        Img(id: 15, image: "santacruz-15") ]
    }
}
