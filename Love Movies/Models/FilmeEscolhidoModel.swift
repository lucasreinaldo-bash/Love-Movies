//
//  FilmeEscolhidoModel.swift
//  Love Movies
//
//  Created by Lucas Reinaldo on 27/08/20.
//  Copyright © 2020 Vostore. All rights reserved.
//

import Foundation

class FilmeEscolhidoModel {
    
    var title,descricao,imagemUrl, anoLancamento: String
   
    
    
    init(title : String,descricao: String, imagemUrl : String, anoLancamento : String) {
        
        
        self.title = title
        self.descricao = descricao
        self.imagemUrl = imagemUrl
        self.anoLancamento = anoLancamento
        
        
        
    }
}
