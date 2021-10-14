//
//  DropViewDelegate.swift
//  App07-ImagePuzzle
//
//  Created by Alumno on 14/10/21.
//

import SwiftUI

struct DropViewDelegate: DropDelegate{
    //DropViewDelegate needs some functions inside to be conformed and operate
    var image: Img
    var dataModel: DataModel
    @Binding var isCompleted: Bool
    
    func performDrop(info: DropInfo) -> Bool {
        //print("hola")
        let fromIndex = dataModel.images.firstIndex { (img) -> Bool in
            return img.id == dataModel.currentImage?.id
        } ?? 0
        let toIndex = dataModel.images.firstIndex { (img) -> Bool in
            return img.id == image.id
        } ?? 0
        
        if(fromIndex != toIndex){
            print("from: \(fromIndex) to \(toIndex)")
            
//            let fromImage = dataModel.images[fromIndex]
//            dataModel.images[fromIndex] = dataModel.images[toIndex]
//            dataModel.images[toIndex] = fromImage
            dataModel.images.swapAt(fromIndex, toIndex)
            if dataModel.currentImage?.id == dataModel.images[toIndex].id{ //verifies if the swap is right to validate the rest of the grid
                if validatePuzzle() {
                    isCompleted = true
                }else{
                    isCompleted = false
                }
                //
            }
        }
        return true 
    }
    
    func dropEntered(info: DropInfo) {
        print("to: ", image.id)
        print(dataModel.currentImage!.id)
    }
    
    func dropUpdated(info: DropInfo) -> DropProposal? { //can use operation: forbidden to forbid being moved
        return DropProposal(operation: .move)
    }
    
    private func validatePuzzle() -> Bool {
        for index in 0..<dataModel.images.count {
            if dataModel.images[index].id != index{
                return false
            }
        }
        return true
    }
    
}
