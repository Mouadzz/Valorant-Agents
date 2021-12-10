//
//  AgentPosters.swift
//  Valorant Agents
//
//  Created by Mouaad Lasritene on 10/12/2021.
//

import Foundation
import SwiftUI

struct AgentInfo {
    let color: Color
    let url: String
}

func getAgentPoster(name:String) -> AgentInfo {
    switch name {
        case "Brimstone":
            return AgentInfo(color: Color(hex: "#211c20"), url: "https://images.contentstack.io/v3/assets/bltb6530b271fddd0b1/blt26fcf1b5752514ee/5eb7cdbfc1dc88298d5d3799/V_AGENTS_587x900_Brimstone.png")
            
        case "Phoenix":
            return AgentInfo(color: Color(hex: "#f97d3d"), url: "https://images.contentstack.io/v3/assets/bltb6530b271fddd0b1/bltf0200e1821b5b39f/5eb7cdc144bf8261a04d87f9/V_AGENTS_587x900_Phx.png")
            
        case "Sage":
            return AgentInfo(color: Color(hex: "#295256"), url: "https://images.contentstack.io/v3/assets/bltb6530b271fddd0b1/blt8a627ec10b57f4f2/5eb7cdc16509f3370a5a93b7/V_AGENTS_587x900_sage.png")
            
        case "Sova":
            return AgentInfo(color: Color(hex: "#197dcb"), url: "https://images.contentstack.io/v3/assets/bltb6530b271fddd0b1/bltf11234f4775729b7/5ebf2c275e73766852c8d5d4/V_AGENTS_587x900_ALL_Sova_2.png")
            
        case "Viper":
            return AgentInfo(color: Color(hex: "#15512e"), url: "https://images.contentstack.io/v3/assets/bltb6530b271fddd0b1/bltc825c6589eda7717/5eb7cdc6ee88132a6f6cfc25/V_AGENTS_587x900_Viper.png")
            
        case "Cypher":
            return AgentInfo(color: Color(hex: "#565662"), url: "https://images.contentstack.io/v3/assets/bltb6530b271fddd0b1/blt158572ec37653cf3/5eb7cdc19df5cf37047009d1/V_AGENTS_587x900_Cypher.png")
            
        case "Reyna":
            return AgentInfo(color: Color(hex: "#9b357f"), url: "https://images.contentstack.io/v3/assets/bltb6530b271fddd0b1/blt6577b1f58530e6b2/5eb7cdc121a5027d77420208/V_AGENTS_587x900_Reyna.png")
            
        case "Killjoy":
            return AgentInfo(color: Color(hex: "#b89e32"), url: "https://images.contentstack.io/v3/assets/bltb6530b271fddd0b1/blt53405c26141beff8/5f21fda671ec397ef9bf0894/V_AGENTS_587x900_KillJoy_.png")
            
        case "Breach":
            return AgentInfo(color: Color(hex: "#25312f"), url: "https://images.contentstack.io/v3/assets/bltb6530b271fddd0b1/blt100d13bfa8286a3d/5eb7cdc11ea0c32e33b95fa2/V_AGENTS_587x900_Breach.png")
            
        case "Omen":
            return AgentInfo(color: Color(hex: "#423755"), url: "https://images.contentstack.io/v3/assets/bltb6530b271fddd0b1/blt4e5af408cc7a87b5/5eb7cdc17bedc8627eff8deb/V_AGENTS_587x900_Omen.png")
            
        case "Jett":
            return AgentInfo(color: Color(hex: "#b1c7d8"), url: "https://images.contentstack.io/v3/assets/bltb6530b271fddd0b1/bltceaa6cf20d328bd5/5eb7cdc1b1f2e27c950d2aaa/V_AGENTS_587x900_Jett.png")
            
        case "Raze":
            return AgentInfo(color: Color(hex: "#e46936"), url: "https://images.contentstack.io/v3/assets/bltb6530b271fddd0b1/blt6fef56a8182d0a81/5ebf2c2798f79d6925dbd6b4/V_AGENTS_587x900_ALL_Raze_2.png")
            
        case "Skye":
            return AgentInfo(color: Color(hex: "#0ca988"), url: "https://images.contentstack.io/v3/assets/bltb6530b271fddd0b1/blt302fcb2b9628c376/5f7fa6ff8db9ea0f149ece0a/V_AGENTS_587x900_ALL_Skye.png")
            
        case "Yoru":
            return AgentInfo(color: Color(hex: "#465caa"), url: "https://images.contentstack.io/v3/assets/bltb6530b271fddd0b1/bltd4080f8efb365751/5ff5660bb47cdf7fc7d6c3dc/V_AGENTS_587x900_yoru.png")
            
        case "Astra":
            return AgentInfo(color: Color(hex: "#d489e1"), url: "https://images.contentstack.io/v3/assets/bltb6530b271fddd0b1/blt5599d0d810824279/6036ca30ce4a0d12c3ec1dfa/V_AGENTS_587x900_Astra.png")
            
        case "KAY/O":
            return AgentInfo(color: Color(hex: "#bcfeff"), url: "https://images.contentstack.io/v3/assets/bltb6530b271fddd0b1/blte5aefeb26bee12c8/60ca5aa30ece0255888d7faa/KAYO_KeyArt_587x900.png")
            
        case "Chamber":
            return AgentInfo(color: Color(hex: "#d3a668"), url: "https://images.contentstack.io/v3/assets/bltb6530b271fddd0b1/blt6f1392b30784e029/618d9da0d380f814d61f001c/WebUpdate_Chamber_KeyArt.png")
            
        default:
            return AgentInfo(color: Color(.white), url: "")
    }
}


