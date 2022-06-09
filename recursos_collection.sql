db.createCollection("recursos",{
    validator:{
    $jsonSchema:{
        bsonType: "object",
        description: "Document describing a recurso",
        required: ["_id", "descripcion", "titulo", "tipo", "enlace"],
        properties:{
            "_id":{
                bsonType: "string",
                description: "id must be a string and is required",
            },
            "descripcion":{
                bsonType: "string",
                description: "descripcion must be a string and is required",
            },
            "titulo":{
                bsonType: "string",
                description: "titulo must be a string and is required",
            },
            "tipo":{
                enum: ["Video", "Texto"],
                description: "tipo only can be one of enums either Video or Texto",
            },
            "enlace":{
                bsonType: "string",
                pattern: ".com",
                description: "enlace must be a string with .com pattern",
            }
        }
    }
    },
validationAction: "error",
validationLevel: "strict",
});