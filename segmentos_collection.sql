use Signlator;
db.createCollection("segmentos", {
    validator:{
        $jsonSchema:{
         bsonType: "object",
         required: ["_id", "caracteristicas"],
         properties:{
            _id:{
                enum: ["Persona con discapacidad auditiva", "Persona cercana a persona con discapacidad auditiva", "Persona interesada en aprender lenguaje de señas"],
                description: "nombre must be a string and is required"
            },
            caracteristicas:{
                bsonType: "array",
                minItems:1,
                description: "caracteristicas must be an array of strings",
                uniqueItems: true,
                items:{
                    bsonType: "string",
                }
            },
            usuarios:{
                bsonType: "array",
                minItems: 1,
                description: "usuarios must be an array of string reference DNI's",
                items:{
                    bsonType: "string"
                }
            }
         }
        }
    },
validationAction: "warn",
validationLevel: "strict",
}
);