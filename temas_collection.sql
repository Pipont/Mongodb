db.createCollection("temas", {
    validator:{
        $jsonSchema:{
            bsonType: "object",
            description: "Document describing temas",
            required: ["nombre", "descripcion", "examenes", "recursos"],
            properties:{
                nombre: {
                bsonType: "string",
                description: "nombre must be a string and is required "
                },
                descripcion: {
                bsonType: "string",
                description: "descripcion must be a string and is required"
                },
                examenes:{
                bsonType: "array",
                minItems: 1,
                description: "unidades must be an array of strings",
                items:{
                    bsonType: "string"
                }},
                recursos:{
                bsonType: "array",
                minItems: 1,
                description: "recursos must be an array of strings",
                items:{
                    bsonType: "string"
                }
                }}
        }
    },
validationAction: "error",
validationLevel: "strict",

});
