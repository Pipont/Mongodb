db.createCollection("examenes",{
    validator:{
    $jsonSchema:{
        bsonType: "object",
        description: "Document describing examen",
        required: ["_id", "descripcion", "peso", "fecha_inicio", "fecha_fin"],
        properties:{
            "_id": {
                bsonType: "string",
                description: "id must be a string and is required",

            },
            "peso":{
                bsonType: "int",
                description: "peso must be a int and is required",
            },
            "fecha_inicio":{
                bsonType: "date",
                description: "fecha_inicio must be a date and is required"
            },
            "fecha_fin":{
                bsonType: "date",
                description: "fecha_fin must be a date and is required"
            }
        }
    }
    },
validationAction: "error",
validationLevel: "strict",
});