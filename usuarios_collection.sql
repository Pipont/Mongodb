use Signlator;
db.createCollection("usuarios", {
validator:{
    $jsonSchema: {
        bsonType: "object",
        required: ["_id","nombre", "apellido", "sexo", "correo", "cursos_inscrito", "apoderado", "telefono", "localizacion","segmento"],
        properties: {
            _id:{
                bsonType: "string",
                minLength: 8,
                description: "DNI must be a string and is required"
            },
            nombre: {
                bsonType: "string",
                description: "nombre must be a string and is required"
            },
            apellido:{
                bsonType: "string",
                description: "apellido must be a string and is optional"
            },
            sexo:{
                enum: ["Masculino", "Femenino"],
                description: "sexo can only be either 'Masculino' or 'Femenino' and is optional"
            },
            correo: {
                bsonType: "string",
                pattern: "@hotmail\.com",
                description: "Email must be a string and is required",
            },

            localizacion:{
                bsonType: "object",
                required: ["distrito", "ciudad","pais"],
                properties:{
                    distrito: {
                        bsonType: "string",
                        description: "distrito must be a string and is required"
                    },
                    ciudad:{
                        bsonType: "string",
                        description: "ciudad must be a string and is required"
                    },
                    pais: {
                        bsonType: "string",
                        description: "pais must be a string and is required"
                    }
                }
            },
            segmento:{
                enum: ["Persona con discapacidad auditiva", "Persona cercana a persona con discapacidad auditiva", "Persona interesada en aprender lenguaje de señas"],
                description: "can only be one of the segment values and is required"
            },
            telefono:{
                bsonType: "int",
                minium: 900000000,
                maximum: 999999999,
                description: "telefono must be an int",
            },
            cursos_inscrito: {
                bsonType: "array",
                description: "cursos inscrito must be an array of objects and is optional",
                minItems: 1,
                uniqueItems: true,
                items:{
                    bsonType: "object",
                    required: ["curso", "_id","progreso", "fecha_inscripcion", "estado"],
                }
            },
            apoderado:{
                bsonType: "object",
                description: "apoderado must be and object and is optional",
                required: ["nombre", "parentesco"],
                properties:{
                    nombre:{
                    bsonType:"string",
                    description: "nombre must be and string and is required",
                },
                    parentesco:{
                    bsonType: "string",
                    description: "parentesco must be and string and is required"
                    }
                }
            }
        },
    }
},
validationAction: "error",
validationLevel: "strict",
});
