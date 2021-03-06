//
//  CreateOrderInteractor.swift
//  CleanSwiftArchitecture
//
//  Created by Tshepo on 2017/08/01.
//  Copyright (c) 2017 none. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol CreateOrderBusinessLogic
{
  func domultiply(request: CreateOrder.Something.Request)
  func makedouble(request:CreateOrder.Something.Request)
}

protocol CreateOrderDataStore
{
  var value: Double { get set }
}

class CreateOrderInteractor: CreateOrderBusinessLogic, CreateOrderDataStore
{
  

  var presenter: CreateOrderPresentationLogic?
  var worker: CreateOrderWorker?
  var value: Double = 0
  
  // MARK: Do something
  
  func domultiply(request: CreateOrder.Something.Request)
  {
    value = request.multiply
    
    worker = CreateOrderWorker()
    
    let newworkedvalue =  worker?.Square(value:value)
    
    let response = CreateOrder.Something.Response(nextlevel:newworkedvalue!)
    presenter?.presentSomething(response: response)
  }
    
    
    func makedouble(request: CreateOrder.Something.Request) {
        
        let doublevalue  = request.multiply // request parameter for worker from request 
        worker = CreateOrderWorker()  // worker started
        
        let newdouledvalue = worker?.Double(value: doublevalue) // work is completed by worker
        
        let response = CreateOrder.Something.Response(nextlevel: newdouledvalue!)
        presenter?.presentSomething(response: response)

    }
  
}
